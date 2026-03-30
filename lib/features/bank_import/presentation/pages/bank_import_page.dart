import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/di/service_locator.dart';
import '../../data/services/bank_rule_engine.dart';
import '../../domain/bank_smart_rule.dart';
import '../bloc/bank_import_bloc.dart';
import '../widgets/import_batch_list.dart';
import '../widgets/bank_account_selector.dart';
import '../widgets/file_picker_widget.dart';

class BankImportPage extends StatelessWidget {
  const BankImportPage({
    super.key,
    this.groupId,
  });

  /// Pass from Ledger so reconciliation can match against this group’s records.
  final String? groupId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BankImportBloc>()
        ..add(const LoadImportBatches())
        ..add(const LoadBankAccounts()),
      child: BankImportView(groupId: groupId),
    );
  }
}

class BankImportView extends StatefulWidget {
  const BankImportView({super.key, this.groupId});

  final String? groupId;

  @override
  State<BankImportView> createState() => _BankImportViewState();
}

class _BankImportViewState extends State<BankImportView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<BankSmartRule> _rules = const [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _loadRules();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bank Import'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.upload_file), text: 'Import'),
            Tab(icon: Icon(Icons.receipt_long), text: 'Reconcile'),
            Tab(icon: Icon(Icons.auto_fix_high), text: 'Rules'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ImportTab(),
          ReconcileTab(groupId: widget.groupId ?? 'default'),
          _RulesTab(
            rules: _rules,
            onAddRule: _showAddRuleDialog,
          ),
        ],
      ),
    );
  }

  Future<void> _loadRules() async {
    final prefs = getIt<SharedPreferences>();
    if (!mounted) {
      return;
    }
    setState(() {
      _rules = BankRuleEngine.loadRules(prefs);
    });
  }

  Future<void> _persistRules() async {
    final prefs = getIt<SharedPreferences>();
    await prefs.setString(
      BankRuleEngine.smartRulesPrefsKey,
      jsonEncode(_rules.map((r) => r.toJson()).toList()),
    );
  }

  Future<void> _showAddRuleDialog() async {
    final merchantController = TextEditingController();
    final categoryController = TextEditingController();
    final noteController = TextEditingController();
    var flow = 'Debit';

    await showDialog<void>(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setInnerState) => AlertDialog(
          title: const Text('Add Bank Smart Rule'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: merchantController,
                decoration: const InputDecoration(labelText: 'Merchant Contains'),
              ),
              const SizedBox(height: 12),
              InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Flow',
                  border: OutlineInputBorder(),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: flow,
                    items: const ['Debit', 'Credit', 'Any']
                        .map((item) => DropdownMenuItem(value: item, child: Text(item)))
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setInnerState(() {
                          flow = value;
                        });
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: categoryController,
                decoration: const InputDecoration(labelText: 'Category'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: noteController,
                decoration: const InputDecoration(labelText: 'Auto Note'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () async {
                final merchant = merchantController.text.trim();
                final category = categoryController.text.trim();
                if (merchant.isEmpty || category.isEmpty) {
                  return;
                }
                setState(() {
                  _rules = [
                    BankSmartRule(
                      id: DateTime.now().microsecondsSinceEpoch.toString(),
                      merchantKeyword: merchant,
                      flow: flow,
                      category: category,
                      autoNote: noteController.text.trim(),
                    ),
                    ..._rules,
                  ];
                });
                await _persistRules();
                if (mounted) {
                  Navigator.pop(dialogContext);
                }
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class ImportTab extends StatelessWidget {
  const ImportTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BankImportBloc, BankImportState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Import Bank Statement',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              
              if (state.bankAccounts.isEmpty)
                const Card(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'No bank accounts configured. Please add a bank account first.',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                )
              else
                const BankAccountSelector(),
              
              const SizedBox(height: 16),
              const FilePickerWidget(),
              
              const SizedBox(height: 16),
              
              if (state.selectedFiles.isNotEmpty)
                ElevatedButton.icon(
                  onPressed: () => _handleImport(context),
                  icon: const Icon(Icons.cloud_upload),
                  label: const Text('Import Statement'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                  ),
                ),
              
              const SizedBox(height: 24),
              
              if (state.status == BankImportStatus.loading)
                const Center(child: CircularProgressIndicator())
              else if (state.status == BankImportStatus.error)
                Card(
                  color: Colors.red.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      state.errorMessage ?? 'An error occurred',
                      style: TextStyle(color: Colors.red.shade800),
                    ),
                  ),
                )
              else if (state.status == BankImportStatus.imported)
                Card(
                  color: Colors.green.shade50,
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Statement imported successfully!',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  void _handleImport(BuildContext context) {
    final state = context.read<BankImportBloc>().state;
    if (state.selectedFiles.isNotEmpty && state.selectedBankAccount != null) {
      context.read<BankImportBloc>().add(
        ImportStatement(
          state.selectedFiles.first,
          state.selectedBankAccount!.accountId,
        ),
      );
    }
  }
}

class ReconcileTab extends StatelessWidget {
  const ReconcileTab({super.key, this.groupId});

  final String? groupId;

  @override
  Widget build(BuildContext context) {
    return ImportBatchList(groupId: groupId);
  }
}

class _RulesTab extends StatelessWidget {
  const _RulesTab({
    required this.rules,
    required this.onAddRule,
  });

  final List<BankSmartRule> rules;
  final VoidCallback onAddRule;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Bank smart rules help you standardize imported statement rows for recurring merchants and cash-flow patterns.',
                    ),
                  ),
                  FilledButton.icon(
                    onPressed: onAddRule,
                    icon: const Icon(Icons.add),
                    label: const Text('Add Rule'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          if (rules.isEmpty)
            const Expanded(
              child: Center(
                child: Text('No smart rules yet'),
              ),
            )
          else
            Expanded(
              child: ListView.separated(
                itemCount: rules.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final rule = rules[index];
                  return Card(
                    child: ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.auto_fix_high),
                      ),
                      title: Text(rule.merchantKeyword),
                      subtitle: Text('${rule.flow} -> ${rule.category}${rule.autoNote.isEmpty ? '' : ' • ${rule.autoNote}'}'),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
