import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../bank_import/data/models/bank_transaction_isar.dart';
import '../../../bank_import/data/repositories/bank_import_repository.dart';
import '../../../bank_import/presentation/pages/bank_import_page.dart';
import '../../../expense/domain/entitities/Expense.dart' as expense_domain;
import '../../../expense/domain/repositories/expense_repository.dart';

class LedgerCenterPage extends StatefulWidget {
  const LedgerCenterPage({
    super.key,
    required this.groupId,
  });

  final String groupId;

  @override
  State<LedgerCenterPage> createState() => _LedgerCenterPageState();
}

class _LedgerCenterPageState extends State<LedgerCenterPage> {
  static const _plannerAccountsKey = 'planner_accounts_v1';
  static const _manualLedgerEntriesKey = 'ledger_manual_entries_v1';

  late Future<_LedgerSnapshot> _snapshotFuture;

  @override
  void initState() {
    super.initState();
    _snapshotFuture = _loadSnapshot();
  }

  Future<_LedgerSnapshot> _loadSnapshot() async {
    final prefs = getIt<SharedPreferences>();
    final expenseRepository = getIt<ExpenseRepository>();
    final bankImportRepository = getIt<BankImportRepository>();

    final expenses = await expenseRepository.getExpenses(widget.groupId);
    final bankAccounts = await bankImportRepository.getBankAccounts();
    final importBatches = await bankImportRepository.getImportBatches();

    final rawAccounts = prefs.getString(_plannerAccountsKey);
    final plannerAccounts = rawAccounts == null
        ? <_LedgerAccount>[]
        : (jsonDecode(rawAccounts) as List<dynamic>)
            .map((item) => _LedgerAccount.fromJson(item as Map<String, dynamic>))
            .toList();

    final rawManualEntries = prefs.getString(_manualLedgerEntriesKey);
    final manualEntries = rawManualEntries == null
        ? <_ManualLedgerEntry>[]
        : (jsonDecode(rawManualEntries) as List<dynamic>)
            .map((item) => _ManualLedgerEntry.fromJson(item as Map<String, dynamic>))
            .toList()
          ..sort((a, b) => b.date.compareTo(a.date));

    return _LedgerSnapshot(
      expenses: expenses.where((item) => !item.isDeleted).toList()
        ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt)),
      bankAccounts: bankAccounts,
      importBatches: importBatches,
      plannerAccounts: plannerAccounts,
      manualEntries: manualEntries,
    );
  }

  Future<void> _refresh() async {
    setState(() {
      _snapshotFuture = _loadSnapshot();
    });
  }

  Future<void> _showManualEntryDialog(_LedgerSnapshot snapshot) async {
    final noteController = TextEditingController();
    final amountController = TextEditingController();
    final accountNames = [
      ...snapshot.plannerAccounts.map((item) => item.name),
      ...snapshot.bankAccounts.map((item) => '${item.bankName} • ${item.accountName}'),
      ...snapshot.manualEntries.expand((item) => [item.account, if (item.linkedAccount != null) item.linkedAccount!]),
    ].toSet().where((item) => item.trim().isNotEmpty).toList()
      ..sort();
    final selectableAccounts = accountNames.isEmpty
        ? ['General Ledger', 'Owner Equity', 'Suspense']
        : [...accountNames, if (!accountNames.contains('Owner Equity')) 'Owner Equity', if (!accountNames.contains('Suspense')) 'Suspense'];
    var selectedDebitAccount = selectableAccounts.first;
    var selectedCreditAccount = selectableAccounts.length > 1 ? selectableAccounts[1] : selectableAccounts.first;
    var selectedType = 'Journal';

    await showDialog<void>(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setInnerState) => AlertDialog(
          title: const Text('Add Journal Entry'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                initialValue: selectedDebitAccount,
                items: selectableAccounts
                    .map((item) => DropdownMenuItem(value: item, child: Text(item)))
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    setInnerState(() {
                      selectedDebitAccount = value;
                    });
                  }
                },
                decoration: const InputDecoration(labelText: 'Debit Account'),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                initialValue: selectedCreditAccount,
                items: selectableAccounts
                    .map((item) => DropdownMenuItem(value: item, child: Text(item)))
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    setInnerState(() {
                      selectedCreditAccount = value;
                    });
                  }
                },
                decoration: const InputDecoration(labelText: 'Credit Account'),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                initialValue: selectedType,
                items: const ['Journal', 'Transfer', 'Adjustment', 'Opening Balance']
                    .map((item) => DropdownMenuItem(value: item, child: Text(item)))
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    setInnerState(() {
                      selectedType = value;
                    });
                  }
                },
                decoration: const InputDecoration(labelText: 'Entry Type'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: amountController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                decoration: const InputDecoration(labelText: 'Amount'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: noteController,
                decoration: const InputDecoration(labelText: 'Notes'),
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
                final amount = double.tryParse(amountController.text.trim());
                if (amount == null || amount <= 0 || selectedDebitAccount == selectedCreditAccount) {
                  return;
                }
                final prefs = getIt<SharedPreferences>();
                final raw = prefs.getString(_manualLedgerEntriesKey);
                final entries = raw == null
                    ? <_ManualLedgerEntry>[]
                    : (jsonDecode(raw) as List<dynamic>)
                        .map((item) => _ManualLedgerEntry.fromJson(item as Map<String, dynamic>))
                        .toList();

                entries.add(
                  _ManualLedgerEntry(
                    id: DateTime.now().microsecondsSinceEpoch.toString(),
                    account: selectedDebitAccount,
                    linkedAccount: selectedCreditAccount,
                    type: selectedType,
                    amount: amount,
                    note: noteController.text.trim(),
                    date: DateTime.now(),
                  ),
                );

                await prefs.setString(
                  _manualLedgerEntriesKey,
                  jsonEncode(entries.map((item) => item.toJson()).toList()),
                );
                if (mounted) {
                  Navigator.pop(dialogContext);
                }
                await _refresh();
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text(
          'Ledger Center',
          style: GoogleFonts.outfit(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: _refresh,
            icon: const Icon(Icons.refresh, color: AppColors.primary),
          ),
        ],
      ),
      body: FutureBuilder<_LedgerSnapshot>(
        future: _snapshotFuture,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          }

          final data = snapshot.data!;
          final ledgerBalance = data.allAccounts.fold<double>(
            0.0,
            (sum, account) => sum + account.balance,
          );
          final reconciledCount = data.importBatches.fold<int>(
            0,
            (sum, batch) => sum + batch.reconciledTransactions,
          );
          final pendingCount = data.importBatches.fold<int>(
            0,
            (sum, batch) => sum + batch.pendingTransactions,
          );

          return ListView(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Account Ledger',
                      style: GoogleFonts.outfit(
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '₹${ledgerBalance.toStringAsFixed(0)}',
                      style: GoogleFonts.outfit(
                        color: AppColors.textPrimary,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        Expanded(
                          child: _LedgerMetric(
                            label: 'Planner accounts',
                            value: '${data.plannerAccounts.length}',
                          ),
                        ),
                        Expanded(
                          child: _LedgerMetric(
                            label: 'Bank accounts',
                            value: '${data.bankAccounts.length}',
                          ),
                        ),
                        Expanded(
                          child: _LedgerMetric(
                            label: 'Manual entries',
                            value: '${data.manualEntries.length}',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: _LedgerInfoCard(
                      title: 'Reconciled',
                      value: '$reconciledCount',
                      subtitle: 'Matched statement rows',
                      color: AppColors.success,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _LedgerInfoCard(
                      title: 'Pending',
                      value: '$pendingCount',
                      subtitle: 'Need reconciliation',
                      color: pendingCount > 0 ? AppColors.error : AppColors.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              FilledButton.icon(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BankImportPage(groupId: widget.groupId),
                    ),
                  );
                  await _refresh();
                },
                icon: const Icon(Icons.account_balance_outlined),
                label: const Text('Open Reconciliation Center'),
              ),
              const SizedBox(height: 24),
              _SectionHeader(
                title: 'Accounts',
                actionLabel: 'Manual Entry',
                onPressed: () => _showManualEntryDialog(data),
              ),
              const SizedBox(height: 12),
              if (data.allAccounts.isEmpty)
                const _EmptyLedgerCard(
                  title: 'No ledger accounts yet',
                  description: 'Planner accounts and imported bank accounts will appear here.',
                )
              else
                ...data.allAccounts.map(
                  (account) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _AccountTile(
                      title: account.name,
                      subtitle: account.type,
                      amount: account.balance,
                    ),
                  ),
                ),
              const SizedBox(height: 24),
              const _StaticHeader(title: 'Recent Ledger Activity'),
              const SizedBox(height: 12),
              if (data.timeline.isEmpty)
                const _EmptyLedgerCard(
                  title: 'No ledger activity yet',
                  description: 'Imported transactions, manual entries, and expenses will show here.',
                )
              else
                ...data.timeline.take(12).map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _TimelineTile(item: item),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _LedgerSnapshot {
  const _LedgerSnapshot({
    required this.expenses,
    required this.bankAccounts,
    required this.importBatches,
    required this.plannerAccounts,
    required this.manualEntries,
  });

  final List<expense_domain.Expense> expenses;
  final List<BankAccountIsar> bankAccounts;
  final List<ImportBatchIsar> importBatches;
  final List<_LedgerAccount> plannerAccounts;
  final List<_ManualLedgerEntry> manualEntries;

  List<_LedgerAccount> get allAccounts {
    final accountMap = <String, _LedgerAccount>{
      for (final account in plannerAccounts)
        account.name: account,
      for (final item in bankAccounts)
        '${item.bankName} • ${item.accountName}': _LedgerAccount(
          name: '${item.bankName} • ${item.accountName}',
          type: item.accountType,
          balance: item.currentBalance,
        ),
    };

    final manualDeltas = <String, double>{};
    for (final entry in manualEntries) {
      manualDeltas.update(entry.account, (value) => value + entry.amount, ifAbsent: () => entry.amount);
      final creditAccount = entry.linkedAccount;
      if (creditAccount != null && creditAccount.trim().isNotEmpty) {
        manualDeltas.update(creditAccount, (value) => value - entry.amount, ifAbsent: () => -entry.amount);
      }
    }

    for (final delta in manualDeltas.entries) {
      final existing = accountMap[delta.key];
      accountMap[delta.key] = _LedgerAccount(
        name: delta.key,
        type: existing?.type ?? 'Journal',
        balance: (existing?.balance ?? 0) + delta.value,
      );
    }

    final accounts = accountMap.values.toList()
      ..sort((a, b) => b.balance.abs().compareTo(a.balance.abs()));
    return accounts;
  }

  List<_TimelineItem> get timeline {
    final items = <_TimelineItem>[
      ...manualEntries.map(
        (item) => _TimelineItem(
          title: item.note.isEmpty ? item.type : item.note,
          subtitle: item.linkedAccount == null
              ? '${item.account} • ${item.type}'
              : '${item.account} -> ${item.linkedAccount} • ${item.type}',
          amount: item.amount,
          date: item.date,
          color: item.amount >= 0 ? AppColors.success : AppColors.error,
        ),
      ),
      ...expenses.map(
        (item) => _TimelineItem(
          title: item.title,
          subtitle: '${item.category} • ${item.transactionType.name}',
          amount: item.transactionType == expense_domain.TransactionType.income ? item.amount : -item.amount,
          date: item.updatedAt,
          color: item.transactionType == expense_domain.TransactionType.income
              ? AppColors.success
              : AppColors.error,
        ),
      ),
    ]..sort((a, b) => b.date.compareTo(a.date));

    return items;
  }
}

class _LedgerAccount {
  const _LedgerAccount({
    required this.name,
    required this.type,
    required this.balance,
  });

  factory _LedgerAccount.fromJson(Map<String, dynamic> json) {
    return _LedgerAccount(
      name: json['name'] as String,
      type: json['type'] as String,
      balance: (json['balance'] as num).toDouble(),
    );
  }

  final String name;
  final String type;
  final double balance;
}

class _ManualLedgerEntry {
  const _ManualLedgerEntry({
    required this.id,
    required this.account,
    required this.linkedAccount,
    required this.type,
    required this.amount,
    required this.note,
    required this.date,
  });

  factory _ManualLedgerEntry.fromJson(Map<String, dynamic> json) {
    return _ManualLedgerEntry(
      id: json['id'] as String,
      account: json['account'] as String,
      linkedAccount: json['linkedAccount'] as String?,
      type: json['type'] as String,
      amount: (json['amount'] as num).toDouble(),
      note: json['note'] as String? ?? '',
      date: DateTime.parse(json['date'] as String),
    );
  }

  final String id;
  final String account;
  final String? linkedAccount;
  final String type;
  final double amount;
  final String note;
  final DateTime date;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'account': account,
      'linkedAccount': linkedAccount,
      'type': type,
      'amount': amount,
      'note': note,
      'date': date.toIso8601String(),
    };
  }
}

class _TimelineItem {
  const _TimelineItem({
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.date,
    required this.color,
  });

  final String title;
  final String subtitle;
  final double amount;
  final DateTime date;
  final Color color;
}

class _LedgerMetric extends StatelessWidget {
  const _LedgerMetric({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.outfit(color: AppColors.textSecondary)),
        const SizedBox(height: 4),
        Text(
          value,
          style: GoogleFonts.outfit(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _LedgerInfoCard extends StatelessWidget {
  const _LedgerInfoCard({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.color,
  });

  final String title;
  final String value;
  final String subtitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: GoogleFonts.outfit(color: color, fontWeight: FontWeight.w700)),
          const SizedBox(height: 6),
          Text(value, style: GoogleFonts.outfit(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(subtitle, style: GoogleFonts.outfit(color: AppColors.textSecondary)),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.title,
    required this.actionLabel,
    required this.onPressed,
  });

  final String title;
  final String actionLabel;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        TextButton.icon(
          onPressed: onPressed,
          icon: const Icon(Icons.add, color: AppColors.primary),
          label: Text(actionLabel),
        ),
      ],
    );
  }
}

class _StaticHeader extends StatelessWidget {
  const _StaticHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}

class _AccountTile extends StatelessWidget {
  const _AccountTile({
    required this.title,
    required this.subtitle,
    required this.amount,
  });

  final String title;
  final String subtitle;
  final double amount;

  @override
  Widget build(BuildContext context) {
    final positive = amount >= 0;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Icon(
            positive ? Icons.account_balance_wallet_outlined : Icons.warning_amber_rounded,
            color: positive ? AppColors.primary : AppColors.error,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
                Text(subtitle, style: GoogleFonts.outfit(color: AppColors.textSecondary)),
              ],
            ),
          ),
          Text(
            '₹${amount.toStringAsFixed(0)}',
            style: GoogleFonts.outfit(
              color: positive ? AppColors.success : AppColors.error,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineTile extends StatelessWidget {
  const _TimelineTile({required this.item});

  final _TimelineItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: item.color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              item.amount >= 0 ? Icons.arrow_downward_rounded : Icons.arrow_upward_rounded,
              color: item.color,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title, style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
                Text(item.subtitle, style: GoogleFonts.outfit(color: AppColors.textSecondary)),
                Text(
                  item.date.toIso8601String().split('T').first,
                  style: GoogleFonts.outfit(color: AppColors.textSecondary, fontSize: 12),
                ),
              ],
            ),
          ),
          Text(
            '${item.amount >= 0 ? '+' : '-'}₹${item.amount.abs().toStringAsFixed(0)}',
            style: GoogleFonts.outfit(color: item.color, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class _EmptyLedgerCard extends StatelessWidget {
  const _EmptyLedgerCard({
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 8),
          Text(description, style: GoogleFonts.outfit(color: AppColors.textSecondary)),
        ],
      ),
    );
  }
}
