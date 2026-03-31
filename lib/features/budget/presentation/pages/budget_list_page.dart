import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../bill_reminders/data/repositories/bill_reminder_repository.dart';
import '../../../category/presentation/bloc/category_bloc.dart';
import '../../../category/presentation/bloc/category_state.dart';
import '../../../expense/domain/entitities/Expense.dart';
import '../../../expense/domain/repositories/expense_repository.dart';
import '../../domain/usecases/get_budgets_usecase.dart';
import '../bloc/budget_bloc.dart';
import '../bloc/budget_event.dart';
import '../bloc/budget_state.dart';

class BudgetListPage extends StatelessWidget {
  const BudgetListPage({
    super.key,
    required this.groupId,
  });

  final String groupId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BudgetBloc>()..add(LoadBudgets(groupId)),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          title: Text(
            'Monthly Budgets',
            style: GoogleFonts.outfit(color: AppColors.textPrimary),
          ),
          iconTheme: const IconThemeData(color: AppColors.primary),
        ),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton.extended(
            heroTag: 'add_budget_fab',
            onPressed: () => _showAddBudgetDialog(context, groupId),
            backgroundColor: AppColors.secondary,
            icon: const Icon(Icons.add),
            label: const Text('Set Limit'),
          ),
        ),
        body: BlocBuilder<BudgetBloc, BudgetState>(
          builder: (context, state) {
            if (state is BudgetLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is BudgetError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: AppColors.error),
                ),
              );
            }
            if (state is! BudgetLoaded) {
              return const SizedBox.shrink();
            }

            return FutureBuilder<_BudgetForecastData>(
              future: _loadForecastData(groupId, state.budgets),
              builder: (context, snapshot) {
                final forecast = snapshot.data ??
                    const _BudgetForecastData(
                      monthlyIncome: 0,
                      monthlyRecurringExpenses: 0,
                      billsDueSoon: 0,
                      spentThisMonth: 0,
                      budgetedTotal: 0,
                      overBudgetCount: 0,
                    );

                return ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    _ForecastPanel(forecast: forecast),
                    const SizedBox(height: 16),
                    if (state.budgets.isEmpty)
                      Center(
                        child: Text(
                          'No budgets set for this month.',
                          style: GoogleFonts.outfit(color: Colors.white54),
                        ),
                      )
                    else
                      ...state.budgets.map(
                        (item) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: _BudgetCard(item: item),
                        ),
                      ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }

  Future<_BudgetForecastData> _loadForecastData(
    String groupId,
    List<BudgetWithProgress> budgets,
  ) async {
    const recurringKey = 'planner_recurring_v1';
    final prefs = getIt<SharedPreferences>();
    final expenseRepository = getIt<ExpenseRepository>();
    final billRepository = getIt<BillReminderRepository>();

    final expenses = await expenseRepository.getExpenses(groupId);
    final now = DateTime.now();
    final currentMonthExpenses = expenses.where((expense) {
      return !expense.isDeleted &&
          expense.updatedAt.year == now.year &&
          expense.updatedAt.month == now.month;
    }).toList();

    final rawTemplates = prefs.getString(recurringKey);
    final recurring = rawTemplates == null
        ? <Map<String, dynamic>>[]
        : (jsonDecode(rawTemplates) as List<dynamic>)
            .map((item) => Map<String, dynamic>.from(item as Map))
            .toList();

    final monthlyIncome = recurring
        .where((item) => item['isEnabled'] == true && item['transactionType'] == 'income')
        .fold<double>(0.0, (sum, item) => sum + (item['amount'] as num).toDouble());
    final monthlyRecurringExpenses = recurring
        .where((item) => item['isEnabled'] == true && item['transactionType'] == 'expense')
        .fold<double>(0.0, (sum, item) => sum + (item['amount'] as num).toDouble());
    final bills = await billRepository.getPendingBills();
    final dueWithinThirtyDays = bills
        .where((bill) => !bill.dueDate.isAfter(now.add(const Duration(days: 30))))
        .fold<double>(0.0, (sum, bill) => sum + bill.amount);
    final spentThisMonth = currentMonthExpenses.fold<double>(0.0, (sum, expense) {
      return sum + (expense.transactionType == TransactionType.expense ? expense.amount : 0.0);
    });

    return _BudgetForecastData(
      monthlyIncome: monthlyIncome,
      monthlyRecurringExpenses: monthlyRecurringExpenses,
      billsDueSoon: dueWithinThirtyDays,
      spentThisMonth: spentThisMonth,
      budgetedTotal: budgets.fold<double>(0.0, (sum, item) => sum + item.budget.limit),
      overBudgetCount: budgets.where((item) => item.isOverBudget).length,
    );
  }

  void _showAddBudgetDialog(BuildContext context, String groupId) {
    final budgetBloc = context.read<BudgetBloc>();
    final categoryState = context.read<CategoryBloc>().state;
    final limitController = TextEditingController();

    List<String> categoriesList = ['General'];
    if (categoryState is CategoryLoaded) {
      categoriesList = categoryState.categories.map((c) => c.name).toSet().toList();
    }

    if (categoriesList.isEmpty) {
      categoriesList = ['General'];
    }
    var selectedCategory = categoriesList.first;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: const Text('Set Budget Limit', style: TextStyle(color: Colors.white)),
        content: StatefulBuilder(
          builder: (dialogContext, setState) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                initialValue: selectedCategory,
                dropdownColor: AppColors.surface,
                items: categoriesList
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(
                          category,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedCategory = value;
                    });
                  }
                },
                decoration: const InputDecoration(
                  labelText: 'Category',
                  labelStyle: TextStyle(color: Colors.white70),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: limitController,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Monthly Limit (₹)',
                  labelStyle: TextStyle(color: Colors.white70),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white24),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (limitController.text.isEmpty) {
                return;
              }
              budgetBloc.add(
                CreateBudget(
                  groupId: groupId,
                  category: selectedCategory,
                  limit: double.parse(limitController.text),
                ),
              );
              Navigator.pop(ctx);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}

class _BudgetCard extends StatelessWidget {
  const _BudgetCard({required this.item});

  final BudgetWithProgress item;

  @override
  Widget build(BuildContext context) {
    final percent = item.percentage;
    var progressColor = AppColors.primary;
    if (percent > 0.8) {
      progressColor = Colors.orange;
    }
    if (percent >= 1.0) {
      progressColor = Colors.red;
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.surfaceHighlight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.budget.category,
                style: GoogleFonts.outfit(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                '₹${item.budget.limit.toStringAsFixed(0)}',
                style: GoogleFonts.outfit(
                  fontSize: 16,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          LinearPercentIndicator(
            lineHeight: 12,
            percent: percent > 1.0 ? 1.0 : percent,
            backgroundColor: AppColors.surfaceHighlight,
            progressColor: progressColor,
            barRadius: const Radius.circular(6),
            padding: EdgeInsets.zero,
            animation: true,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Spent: ₹${item.spent.toStringAsFixed(0)}',
                style: TextStyle(
                  color: item.isOverBudget ? Colors.red : AppColors.textSecondary,
                  fontWeight: item.isOverBudget ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              Text(
                '${(item.spent / item.budget.limit * 100).toStringAsFixed(0)}%',
                style: TextStyle(color: progressColor, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ForecastPanel extends StatelessWidget {
  const _ForecastPanel({required this.forecast});

  final _BudgetForecastData forecast;

  @override
  Widget build(BuildContext context) {
    final forecastedNet = forecast.monthlyIncome -
        forecast.monthlyRecurringExpenses -
        forecast.billsDueSoon -
        forecast.spentThisMonth;
    final zeroBasedGap = forecast.monthlyIncome - forecast.budgetedTotal;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Advanced Budgeting',
            style: GoogleFonts.outfit(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _ForecastMetric(
                  label: 'Budgeted',
                  value: '₹${forecast.budgetedTotal.toStringAsFixed(0)}',
                ),
              ),
              Expanded(
                child: _ForecastMetric(
                  label: 'Income Plan',
                  value: '₹${forecast.monthlyIncome.toStringAsFixed(0)}',
                ),
              ),
              Expanded(
                child: _ForecastMetric(
                  label: 'Over Budget',
                  value: '${forecast.overBudgetCount}',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: (forecastedNet >= 0 ? AppColors.success : AppColors.error)
                  .withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '30-day cash-flow forecast',
                  style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Text(
                  '${forecastedNet >= 0 ? '+' : '-'}₹${forecastedNet.abs().toStringAsFixed(0)} projected',
                  style: GoogleFonts.outfit(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: forecastedNet >= 0 ? AppColors.success : AppColors.error,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Recurring outflow ₹${forecast.monthlyRecurringExpenses.toStringAsFixed(0)} • Bills due ₹${forecast.billsDueSoon.toStringAsFixed(0)} • Spent ₹${forecast.spentThisMonth.toStringAsFixed(0)}',
                  style: GoogleFonts.outfit(color: AppColors.textSecondary),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Text(
            zeroBasedGap >= 0
                ? 'Zero-based gap: ₹${zeroBasedGap.toStringAsFixed(0)} left to assign.'
                : 'Zero-based gap: oversubscribed by ₹${zeroBasedGap.abs().toStringAsFixed(0)}.',
            style: GoogleFonts.outfit(
              color: zeroBasedGap >= 0 ? AppColors.primary : AppColors.error,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _ForecastMetric extends StatelessWidget {
  const _ForecastMetric({
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
        Text(value, style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class _BudgetForecastData {
  const _BudgetForecastData({
    required this.monthlyIncome,
    required this.monthlyRecurringExpenses,
    required this.billsDueSoon,
    required this.spentThisMonth,
    required this.budgetedTotal,
    required this.overBudgetCount,
  });

  final double monthlyIncome;
  final double monthlyRecurringExpenses;
  final double billsDueSoon;
  final double spentThisMonth;
  final double budgetedTotal;
  final int overBudgetCount;
}
