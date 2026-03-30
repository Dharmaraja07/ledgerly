import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../domain/entitities/Expense.dart';

class ExpenseSearchDelegate extends SearchDelegate {
  final List<Expense> expenses;

  ExpenseSearchDelegate(this.expenses);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.primary),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: TextStyle(color: AppColors.textSecondary),
      ),
      textTheme: GoogleFonts.outfitTextTheme(Theme.of(context).textTheme),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () => query = '',
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildList(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildList(context);
  }

  Widget _buildList(BuildContext context) {
    final results = expenses.where((e) {
      final q = query.toLowerCase();
      return e.title.toLowerCase().contains(q) || e.category.toLowerCase().contains(q);
    }).toList();

    if (results.isEmpty && query.isNotEmpty) {
      return Center(
        child: Text(
          'No records found.',
          style: GoogleFonts.outfit(color: AppColors.textSecondary),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: results.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final expense = results[index];
        return ListTile(
          tileColor: AppColors.surface,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          leading: CircleAvatar(
             backgroundColor: AppColors.primary.withValues(alpha: 0.1),
             child: const Icon(Icons.receipt, color: AppColors.primary),
          ),
          title: Text(expense.title.isEmpty ? expense.category : expense.title, style: const TextStyle(color: AppColors.textPrimary)),
          subtitle: Text(expense.category, style: const TextStyle(color: AppColors.textSecondary)),
          trailing: Text(
            '₹${expense.amount.toStringAsFixed(2)}',
             style: TextStyle(
               color: expense.transactionType == TransactionType.expense ? AppColors.error : AppColors.success,
               fontWeight: FontWeight.bold,
             ),
          ),
          onTap: () => close(context, null),
        );
      },
    );
  }
}
