import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../budget/presentation/pages/budget_list_page.dart';
import '../../../../export/presentation/bloc/export_bloc.dart';
import '../../../../export/presentation/bloc/export_event.dart';
import '../../../../export/presentation/bloc/export_state.dart';
import '../../../../../core/di/service_locator.dart';

import '../../bloc/expense_bloc.dart';
import '../../bloc/expense_event.dart';
import '../../bloc/expense_state.dart';
import 'add_expense_sheet.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/ui/premium_card.dart';
import '../../../../analytics/presentation/pages/analytics_page.dart';

class ExpenseListPage extends StatelessWidget {
  final String groupId;

  const ExpenseListPage({super.key, required this.groupId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: context.read<ExpenseBloc>()),
        BlocProvider(create: (context) => getIt<ExportBloc>()),
      ],
      child: BlocListener<ExportBloc, ExportState>(
        listener: (context, state) {
          if (state is ExportSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Exported to ${state.path}')),
            );
          } else if (state is ExportError) {
             ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message), backgroundColor: Colors.red),
            );
          }
        },
        child: Builder(
          builder: (context) {
             context.read<ExpenseBloc>().add(LoadExpenses(groupId));
             
             return Scaffold(
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  title: Text(
                    'Group Expenses',
                    style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
                  ),
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, size: 20),
                    onPressed: () => Navigator.pop(context),
                  ),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.wallet),
                      tooltip: 'Budgets',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BudgetListPage(groupId: groupId),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.file_download_outlined),
                      tooltip: 'Export CSV',
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Generating CSV...')),
                        );
                        context.read<ExportBloc>().add(ExportToCsv(groupId));
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.pie_chart_outline),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AnalyticsPage(groupId: groupId),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                floatingActionButton: FloatingActionButton.extended(
                  onPressed: () async {
                    final result = await showAddExpenseSheet(context);
                    if (result != null) {
                      context.read<ExpenseBloc>().add(
                        AddExpense(
                          groupId: groupId,
                          title: result['title'],
                          amount: result['amount'],
                          paidBy: 'demo-user',
                          category: result['category'] ?? 'General',
                          splits: {'demo-user': result['amount']},
                        ),
                      );
                    }
                  },
                  backgroundColor: AppColors.secondary,
                  icon: const Icon(Icons.add),
                  label: const Text("Add Expense"),
                ).animate().scale(delay: 500.ms),
                body: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.background,
                  ),
                  child: BlocBuilder<ExpenseBloc, ExpenseState>(
                    builder: (context, state) {
                      if (state is ExpenseLoaded) {
                         if (state.expenses.isEmpty) {
                           return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 Icon(Icons.receipt_long_outlined, size: 64, color: AppColors.textSecondary.withValues(alpha: 0.5)),
                                 const SizedBox(height: 16),
                                 const Text("No expenses here yet."),
                              ],
                            ).animate().fadeIn(),
                           );
                         }
                         
                         final total = state.expenses.fold(0.0, (sum, item) => sum + item.amount);
            
                        return CustomScrollView(
                          slivers: [
                             const SliverToBoxAdapter(child: SizedBox(height: 100)),
                             SliverToBoxAdapter(
                               child: Padding(
                                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                 child: Container(
                                   padding: const EdgeInsets.all(24),
                                   decoration: BoxDecoration(
                                     gradient: AppColors.primaryGradient,
                                     borderRadius: BorderRadius.circular(24),
                                     boxShadow: [
                                       BoxShadow(
                                         color: AppColors.primary.withValues(alpha: 0.3),
                                         blurRadius: 20,
                                         offset: const Offset(0, 10),
                                       )
                                     ]
                                   ),
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text(
                                         'Total Spending',
                                         style: GoogleFonts.outfit(
                                           color: Colors.black.withValues(alpha: 0.7),
                                           fontSize: 16,
                                           fontWeight: FontWeight.w600,
                                         ),
                                       ),
                                       const SizedBox(height: 8),
                                       Text(
                                         '₹${total.toStringAsFixed(2)}',
                                         style: GoogleFonts.spaceGrotesk(
                                           color: Colors.black,
                                           fontSize: 36,
                                           fontWeight: FontWeight.bold,
                                         ),
                                       ),
                                     ],
                                   ),
                                 ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0),
                               ),
                             ),
                             const SliverToBoxAdapter(child: SizedBox(height: 24)),
                             SliverToBoxAdapter(
                               child: Padding(
                                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                 child: Text(
                                   "Recent Transactions",
                                   style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                                 ),
                               ),
                             ),
                             SliverList(
                               delegate: SliverChildBuilderDelegate(
                                 (context, index) {
                                   final e = state.expenses[index];
                                   return PremiumCard(
                                     delay: Duration(milliseconds: 50 * index),
                                     child: Row(
                                       children: [
                                         Container(
                                           width: 40,
                                           height: 40,
                                           decoration: BoxDecoration(
                                             color: AppColors.surfaceHighlight,
                                             shape: BoxShape.circle,
                                           ),
                                           child: const Icon(Icons.shopping_bag_outlined, color: AppColors.textPrimary, size: 20),
                                         ),
                                         const SizedBox(width: 16),
                                         Expanded(
                                           child: Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                               Text(
                                                 e.title,
                                                 style: const TextStyle(
                                                   color: AppColors.textPrimary,
                                                   fontWeight: FontWeight.bold,
                                                   fontSize: 16,
                                                 ),
                                               ),
                                               Text(
                                                 'Paid by ${e.paidBy}',
                                                 style: const TextStyle(
                                                   color: AppColors.textSecondary,
                                                   fontSize: 12,
                                                 ),
                                               ),
                                             ],
                                           ),
                                         ),
                                         Text(
                                           '-₹${e.amount}',
                                           style: const TextStyle(
                                             color: AppColors.error,
                                             fontWeight: FontWeight.bold,
                                             fontSize: 16,
                                           ),
                                         ),
                                       ],
                                     ),
                                     onTap: () {},
                                   );
                                 },
                                 childCount: state.expenses.length,
                               ),
                             ),
                              const SliverToBoxAdapter(child: SizedBox(height: 100)),
                          ],
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
             );
          }
        ),
      ),
    );
  }
}
