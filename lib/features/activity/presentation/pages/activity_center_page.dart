import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../bank_import/data/repositories/bank_import_repository.dart';
import '../../../expense/domain/repositories/expense_repository.dart';
import '../../../receipt_ocr/data/repositories/receipt_ocr_repository.dart';

class ActivityCenterPage extends StatefulWidget {
  const ActivityCenterPage({
    super.key,
    required this.groupId,
  });

  final String groupId;

  @override
  State<ActivityCenterPage> createState() => _ActivityCenterPageState();
}

class _ActivityCenterPageState extends State<ActivityCenterPage> {
  static const _ledgerEntriesKey = 'ledger_manual_entries_v1';
  static const _investmentJournalKey = 'investment_income_journal_v1';

  late Future<List<_ActivityItem>> _itemsFuture;

  @override
  void initState() {
    super.initState();
    _itemsFuture = _loadActivity();
  }

  Future<List<_ActivityItem>> _loadActivity() async {
    final prefs = getIt<SharedPreferences>();
    final expenseRepository = getIt<ExpenseRepository>();
    final bankImportRepository = getIt<BankImportRepository>();
    final receiptRepository = getIt<ReceiptOcrRepository>();

    final expenses = await expenseRepository.getExpenses(widget.groupId);
    final batches = await bankImportRepository.getImportBatches();
    final receipts = await receiptRepository.getRecentExtractions(limit: 50);

    final ledgerRaw = prefs.getString(_ledgerEntriesKey);
    final investmentRaw = prefs.getString(_investmentJournalKey);

    final items = <_ActivityItem>[
      ...expenses
          .where((item) => !item.isDeleted)
          .map(
            (item) => _ActivityItem(
              title: item.title,
              subtitle: 'Expense • ${item.category}',
              date: item.updatedAt,
            ),
          ),
      ...batches.map(
        (item) => _ActivityItem(
          title: item.fileName,
          subtitle: 'Import batch • ${item.totalTransactions} transactions',
          date: item.importDate,
        ),
      ),
      ...receipts.map(
        (item) => _ActivityItem(
          title: item.merchantName ?? 'Receipt OCR',
          subtitle: 'Receipt • ${_enumLabel(item.status)}',
          date: item.extractionDate,
        ),
      ),
      if (ledgerRaw != null)
        ...(jsonDecode(ledgerRaw) as List<dynamic>).map(
          (item) => _ActivityItem(
            title: (item as Map<String, dynamic>)['note'] as String? ?? 'Ledger entry',
            subtitle: 'Ledger • ${(item)['account'] as String? ?? 'General'}',
            date: DateTime.parse((item)['date'] as String),
          ),
        ),
      if (investmentRaw != null)
        ...(jsonDecode(investmentRaw) as List<dynamic>).map(
          (item) => _ActivityItem(
            title: (item as Map<String, dynamic>)['investmentName'] as String? ?? 'Investment event',
            subtitle: 'Investment • ${(item)['type'] as String}',
            date: DateTime.parse((item)['date'] as String),
          ),
        ),
    ]..sort((a, b) => b.date.compareTo(a.date));

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text(
          'Activity Center',
          style: GoogleFonts.outfit(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder<List<_ActivityItem>>(
        future: _itemsFuture,
        builder: (context, snapshot) {
          final items = snapshot.data ?? const [];
          if (items.isEmpty) {
            return Center(
              child: Text(
                'No activity yet',
                style: GoogleFonts.outfit(color: AppColors.textSecondary),
              ),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: items.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final item = items[index];
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.title, style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(item.subtitle, style: GoogleFonts.outfit(color: AppColors.textSecondary)),
                    const SizedBox(height: 6),
                    Text(
                      item.date.toIso8601String().split('T').first,
                      style: GoogleFonts.outfit(color: AppColors.textSecondary, fontSize: 12),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

String _enumLabel(Enum value) {
  final raw = value.name;
  if (raw.isEmpty) {
    return '';
  }
  return raw[0].toUpperCase() + raw.substring(1).replaceAll('_', ' ');
}

class _ActivityItem {
  const _ActivityItem({
    required this.title,
    required this.subtitle,
    required this.date,
  });

  final String title;
  final String subtitle;
  final DateTime date;
}
