import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../category/presentation/bloc/category_bloc.dart';
import '../../../category/presentation/bloc/category_event.dart';
import '../../../category/presentation/bloc/category_state.dart';
import '../../../export/presentation/pages/export_page.dart';
import '../../../settings/presentation/bloc/settings_bloc.dart';
import '../../../settings/presentation/pages/settings_page.dart';
import '../../domain/entitities/Expense.dart';
import '../bloc/expense_bloc.dart';
import '../bloc/expense_event.dart';
import '../bloc/expense_state.dart';
import 'ui/add_expense_sheet.dart';
import 'ui/expense_search_delegate.dart';

enum _RecordsFilter { all, expense, income }

class RecordsPage extends StatefulWidget {
  final String groupId;

  const RecordsPage({super.key, required this.groupId});

  @override
  State<RecordsPage> createState() => _RecordsPageState();
}

class _RecordsPageState extends State<RecordsPage> {
  DateTime _selectedMonth = DateTime(DateTime.now().year, DateTime.now().month);
  _RecordsFilter _filter = _RecordsFilter.all;

  @override
  void initState() {
    super.initState();
    context.read<ExpenseBloc>().add(LoadExpenses(widget.groupId));
    context.read<CategoryBloc>().add(LoadCategories());
  }

  @override
  Widget build(BuildContext context) {
    final currency = context.select<SettingsBloc, String>(
      (bloc) => bloc.state.currency,
    );

    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, categoryState) {
        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            backgroundColor: AppColors.background,
            elevation: 0,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ledgerly',
                  style: GoogleFonts.outfit(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                Text(
                  'Offline money workspace',
                  style: GoogleFonts.outfit(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search, color: AppColors.primary),
                onPressed: () {
                  final state = context.read<ExpenseBloc>().state;
                  if (state is ExpenseLoaded) {
                    showSearch(
                      context: context,
                      delegate: ExpenseSearchDelegate(state.expenses),
                    );
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.settings_outlined, color: AppColors.primary),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SettingsPage()),
                  );
                },
              ),
            ],
          ),
          body: BlocBuilder<ExpenseBloc, ExpenseState>(
            builder: (context, expenseState) {
              if (expenseState is! ExpenseLoaded) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                );
              }

              final monthExpenses = expenseState.expenses.where((expense) {
                final isMonthMatch = expense.updatedAt.year == _selectedMonth.year &&
                    expense.updatedAt.month == _selectedMonth.month &&
                    !expense.isDeleted;

                if (!isMonthMatch) {
                  return false;
                }

                switch (_filter) {
                  case _RecordsFilter.expense:
                    return expense.transactionType == TransactionType.expense;
                  case _RecordsFilter.income:
                    return expense.transactionType == TransactionType.income;
                  case _RecordsFilter.all:
                    return true;
                }
              }).toList()
                ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));

              final monthlyExpenseTotal = monthExpenses
                  .where((expense) => expense.transactionType == TransactionType.expense)
                  .fold<double>(0, (sum, expense) => sum + expense.amount);
              final monthlyIncomeTotal = monthExpenses
                  .where((expense) => expense.transactionType == TransactionType.income)
                  .fold<double>(0, (sum, expense) => sum + expense.amount);
              final monthlyBalance = monthlyIncomeTotal - monthlyExpenseTotal;
              final transferCount = monthExpenses
                  .where((expense) => expense.transactionType == TransactionType.transfer)
                  .length;
              final topCategories = _buildCategoryBreakdown(monthExpenses);
              final averageSpend = monthExpenses
                      .where((expense) => expense.transactionType == TransactionType.expense)
                      .isEmpty
                  ? 0.0
                  : monthlyExpenseTotal /
                      monthExpenses
                          .where((expense) => expense.transactionType == TransactionType.expense)
                          .length;

              return RefreshIndicator(
                color: AppColors.primary,
                onRefresh: () async {
                  context.read<ExpenseBloc>().add(LoadExpenses(widget.groupId));
                },
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 120),
                  children: [
                    _MonthStrip(
                      selectedMonth: _selectedMonth,
                      onPrevious: () => _changeMonth(-1),
                      onNext: () => _changeMonth(1),
                    ),
                    const SizedBox(height: 16),
                    _HeroSummaryCard(
                      currencySymbol: _currencySymbol(currency),
                      balance: monthlyBalance,
                      monthlyExpenseTotal: monthlyExpenseTotal,
                      monthlyIncomeTotal: monthlyIncomeTotal,
                      transactionCount: monthExpenses.length,
                      topCategory: topCategories.isEmpty ? 'No spending yet' : topCategories.first.key,
                    ),
                    const SizedBox(height: 16),
                    _QuickActionRow(
                      onAdd: () => _openAddSheet(categoryState),
                      onExport: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const ExportPage()),
                        );
                      },
                      onCategories: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Use the Categories tab to manage your spending map.'),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    _SectionHeader(
                      title: 'Monthly Snapshot',
                      trailing: _FilterChips(
                        filter: _filter,
                        onChanged: (filter) {
                          setState(() {
                            _filter = filter;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: _MetricTile(
                            title: 'Average expense',
                            value: '${_currencySymbol(currency)}${averageSpend.toStringAsFixed(0)}',
                            color: AppColors.error,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _MetricTile(
                            title: 'Transfers',
                            value: '$transferCount',
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _SectionHeader(title: 'Top Categories'),
                    const SizedBox(height: 12),
                    if (topCategories.isEmpty)
                      const _EmptyInsightCard(
                        title: 'No category insights yet',
                        description: 'Add a few expenses this month to see where your money is going.',
                      )
                    else
                      ...topCategories.take(4).map(
                        (entry) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: _CategoryInsightTile(
                            category: entry.key,
                            amount: entry.value,
                            total: monthlyExpenseTotal == 0 ? 1 : monthlyExpenseTotal,
                            color: _getCategoryColor(entry.key, categoryState),
                            currencySymbol: _currencySymbol(currency),
                          ),
                        ),
                      ),
                    const SizedBox(height: 20),
                    _SectionHeader(
                      title: 'Transactions',
                      trailing: Text(
                        '${monthExpenses.length} items',
                        style: GoogleFonts.outfit(
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    if (monthExpenses.isEmpty)
                      _EmptyInsightCard(
                        title: 'Your ledger is clear',
                        description:
                            'Add your first ${_filter == _RecordsFilter.income ? 'income' : 'transaction'} for ${DateFormat('MMMM').format(_selectedMonth)} to start building analytics and budgets.',
                        onTap: () => _openAddSheet(categoryState),
                        actionLabel: 'Add transaction',
                      )
                    else
                      ..._buildTransactionSections(
                        monthExpenses,
                        categoryState,
                        currency,
                      ),
                  ],
                ),
              );
            },
          ),
          floatingActionButton: FloatingActionButton.extended(
            heroTag: 'records_add_transaction',
            onPressed: () => _openAddSheet(categoryState),
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.black,
            icon: const Icon(Icons.add),
            label: const Text('Add Entry'),
          ),
        );
      },
    );
  }

  void _changeMonth(int offset) {
    setState(() {
      _selectedMonth = DateTime(_selectedMonth.year, _selectedMonth.month + offset);
    });
  }

  Future<void> _openAddSheet(CategoryState categoryState) async {
    var categories = ['General'];
    if (categoryState is CategoryLoaded && categoryState.categories.isNotEmpty) {
      categories = categoryState.categories
          .map((category) => category.name.trim())
          .where((name) => name.isNotEmpty)
          .toSet()
          .toList()
        ..sort();
    }

    final result = await showAddExpenseSheet(context, categories);
    if (!mounted || result == null) {
      return;
    }

    context.read<ExpenseBloc>().add(
          AddExpense(
            groupId: widget.groupId,
            title: result['title'] as String,
            amount: result['amount'] as double,
            paidBy: 'local-user',
            category: (result['category'] as String?) ?? 'General',
            splits: {'local-user': result['amount'] as double},
            transactionType:
                (result['type'] as TransactionType?) ?? TransactionType.expense,
          ),
        );
  }

  List<Widget> _buildTransactionSections(
    List<Expense> expenses,
    CategoryState categoryState,
    String currency,
  ) {
    final widgets = <Widget>[];

    for (var index = 0; index < expenses.length; index++) {
      final expense = expenses[index];
      final shouldShowHeader = index == 0 ||
          !DateUtils.isSameDay(expense.updatedAt, expenses[index - 1].updatedAt);

      if (shouldShowHeader) {
        widgets.add(
          Padding(
            padding: EdgeInsets.only(top: index == 0 ? 0 : 16, bottom: 8),
            child: Text(
              DateFormat('EEE, dd MMM').format(expense.updatedAt.toLocal()),
              style: GoogleFonts.outfit(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        );
      }

      widgets.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _TransactionCard(
            expense: expense,
            categoryColor: _getCategoryColor(expense.category, categoryState),
            categoryIcon: _getCategoryIcon(expense.category, categoryState),
            currencySymbol: _currencySymbol(currency),
            onDelete: () {
              context.read<ExpenseBloc>().add(
                    DeleteExpense(expense.id, widget.groupId),
                  );
            },
          ),
        ),
      );
    }

    return widgets;
  }

  List<MapEntry<String, double>> _buildCategoryBreakdown(List<Expense> expenses) {
    final totals = <String, double>{};

    for (final expense in expenses) {
      if (expense.transactionType != TransactionType.expense) {
        continue;
      }
      totals.update(
        expense.category,
        (value) => value + expense.amount,
        ifAbsent: () => expense.amount,
      );
    }

    final entries = totals.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return entries;
  }

  String _currencySymbol(String currency) {
    switch (currency) {
      case 'INR':
        return '₹';
      case 'EUR':
        return '€';
      case 'GBP':
        return '£';
      case 'AED':
        return 'AED ';
      case 'USD':
      default:
        return '\$';
    }
  }

  Color _getCategoryColor(String category, CategoryState state) {
    if (state is CategoryLoaded) {
      final match = state.categories.where(
        (item) => item.name.toLowerCase() == category.toLowerCase(),
      );
      if (match.isNotEmpty) {
        return match.first.color;
      }
    }

    switch (category.toLowerCase()) {
      case 'food':
        return Colors.redAccent;
      case 'transport':
      case 'transportation':
        return Colors.blue;
      case 'shopping':
        return Colors.pinkAccent;
      case 'salary':
        return AppColors.success;
      case 'transfer':
        return AppColors.accent;
      default:
        return AppColors.primary;
    }
  }

  IconData _getCategoryIcon(String category, CategoryState state) {
    if (state is CategoryLoaded) {
      final match = state.categories.where(
        (item) => item.name.toLowerCase() == category.toLowerCase(),
      );
      if (match.isNotEmpty) {
        return match.first.icon;
      }
    }

    switch (category.toLowerCase()) {
      case 'food':
        return Icons.restaurant;
      case 'transport':
      case 'transportation':
        return Icons.directions_bus;
      case 'shopping':
        return Icons.shopping_bag;
      case 'salary':
        return Icons.payments_outlined;
      case 'transfer':
        return Icons.swap_horiz;
      default:
        return Icons.category_outlined;
    }
  }
}

class _MonthStrip extends StatelessWidget {
  final DateTime selectedMonth;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const _MonthStrip({
    required this.selectedMonth,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: onPrevious,
            icon: const Icon(Icons.chevron_left, color: AppColors.textPrimary),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  DateFormat('MMMM yyyy').format(selectedMonth),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  'Tap between months to compare performance',
                  style: GoogleFonts.outfit(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onNext,
            icon: const Icon(Icons.chevron_right, color: AppColors.textPrimary),
          ),
        ],
      ),
    );
  }
}

class _HeroSummaryCard extends StatelessWidget {
  final String currencySymbol;
  final double balance;
  final double monthlyExpenseTotal;
  final double monthlyIncomeTotal;
  final int transactionCount;
  final String topCategory;

  const _HeroSummaryCard({
    required this.currencySymbol,
    required this.balance,
    required this.monthlyExpenseTotal,
    required this.monthlyIncomeTotal,
    required this.transactionCount,
    required this.topCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFFE082), Color(0xFFFFCA28)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Net position',
            style: GoogleFonts.outfit(
              color: Colors.black.withValues(alpha: 0.65),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '$currencySymbol${balance.toStringAsFixed(2)}',
            style: GoogleFonts.outfit(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 34,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Leading category: $topCategory',
            style: GoogleFonts.outfit(
              color: Colors.black.withValues(alpha: 0.72),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: _HeroMetric(
                  label: 'Spent',
                  value: '$currencySymbol${monthlyExpenseTotal.toStringAsFixed(0)}',
                ),
              ),
              Expanded(
                child: _HeroMetric(
                  label: 'Income',
                  value: '$currencySymbol${monthlyIncomeTotal.toStringAsFixed(0)}',
                ),
              ),
              Expanded(
                child: _HeroMetric(
                  label: 'Entries',
                  value: '$transactionCount',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeroMetric extends StatelessWidget {
  final String label;
  final String value;

  const _HeroMetric({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.outfit(
            color: Colors.black.withValues(alpha: 0.62),
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: GoogleFonts.outfit(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class _QuickActionRow extends StatelessWidget {
  final VoidCallback onAdd;
  final VoidCallback onExport;
  final VoidCallback onCategories;

  const _QuickActionRow({
    required this.onAdd,
    required this.onExport,
    required this.onCategories,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _QuickActionButton(
            icon: Icons.add_circle_outline,
            label: 'Add',
            onTap: onAdd,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _QuickActionButton(
            icon: Icons.file_download_outlined,
            label: 'Export',
            onTap: onExport,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _QuickActionButton(
            icon: Icons.category_outlined,
            label: 'Categories',
            onTap: onCategories,
          ),
        ),
      ],
    );
  }
}

class _QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuickActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Ink(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            Icon(icon, color: AppColors.primary),
            const SizedBox(height: 8),
            Text(
              label,
              style: GoogleFonts.outfit(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final Widget? trailing;

  const _SectionHeader({
    required this.title,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            title,
            style: GoogleFonts.outfit(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        if (trailing != null) trailing!,
      ],
    );
  }
}

class _FilterChips extends StatelessWidget {
  final _RecordsFilter filter;
  final ValueChanged<_RecordsFilter> onChanged;

  const _FilterChips({
    required this.filter,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: [
        _filterChip('All', _RecordsFilter.all),
        _filterChip('Expense', _RecordsFilter.expense),
        _filterChip('Income', _RecordsFilter.income),
      ],
    );
  }

  Widget _filterChip(String label, _RecordsFilter value) {
    final selected = filter == value;
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) => onChanged(value),
      selectedColor: AppColors.primary.withValues(alpha: 0.18),
      backgroundColor: AppColors.surface,
      labelStyle: GoogleFonts.outfit(
        color: selected ? AppColors.primary : AppColors.textSecondary,
        fontWeight: FontWeight.w700,
      ),
      side: BorderSide(
        color: selected ? AppColors.primary : Colors.transparent,
      ),
    );
  }
}

class _MetricTile extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const _MetricTile({
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.outfit(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: GoogleFonts.outfit(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryInsightTile extends StatelessWidget {
  final String category;
  final double amount;
  final double total;
  final Color color;
  final String currencySymbol;

  const _CategoryInsightTile({
    required this.category,
    required this.amount,
    required this.total,
    required this.color,
    required this.currencySymbol,
  });

  @override
  Widget build(BuildContext context) {
    final progress = total == 0 ? 0.0 : amount / total;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  category,
                  style: GoogleFonts.outfit(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
              Text(
                '$currencySymbol${amount.toStringAsFixed(0)}',
                style: GoogleFonts.outfit(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: progress.clamp(0.0, 1.0),
              minHeight: 8,
              backgroundColor: AppColors.surfaceHighlight,
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyInsightCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback? onTap;
  final String? actionLabel;

  const _EmptyInsightCard({
    required this.title,
    required this.description,
    this.onTap,
    this.actionLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.surfaceHighlight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.outfit(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: GoogleFonts.outfit(
              color: AppColors.textSecondary,
              height: 1.4,
            ),
          ),
          if (onTap != null && actionLabel != null) ...[
            const SizedBox(height: 14),
            FilledButton(
              onPressed: onTap,
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.black,
              ),
              child: Text(actionLabel!),
            ),
          ],
        ],
      ),
    );
  }
}

class _TransactionCard extends StatelessWidget {
  final Expense expense;
  final Color categoryColor;
  final IconData categoryIcon;
  final String currencySymbol;
  final VoidCallback onDelete;

  const _TransactionCard({
    required this.expense,
    required this.categoryColor,
    required this.categoryIcon,
    required this.currencySymbol,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final isExpense = expense.transactionType == TransactionType.expense;
    final isTransfer = expense.transactionType == TransactionType.transfer;
    final amountColor = isTransfer
        ? AppColors.accent
        : (isExpense ? AppColors.error : AppColors.success);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: categoryColor.withValues(alpha: 0.16),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(categoryIcon, color: categoryColor),
        ),
        title: Text(
          expense.title.isEmpty ? expense.category : expense.title,
          style: GoogleFonts.outfit(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            '${expense.category} • ${DateFormat('hh:mm a').format(expense.updatedAt.toLocal())}',
            style: GoogleFonts.outfit(color: AppColors.textSecondary),
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '${isTransfer ? '' : (isExpense ? '-' : '+')}$currencySymbol${expense.amount.toStringAsFixed(2)}',
              style: GoogleFonts.outfit(
                color: amountColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            PopupMenuButton<String>(
              padding: EdgeInsets.zero,
              color: AppColors.surface,
              onSelected: (value) {
                if (value == 'delete') {
                  onDelete();
                }
              },
              itemBuilder: (_) => const [
                PopupMenuItem<String>(
                  value: 'delete',
                  child: Text('Delete'),
                ),
              ],
              child: const Padding(
                padding: EdgeInsets.only(top: 4),
                child: Icon(
                  Icons.more_horiz,
                  color: AppColors.textSecondary,
                  size: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
