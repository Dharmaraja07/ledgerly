import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../bill_reminders/data/repositories/bill_reminder_repository.dart';
import '../../../document_vault/data/repositories/document_repository.dart';
import '../../../expense/domain/repositories/expense_repository.dart';
import '../../../investment/data/repositories/investment_repository.dart';
import '../../../receipt_ocr/data/repositories/receipt_ocr_repository.dart';

class GlobalSearchPage extends StatefulWidget {
  const GlobalSearchPage({
    super.key,
    required this.groupId,
  });

  final String groupId;

  @override
  State<GlobalSearchPage> createState() => _GlobalSearchPageState();
}

class _GlobalSearchPageState extends State<GlobalSearchPage> {
  final _controller = TextEditingController();
  late Future<List<_SearchResult>> _resultsFuture;

  @override
  void initState() {
    super.initState();
    _resultsFuture = Future.value(const []);
    _controller.addListener(_refreshSearch);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _refreshSearch() {
    final query = _controller.text.trim();
    setState(() {
      _resultsFuture = _runSearch(query);
    });
  }

  Future<List<_SearchResult>> _runSearch(String query) async {
    if (query.isEmpty) {
      return const [];
    }

    final normalized = query.toLowerCase();
    final expenseRepository = getIt<ExpenseRepository>();
    final billRepository = getIt<BillReminderRepository>();
    final documentRepository = getIt<DocumentRepository>();
    final investmentRepository = getIt<InvestmentRepository>();
    final receiptRepository = getIt<ReceiptOcrRepository>();

    final expenses = await expenseRepository.getExpenses(widget.groupId);
    final bills = await billRepository.getAllBills();
    final documents = await documentRepository.getAllDocuments();
    final investments = await investmentRepository.getAllInvestments();
    final receipts = await receiptRepository.getRecentExtractions(limit: 100);

    final results = <_SearchResult>[
      ...expenses
          .where(
            (item) =>
                !item.isDeleted &&
                (item.title.toLowerCase().contains(normalized) ||
                    item.category.toLowerCase().contains(normalized)),
          )
          .map(
            (item) => _SearchResult(
              type: 'Expense',
              title: item.title,
              subtitle: '${item.category} • ${item.transactionType.name}',
              amount: item.amount,
              date: item.updatedAt,
            ),
          ),
      ...bills
          .where(
            (item) =>
                item.title.toLowerCase().contains(normalized) ||
                item.categoryId.toLowerCase().contains(normalized),
          )
          .map(
            (item) => _SearchResult(
              type: 'Bill',
              title: item.title,
              subtitle: '${_enumLabel(item.status)} • due ${item.dueDate.toIso8601String().split('T').first}',
              amount: item.amount,
              date: item.dueDate,
            ),
          ),
      ...documents
          .where(
            (item) =>
                item.fileName.toLowerCase().contains(normalized) ||
                (item.category?.toLowerCase().contains(normalized) ?? false),
          )
          .map(
            (item) => _SearchResult(
              type: 'Document',
              title: item.fileName,
              subtitle: item.category ?? _enumLabel(item.type),
              amount: null,
              date: item.uploadDate,
            ),
          ),
      ...investments
          .where(
            (item) =>
                item.name.toLowerCase().contains(normalized) ||
                item.symbol.toLowerCase().contains(normalized),
          )
          .map(
            (item) => _SearchResult(
              type: 'Investment',
              title: item.name,
              subtitle: '${item.symbol} • ${_enumLabel(item.type)}',
              amount: item.currentValue,
              date: item.lastUpdated ?? item.updatedAt,
            ),
          ),
      ...receipts
          .where(
            (item) =>
                (item.merchantName?.toLowerCase().contains(normalized) ?? false) ||
                (item.category?.toLowerCase().contains(normalized) ?? false),
          )
          .map(
            (item) => _SearchResult(
              type: 'Receipt',
              title: item.merchantName ?? 'Receipt',
              subtitle: item.category ?? _enumLabel(item.status),
              amount: item.totalAmount,
              date: item.extractionDate,
            ),
          ),
    ]..sort((a, b) => b.date.compareTo(a.date));

    return results;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text(
          'Universal Search',
          style: GoogleFonts.outfit(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Search expenses, bills, investments, receipts, docs...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: AppColors.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: FutureBuilder<List<_SearchResult>>(
                future: _resultsFuture,
                builder: (context, snapshot) {
                  final results = snapshot.data ?? const [];
                  if (_controller.text.trim().isEmpty) {
                    return const _SearchEmptyState(
                      title: 'Search across the whole app',
                      description: 'Find records, bills, investments, receipts, and documents from one place.',
                    );
                  }
                  if (results.isEmpty) {
                    return const _SearchEmptyState(
                      title: 'No matches found',
                      description: 'Try a merchant name, category, symbol, or document keyword.',
                    );
                  }
                  return ListView.separated(
                    itemCount: results.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final item = results[index];
                      return Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: AppColors.primary.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  item.type.characters.first,
                                  style: GoogleFonts.outfit(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
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
                                    '${item.type} • ${item.date.toIso8601String().split('T').first}',
                                    style: GoogleFonts.outfit(color: AppColors.textSecondary, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            if (item.amount != null)
                              Text(
                                '₹${item.amount!.toStringAsFixed(0)}',
                                style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
                              ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
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

class _SearchResult {
  const _SearchResult({
    required this.type,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.date,
  });

  final String type;
  final String title;
  final String subtitle;
  final double? amount;
  final DateTime date;
}

class _SearchEmptyState extends StatelessWidget {
  const _SearchEmptyState({
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.center,
            style: GoogleFonts.outfit(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}
