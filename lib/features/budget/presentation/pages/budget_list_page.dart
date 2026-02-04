import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/di/service_locator.dart';
import '../bloc/budget_bloc.dart';
import '../bloc/budget_event.dart';
import '../bloc/budget_state.dart';
import '../../domain/usecases/get_budgets_usecase.dart';

class BudgetListPage extends StatelessWidget {
  final String groupId;

  const BudgetListPage({super.key, required this.groupId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BudgetBloc>()..add(LoadBudgets(groupId)),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
           title: Text('Monthly Budgets', style: GoogleFonts.outfit(color: AppColors.textPrimary)),
          iconTheme: const IconThemeData(color: AppColors.primary),
        ),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton.extended(
            onPressed: () => _showAddBudgetDialog(context, groupId),
             backgroundColor: AppColors.secondary,
            icon: const Icon(Icons.add),
            label: const Text("Set Limit"),
          ),
        ),
        body: BlocBuilder<BudgetBloc, BudgetState>(
          builder: (context, state) {
            if (state is BudgetLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BudgetLoaded) {
              if (state.budgets.isEmpty) {
                 return Center(child: Text("No budgets set for this month.", style: GoogleFonts.outfit(color: Colors.white54)));
              }
              
              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: state.budgets.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final item = state.budgets[index];
                  final percent = item.percentage;
                  
                  Color progressColor = AppColors.primary;
                  if (percent > 0.8) progressColor = Colors.orange;
                  if (percent >= 1.0) progressColor = Colors.red;

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
                          lineHeight: 12.0,
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
                              '${(percent * 100).toStringAsFixed(0)}%',
                              style: TextStyle(color: progressColor, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            }
             return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  void _showAddBudgetDialog(BuildContext context, String groupId) {
    // Basic Dialog for MVP
    final categoryController = TextEditingController();
    final limitController = TextEditingController();
    
    // Hardcoded categories same as Expense Sheet for consistency
    String selectedCategory = 'Food';
    final categories = ['Food', 'Transport', 'Rent', 'Entertainment', 'Health', 'Shopping', 'General'];

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: const Text('Set Budget Limit', style: TextStyle(color: Colors.white)),
        content: StatefulBuilder(
          builder: (context, setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                 DropdownButtonFormField<String>(
                    value: selectedCategory,
                    dropdownColor: AppColors.surface,
                    items: categories.map((c) => DropdownMenuItem(value: c, child: Text(c, style: const TextStyle(color: Colors.white)))).toList(),
                    onChanged: (v) => setState(() => selectedCategory = v!),
                    decoration: const InputDecoration(labelText: 'Category', labelStyle: TextStyle(color: Colors.white70)),
                  ),
                const SizedBox(height: 16),
                TextField(
                  controller: limitController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.white),
                   decoration: const InputDecoration(
                    labelText: 'Monthly Limit (₹)',
                    labelStyle: TextStyle(color: Colors.white70),
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white24)),
                  ),
                ),
              ],
            );
          }
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          TextButton(
            onPressed: () {
               if (limitController.text.isNotEmpty) {
                 context.read<BudgetBloc>().add(
                   CreateBudget(
                     groupId: groupId,
                     category: selectedCategory,
                     limit: double.parse(limitController.text),
                   ),
                 );
                 Navigator.pop(ctx);
               }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
