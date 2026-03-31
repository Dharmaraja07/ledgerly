import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../expense/domain/entitities/Expense.dart';
import '../../../expense/domain/repositories/expense_repository.dart';
import '../../../export/domain/repositories/export_repository.dart';

class ReportsCenterPage extends StatefulWidget {
  const ReportsCenterPage({
    super.key,
    required this.groupId,
  });

  final String groupId;

  @override
  State<ReportsCenterPage> createState() => _ReportsCenterPageState();
}

class _ReportsCenterPageState extends State<ReportsCenterPage> {
  static const _investmentJournalKey = 'investment_income_journal_v1';

  late Future<_ReportSnapshot> _snapshotFuture;

  @override
  void initState() {
    super.initState();
    _snapshotFuture = _loadSnapshot();
  }

  Future<void> _shareCsv() async {
    try {
      final path = await getIt<ExportRepository>().generateCsv(widget.groupId);
      await SharePlus.instance.share(
        ShareParams(
          files: [XFile(path)],
          text: 'Ledgerly expense export',
        ),
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Export failed: $e')),
        );
      }
    }
  }

  Future<_ReportSnapshot> _loadSnapshot() async {
    final prefs = getIt<SharedPreferences>();
    final expenseRepository = getIt<ExpenseRepository>();
    final expenses = await expenseRepository.getExpenses(widget.groupId);
    final rawJournal = prefs.getString(_investmentJournalKey);
    final journal = rawJournal == null
        ? <Map<String, dynamic>>[]
        : (jsonDecode(rawJournal) as List<dynamic>)
            .map((item) => Map<String, dynamic>.from(item as Map))
            .toList();

    final now = DateTime.now();
    final year = now.year;
    final thisYear = expenses.where((item) => item.updatedAt.year == year && !item.isDeleted).toList();

    final expenseTotal = thisYear
        .where((item) => item.transactionType == TransactionType.expense)
        .fold<double>(0.0, (sum, item) => sum + item.amount);
    final incomeTotal = thisYear
        .where((item) => item.transactionType == TransactionType.income)
        .fold<double>(0.0, (sum, item) => sum + item.amount);

    final quarterly = <int, _QuarterAgg>{for (var q = 1; q <= 4; q++) q: _QuarterAgg()};
    for (final item in thisYear) {
      final m = item.updatedAt.month;
      final q = ((m - 1) ~/ 3) + 1;
      final bucket = quarterly[q]!;
      if (item.transactionType == TransactionType.expense) {
        bucket.expense += item.amount;
      } else if (item.transactionType == TransactionType.income) {
        bucket.income += item.amount;
      }
    }

    final categoryExpense = <String, double>{};
    for (final item in thisYear.where((e) => e.transactionType == TransactionType.expense)) {
      categoryExpense[item.category] = (categoryExpense[item.category] ?? 0) + item.amount;
    }
    final topCategories = categoryExpense.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    final dividends = journal
        .where((item) => item['type'] == 'dividend')
        .fold<double>(0.0, (sum, item) => sum + (item['amount'] as num).toDouble());
    final realizedGains = journal
        .where((item) => item['type'] == 'realizedGain')
        .fold<double>(0.0, (sum, item) => sum + (item['amount'] as num).toDouble());

    return _ReportSnapshot(
      expenseTotal: expenseTotal,
      incomeTotal: incomeTotal,
      dividends: dividends,
      realizedGains: realizedGains,
      taxableInvestmentIncome: dividends + realizedGains,
      quarterly: quarterly,
      topExpenseCategories: topCategories.take(12).toList(),
      taxYear: year,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text(
          'Reports Center',
          style: GoogleFonts.outfit(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            tooltip: 'Share CSV for tax prep',
            onPressed: _shareCsv,
            icon: const Icon(Icons.ios_share_outlined),
          ),
        ],
      ),
      body: FutureBuilder<_ReportSnapshot>(
        future: _snapshotFuture,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator(color: AppColors.primary));
          }
          final data = snapshot.data!;
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _ReportCard(
                title: 'Annual cash report (${data.taxYear})',
                lines: [
                  'Income recorded: ₹${data.incomeTotal.toStringAsFixed(0)}',
                  'Expenses recorded: ₹${data.expenseTotal.toStringAsFixed(0)}',
                  'Net flow: ₹${(data.incomeTotal - data.expenseTotal).toStringAsFixed(0)}',
                ],
              ),
              const SizedBox(height: 16),
              _ReportCard(
                title: 'Quarterly breakdown (${data.taxYear})',
                lines: [
                  for (var q = 1; q <= 4; q++)
                    'Q$q — in ₹${data.quarterly[q]!.income.toStringAsFixed(0)} · '
                        'out ₹${data.quarterly[q]!.expense.toStringAsFixed(0)} · '
                        'net ₹${(data.quarterly[q]!.income - data.quarterly[q]!.expense).toStringAsFixed(0)}',
                ],
              ),
              const SizedBox(height: 16),
              _ReportCard(
                title: 'Category totals (tax prep / Schedule C hints)',
                lines: data.topExpenseCategories.isEmpty
                    ? ['No categorized expenses this year yet.']
                    : [
                        for (final e in data.topExpenseCategories)
                          '${e.key}: ₹${e.value.toStringAsFixed(0)}',
                      ],
              ),
              const SizedBox(height: 16),
              _ReportCard(
                title: 'Investment tax summary',
                lines: [
                  'Dividends: ₹${data.dividends.toStringAsFixed(0)}',
                  'Realized gains: ₹${data.realizedGains.toStringAsFixed(0)}',
                  'Taxable investment income (est.): ₹${data.taxableInvestmentIncome.toStringAsFixed(0)}',
                ],
              ),
              const SizedBox(height: 12),
              Text(
                'Figures are from your local ledger; verify with a tax professional.',
                style: GoogleFonts.outfit(fontSize: 12, color: AppColors.textSecondary),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _QuarterAgg {
  double income = 0;
  double expense = 0;
}

class _ReportSnapshot {
  const _ReportSnapshot({
    required this.expenseTotal,
    required this.incomeTotal,
    required this.dividends,
    required this.realizedGains,
    required this.taxableInvestmentIncome,
    required this.quarterly,
    required this.topExpenseCategories,
    required this.taxYear,
  });

  final double expenseTotal;
  final double incomeTotal;
  final double dividends;
  final double realizedGains;
  final double taxableInvestmentIncome;
  final Map<int, _QuarterAgg> quarterly;
  final List<MapEntry<String, double>> topExpenseCategories;
  final int taxYear;
}

class _ReportCard extends StatelessWidget {
  const _ReportCard({
    required this.title,
    required this.lines,
  });

  final String title;
  final List<String> lines;

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
          Text(title, style: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          ...lines.map(
            (line) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(line, style: GoogleFonts.outfit(color: AppColors.textSecondary)),
            ),
          ),
        ],
      ),
    );
  }
}
