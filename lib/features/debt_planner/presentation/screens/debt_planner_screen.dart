import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../data/models/debt_isar.dart';
import '../bloc/debt_planner_bloc.dart';
import '../widgets/debt_card.dart';
import '../widgets/add_debt_bottom_sheet.dart';
import '../widgets/payoff_strategy_selector.dart';
import '../widgets/payoff_plan_summary.dart';
import '../widgets/debt_progress_chart.dart';
import '../../../../core/theme/app_theme.dart';

class DebtPlannerScreen extends StatefulWidget {
  const DebtPlannerScreen({super.key});

  @override
  State<DebtPlannerScreen> createState() => _DebtPlannerScreenState();
}

class _DebtPlannerScreenState extends State<DebtPlannerScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final _monthlyPaymentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    context.read<DebtPlannerBloc>().add(const LoadDebts());
  }

  @override
  void dispose() {
    _tabController.dispose();
    _monthlyPaymentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Debt Payoff Planner'),
        backgroundColor: AppTheme.primaryColor,
        foregroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(text: 'Overview', icon: Icon(Icons.dashboard)),
            Tab(text: 'Strategy', icon: Icon(Icons.lightbulb)),
            Tab(text: 'All Debts', icon: Icon(Icons.list)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<DebtPlannerBloc>().add(const RefreshDebts());
            },
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOverviewTab(),
          _buildStrategyTab(),
          _buildAllDebtsTab(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDebtBottomSheet,
        backgroundColor: AppTheme.primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildOverviewTab() {
    return BlocBuilder<DebtPlannerBloc, DebtPlannerState>(
      builder: (context, state) {
        if (state.status == DebtPlannerStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.status == DebtPlannerStatus.failure) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error, size: 64, color: Colors.red),
                const SizedBox(height: 16),
                Text(
                  'Error loading debts',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Text(
                  state.errorMessage ?? 'Unknown error',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    context.read<DebtPlannerBloc>().add(const LoadDebts());
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSummaryCards(state),
              const SizedBox(height: 24),
              _buildDebtProgressChart(state),
              const SizedBox(height: 24),
              if (state.hasValidPayoffPlan) ...[
                _buildPayoffPlanSummary(state),
                const SizedBox(height: 24),
              ],
              _buildDebtList(state, showAll: false),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSummaryCards(DebtPlannerState state) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildSummaryCard(
                'Total Debt',
                '\$${state.totalDebt.toStringAsFixed(2)}',
                '${state.totalDebts} debts',
                AppTheme.primaryColor,
                Icons.account_balance,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildSummaryCard(
                'Monthly Payments',
                '\$${state.totalMonthlyPayments.toStringAsFixed(2)}',
                'Minimum payments',
                Colors.orange,
                Icons.payment,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildSummaryCard(
                'Avg Interest Rate',
                '${state.averageInterestRate.toStringAsFixed(1)}%',
                'Across all debts',
                Colors.red,
                Icons.percent,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildSummaryCard(
                'Interest Paid',
                '\$${state.totalInterestPaid.toStringAsFixed(2)}',
                'Total so far',
                Colors.purple,
                Icons.trending_up,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSummaryCard(
    String title,
    String value,
    String subtitle,
    Color color,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    color: color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 12,
              color: color.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDebtProgressChart(DebtPlannerState state) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Debt Progress',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: DebtProgressChart(debts: state.debts),
          ),
        ],
      ),
    );
  }

  Widget _buildPayoffPlanSummary(DebtPlannerState state) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.lightbulb, color: Colors.green),
              const SizedBox(width: 8),
              Text(
                'Payoff Plan - ${state.strategy.displayName}',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          PayoffPlanSummary(plan: state.payoffPlan!),
        ],
      ),
    );
  }

  Widget _buildDebtList(DebtPlannerState state, {bool showAll = false}) {
    final debts = showAll ? state.debts : state.debts.take(3).toList();
    
    if (debts.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(32),
        child: const Center(
          child: Column(
            children: [
              Icon(Icons.account_balance_wallet, size: 64, color: Colors.grey),
              SizedBox(height: 16),
              Text('No debts added yet'),
            ],
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              showAll ? 'All Debts' : 'Recent Debts',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            if (!showAll && state.debts.length > 3) ...[
              const Spacer(),
              TextButton(
                onPressed: () {
                  _tabController.animateTo(2);
                },
                child: const Text('View All'),
              ),
            ],
          ],
        ),
        const SizedBox(height: 12),
        ...debts.map((debt) {
          return AnimationConfiguration.staggeredList(
            position: debts.indexOf(debt),
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: DebtCard(debt: debt),
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildStrategyTab() {
    return BlocBuilder<DebtPlannerBloc, DebtPlannerState>(
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildMonthlyPaymentInput(state),
              const SizedBox(height: 24),
              PayoffStrategySelector(
                selectedStrategy: state.strategy,
                onStrategyChanged: (strategy) {
                  context.read<DebtPlannerBloc>().add(UpdateStrategy(strategy));
                },
              ),
              const SizedBox(height: 24),
              if (state.hasValidPayoffPlan) ...[
                _buildDetailedPayoffPlan(state),
                const SizedBox(height: 24),
              ],
              _buildStrategyComparison(state),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMonthlyPaymentInput(DebtPlannerState state) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Monthly Payment Amount',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _monthlyPaymentController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Enter monthly payment amount',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              prefixIcon: const Icon(Icons.attach_money),
              suffixText: 'USD',
            ),
            onChanged: (value) {
              final amount = double.tryParse(value);
              if (amount != null && amount > 0) {
                context.read<DebtPlannerBloc>().add(UpdateMonthlyPayment(amount));
              }
            },
          ),
          const SizedBox(height: 12),
          Text(
            'Minimum payments: \$${state.totalMonthlyPayments.toStringAsFixed(2)}',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailedPayoffPlan(DebtPlannerState state) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payoff Projection',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          PayoffPlanSummary(plan: state.payoffPlan!, showDetails: true),
        ],
      ),
    );
  }

  Widget _buildStrategyComparison(DebtPlannerState state) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Strategy Comparison',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          // This would show comparison between different strategies
          // For now, show current strategy info
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.strategy.displayName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  state.strategy.description,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAllDebtsTab() {
    return BlocBuilder<DebtPlannerBloc, DebtPlannerState>(
      builder: (context, state) {
        if (state.status == DebtPlannerStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        return state.debts.isEmpty
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.account_balance_wallet, size: 64, color: Colors.grey),
                    SizedBox(height: 16),
                    Text('No debts added yet'),
                    SizedBox(height: 8),
                    Text('Add your first debt to get started'),
                  ],
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.debts.length,
                itemBuilder: (context, index) {
                  final debt = state.debts[index];
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: DebtCard(debt: debt),
                      ),
                    ),
                  );
                },
              );
      },
    );
  }

  void _showAddDebtBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const AddDebtBottomSheet(),
    );
  }
}
