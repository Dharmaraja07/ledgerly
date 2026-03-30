import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/di/service_locator.dart';
import '../../data/models/receipt_rule.dart';
import '../bloc/receipt_ocr_bloc.dart';
import '../widgets/capture_options_widget.dart';
import '../widgets/extraction_list_widget.dart';
import '../widgets/statistics_widget.dart';

class ReceiptOcrPage extends StatelessWidget {
  const ReceiptOcrPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ReceiptOcrBloc>()
        ..add(const LoadRecentExtractions())
        ..add(const LoadStatistics())
        ..add(const LoadPopularMerchants()),
      child: const ReceiptOcrView(),
    );
  }
}

class ReceiptOcrView extends StatefulWidget {
  const ReceiptOcrView({super.key});

  @override
  State<ReceiptOcrView> createState() => _ReceiptOcrViewState();
}

class _ReceiptOcrViewState extends State<ReceiptOcrView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    
    _searchController.addListener(() {
      context.read<ReceiptOcrBloc>().add(SearchExtractions(_searchController.text));
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receipt OCR'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.camera_alt), text: 'Capture'),
            Tab(icon: Icon(Icons.receipt_long), text: 'History'),
            Tab(icon: Icon(Icons.analytics), text: 'Analytics'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.auto_fix_high_outlined),
            onPressed: _showSmartRulesSheet,
          ),
          BlocBuilder<ReceiptOcrBloc, ReceiptOcrState>(
            builder: (context, state) {
              if (state.capturedImagePath != null) {
                return IconButton(
                  icon: const Icon(Icons.check),
                  onPressed: () {
                    context.read<ReceiptOcrBloc>().add(
                      ProcessReceipt(state.capturedImagePath!),
                    );
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          const CaptureTab(),
          HistoryTab(searchController: _searchController),
          const AnalyticsTab(),
        ],
      ),
    );
  }

  Future<void> _showSmartRulesSheet() async {
    final prefs = getIt<SharedPreferences>();
    final raw = prefs.getString(ReceiptOcrBloc.smartRulesKey);
    var rules = raw == null || raw.isEmpty
        ? <ReceiptSmartRule>[]
        : (jsonDecode(raw) as List<dynamic>)
            .map((item) => ReceiptSmartRule.fromJson(item as Map<String, dynamic>))
            .toList();

    if (!mounted) {
      return;
    }

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (sheetContext) {
        return StatefulBuilder(
          builder: (context, setInnerState) {
            Future<void> persistRules() async {
              await prefs.setString(
                ReceiptOcrBloc.smartRulesKey,
                jsonEncode(rules.map((rule) => rule.toJson()).toList()),
              );
            }

            Future<void> openRuleDialog([ReceiptSmartRule? existing]) async {
              final keywordController = TextEditingController(
                text: existing?.merchantKeyword ?? '',
              );
              final categoryController = TextEditingController(
                text: existing?.category ?? '',
              );
              final prefixController = TextEditingController(
                text: existing?.titlePrefix ?? '',
              );
              var autoCreate = existing?.autoCreateExpense ?? true;

              await showDialog<void>(
                context: sheetContext,
                builder: (dialogContext) => StatefulBuilder(
                  builder: (context, setDialogState) => AlertDialog(
                    title: Text(existing == null ? 'Add Smart Rule' : 'Edit Smart Rule'),
                    content: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: keywordController,
                            decoration: const InputDecoration(
                              labelText: 'Merchant keyword',
                              hintText: 'starbucks',
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextField(
                            controller: categoryController,
                            decoration: const InputDecoration(
                              labelText: 'Category',
                              hintText: 'Food',
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextField(
                            controller: prefixController,
                            decoration: const InputDecoration(
                              labelText: 'Optional title prefix',
                            ),
                          ),
                          const SizedBox(height: 12),
                          SwitchListTile.adaptive(
                            contentPadding: EdgeInsets.zero,
                            title: const Text('Auto-create expense'),
                            value: autoCreate,
                            onChanged: (value) {
                              setDialogState(() {
                                autoCreate = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(dialogContext),
                        child: const Text('Cancel'),
                      ),
                      FilledButton(
                        onPressed: () {
                          final keyword = keywordController.text.trim();
                          final category = categoryController.text.trim();
                          if (keyword.isEmpty || category.isEmpty) {
                            return;
                          }
                          final rule = ReceiptSmartRule(
                            id: existing?.id ?? DateTime.now().microsecondsSinceEpoch.toString(),
                            merchantKeyword: keyword,
                            category: category,
                            autoCreateExpense: autoCreate,
                            titlePrefix: prefixController.text.trim().isEmpty
                                ? null
                                : prefixController.text.trim(),
                          );
                          setInnerState(() {
                            if (existing == null) {
                              rules = [...rules, rule];
                            } else {
                              rules = rules
                                  .map((item) => item.id == existing.id ? rule : item)
                                  .toList();
                            }
                          });
                          persistRules();
                          Navigator.pop(dialogContext);
                        },
                        child: const Text('Save'),
                      ),
                    ],
                  ),
                ),
              );
            }

            return SafeArea(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  20,
                  20,
                  20,
                  MediaQuery.of(sheetContext).viewInsets.bottom + 20,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Receipt Smart Rules',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        FilledButton.icon(
                          onPressed: openRuleDialog,
                          icon: const Icon(Icons.add),
                          label: const Text('Add'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Rules can auto-create expenses from OCR receipts using your local merchant patterns.',
                    ),
                    const SizedBox(height: 16),
                    if (rules.isEmpty)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text('No rules yet. Add your first merchant automation.'),
                      )
                    else
                      ...rules.map(
                        (rule) => Card(
                          child: ListTile(
                            title: Text(rule.merchantKeyword),
                            subtitle: Text(
                              '${rule.category} • ${rule.autoCreateExpense ? 'auto-create on' : 'manual only'}',
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete_outline),
                              onPressed: () async {
                                setInnerState(() {
                                  rules = rules.where((item) => item.id != rule.id).toList();
                                });
                                await persistRules();
                              },
                            ),
                            onTap: () => openRuleDialog(rule),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class CaptureTab extends StatelessWidget {
  const CaptureTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReceiptOcrBloc, ReceiptOcrState>(
      builder: (context, state) {
        if (state.capturedImagePath != null) {
          return CapturedImageView(imagePath: state.capturedImagePath!);
        }

        return const CaptureOptionsWidget();
      },
    );
  }
}

class CapturedImageView extends StatelessWidget {
  const CapturedImageView({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(
                File(imagePath),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                'Receipt captured successfully!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Tap the checkmark to process the receipt',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        context.read<ReceiptOcrBloc>().add(const CaptureReceipt());
                      },
                      icon: const Icon(Icons.refresh),
                      label: const Text('Retake'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        context.read<ReceiptOcrBloc>().add(const PickReceiptFromGallery());
                      },
                      icon: const Icon(Icons.photo_library),
                      label: const Text('Gallery'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class HistoryTab extends StatelessWidget {
  const HistoryTab({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: searchController,
            decoration: const InputDecoration(
              hintText: 'Search receipts...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const Expanded(child: ExtractionListWidget()),
      ],
    );
  }
}

class AnalyticsTab extends StatelessWidget {
  const AnalyticsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: StatisticsWidget(
        state: context.watch<ReceiptOcrBloc>().state,
      ),
    );
  }
}
