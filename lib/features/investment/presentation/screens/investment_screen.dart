import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/di/service_locator.dart';
import '../../data/models/investment_isar.dart';
import '../bloc/investment_bloc.dart';
import '../widgets/investment_card.dart';
import '../widgets/portfolio_selector.dart';
import '../widgets/portfolio_summary_card.dart';
import '../widgets/portfolio_allocation_chart.dart';
import '../widgets/performance_summary.dart';
import '../widgets/add_investment_bottom_sheet.dart';
import '../widgets/add_portfolio_bottom_sheet.dart';
import '../../../../core/theme/app_theme.dart';

class InvestmentScreen extends StatefulWidget {
  const InvestmentScreen({super.key});

  @override
  State<InvestmentScreen> createState() => _InvestmentScreenState();
}

class _InvestmentScreenState extends State<InvestmentScreen>
    with TickerProviderStateMixin {
  static const _journalKey = 'investment_income_journal_v1';
  static const _taxLotsKey = 'investment_tax_lots_v1';

  late TabController _tabController;
  List<_InvestmentIncomeEvent> _journal = const [];
  List<_TaxLotEvent> _taxLots = const [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    context.read<InvestmentBloc>().add(const LoadInvestments());
    _loadJournal();
    _loadTaxLots();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Investment Portfolio'),
        backgroundColor: AppTheme.primaryColor,
        foregroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(text: 'Overview', icon: Icon(Icons.dashboard)),
            Tab(text: 'Portfolio', icon: Icon(Icons.pie_chart)),
            Tab(text: 'Performance', icon: Icon(Icons.trending_up)),
            Tab(text: 'Income', icon: Icon(Icons.payments_outlined)),
            Tab(text: 'All Assets', icon: Icon(Icons.list)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<InvestmentBloc>().add(const RefreshInvestments());
            },
          ),
        ],
      ),
      body: BlocBuilder<InvestmentBloc, InvestmentState>(
        builder: (context, state) {
          if (state.status == InvestmentStatus.loading && state.investments.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.status == InvestmentStatus.failure && state.investments.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    'Error loading investments',
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
                      context.read<InvestmentBloc>().add(const LoadInvestments());
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          return TabBarView(
            controller: _tabController,
            children: [
              _buildOverviewTab(state),
              _buildPortfolioTab(state),
              _buildPerformanceTab(state),
              _buildIncomeTab(state),
              _buildAllAssetsTab(state),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddMenu,
        backgroundColor: AppTheme.primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildOverviewTab(InvestmentState state) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PortfolioSelector(
            portfolios: state.portfolios,
            selectedPortfolioId: state.selectedPortfolioId,
            onPortfolioSelected: (portfolioId) {
              context.read<InvestmentBloc>().add(SelectPortfolio(portfolioId));
            },
            onAddPortfolio: _showAddPortfolioBottomSheet,
          ),
          const SizedBox(height: 24),
          if (state.hasSelectedPortfolio) ...[
            PortfolioSummaryCard(
              totalValue: state.totalPortfolioValue,
              totalCost: state.totalPortfolioCost,
              totalGainLoss: state.totalPortfolioGainLoss,
              totalGainLossPercentage: state.totalPortfolioGainLossPercentage,
              investmentCount: state.totalInvestments,
              profitableCount: state.profitableInvestments,
              losingCount: state.losingInvestments,
            ),
            const SizedBox(height: 24),
            _buildQuickStats(state),
            const SizedBox(height: 24),
            _buildRecentInvestments(state),
          ] else ...[
            _buildEmptyState(),
          ],
        ],
      ),
    );
  }

  Widget _buildQuickStats(InvestmentState state) {
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
            'Quick Stats',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  'Best Performer',
                  state.topPerformers.isNotEmpty 
                      ? state.topPerformers.first.name
                      : 'N/A',
                  state.topPerformers.isNotEmpty 
                      ? '+${state.topPerformers.first.unrealizedGainLossPercentage.toStringAsFixed(1)}%'
                      : '0%',
                  Colors.green,
                  Icons.trending_up,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  'Worst Performer',
                  state.worstPerformers.isNotEmpty 
                      ? state.worstPerformers.first.name
                      : 'N/A',
                  state.worstPerformers.isNotEmpty 
                      ? '${state.worstPerformers.first.unrealizedGainLossPercentage.toStringAsFixed(1)}%'
                      : '0%',
                  Colors.red,
                  Icons.trending_down,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    String subtitle,
    Color color,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 16),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 10,
                    color: color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            value.length > 15 ? '${value.substring(0, 15)}...' : value,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: color,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 10,
              color: color.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentInvestments(InvestmentState state) {
    final recentInvestments = state.currentInvestments.take(5).toList();
    
    if (recentInvestments.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(32),
        child: const Center(
          child: Column(
            children: [
              Icon(Icons.show_chart, size: 64, color: Colors.grey),
              SizedBox(height: 16),
              Text('No investments in this portfolio'),
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
              'Recent Investments',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            if (state.currentInvestments.length > 5) ...[
              const Spacer(),
              TextButton(
                onPressed: () {
                  _tabController.animateTo(3);
                },
                child: const Text('View All'),
              ),
            ],
          ],
        ),
        const SizedBox(height: 12),
        ...recentInvestments.map((investment) {
          return AnimationConfiguration.staggeredList(
            position: recentInvestments.indexOf(investment),
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: InvestmentCard(investment: investment),
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Center(
        child: Column(
          children: [
            Icon(Icons.account_balance, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              'No Portfolio Selected',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.grey[600],
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Create a portfolio to start tracking your investments',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[500],
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _showAddPortfolioBottomSheet,
              icon: const Icon(Icons.add),
              label: const Text('Create Portfolio'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPortfolioTab(InvestmentState state) {
    if (!state.hasSelectedPortfolio) {
      return _buildEmptyState();
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PortfolioAllocationChart(
            allocation: state.portfolioAllocation,
            investments: state.currentInvestments,
          ),
          const SizedBox(height: 24),
          _buildAllocationDetails(state),
        ],
      ),
    );
  }

  Widget _buildAllocationDetails(InvestmentState state) {
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
            'Allocation Details',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          ...state.portfolioAllocation.entries.map((entry) {
            final investment = state.currentInvestments
                .where((inv) => inv.name == entry.key)
                .firstOrNull;
            
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: _getColorForInvestment(investment?.type),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          entry.key,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (investment != null)
                          Text(
                            investment.symbol,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                      ],
                    ),
                  ),
                  Text(
                    '${entry.value.toStringAsFixed(1)}%',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildPerformanceTab(InvestmentState state) {
    if (!state.hasSelectedPortfolio) {
      return _buildEmptyState();
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PerformanceSummary(
            topPerformers: state.topPerformers,
            worstPerformers: state.worstPerformers,
          ),
        ],
      ),
    );
  }

  Widget _buildAllAssetsTab(InvestmentState state) {
    if (!state.hasSelectedPortfolio) {
      return _buildEmptyState();
    }

    return state.currentInvestments.isEmpty
        ? Container(
            padding: const EdgeInsets.all(32),
            child: const Center(
              child: Column(
                children: [
                  Icon(Icons.show_chart, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('No investments in this portfolio'),
                ],
              ),
            ),
          )
        : ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: state.currentInvestments.length,
            itemBuilder: (context, index) {
              final investment = state.currentInvestments[index];
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 375),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: InvestmentCard(investment: investment),
                  ),
                ),
              );
            },
          );
  }

  Widget _buildIncomeTab(InvestmentState state) {
    final portfolioId = state.selectedPortfolioId;
    final portfolioEvents = portfolioId == null
        ? <_InvestmentIncomeEvent>[]
        : _journal.where((event) => event.portfolioId == portfolioId).toList()
          ..sort((a, b) => b.date.compareTo(a.date));
    final dividends = portfolioEvents
        .where((event) => event.type == _InvestmentIncomeType.dividend)
        .fold<double>(0.0, (sum, event) => sum + event.amount);
    final realizedGains = portfolioEvents
        .where((event) => event.type == _InvestmentIncomeType.realizedGain)
        .fold<double>(0.0, (sum, event) => sum + event.amount);
    final portfolioLots = portfolioId == null
        ? <_TaxLotEvent>[]
        : _taxLots.where((event) => event.portfolioId == portfolioId).toList()
          ..sort((a, b) => b.date.compareTo(a.date));
    final openLots = portfolioLots.where((event) => !event.isClosed).length;
    final realizedFromLots = portfolioLots.fold<double>(
      0.0,
      (sum, event) => sum + event.realizedGain,
    );

    if (!state.hasSelectedPortfolio) {
      return _buildEmptyState();
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  'Dividends',
                  '₹${dividends.toStringAsFixed(0)}',
                  '${portfolioEvents.where((event) => event.type == _InvestmentIncomeType.dividend).length} events',
                  Colors.green,
                  Icons.savings_outlined,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  'Realized Gains',
                  '₹${realizedGains.toStringAsFixed(0)}',
                  '${portfolioEvents.where((event) => event.type == _InvestmentIncomeType.realizedGain).length} events',
                  Colors.blue,
                  Icons.candlestick_chart,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Track dividends, exits, realized P&L, and tax lots locally for each portfolio.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                FilledButton.icon(
                  onPressed: () => _showIncomeEventDialog(state.selectedPortfolioId!),
                  icon: const Icon(Icons.add),
                  label: const Text('Add Event'),
                ),
              ],
            ),
            ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  'Open Tax Lots',
                  '$openLots',
                  '${portfolioLots.length} total lots',
                  Colors.deepPurple,
                  Icons.layers_outlined,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  'Lot Realized P&L',
                  '₹${realizedFromLots.toStringAsFixed(0)}',
                  'Tax-lot exit ledger',
                  Colors.indigo,
                  Icons.rule_folder_outlined,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Maintain local tax lots for each position so realized gains are traceable lot by lot.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                FilledButton.icon(
                  onPressed: () => _showTaxLotDialog(state.selectedPortfolioId!),
                  icon: const Icon(Icons.add_chart),
                  label: const Text('Add Lot'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          if (portfolioEvents.isEmpty)
            Container(
              padding: const EdgeInsets.all(32),
              child: const Center(
                child: Column(
                  children: [
                    Icon(Icons.payments_outlined, size: 64, color: Colors.grey),
                    SizedBox(height: 16),
                    Text('No dividend or realized gain events yet'),
                  ],
                ),
              ),
            )
          else
            ...portfolioEvents.map(
              (event) => Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: event.type == _InvestmentIncomeType.dividend
                        ? Colors.green.withOpacity(0.1)
                        : Colors.blue.withOpacity(0.1),
                    child: Icon(
                      event.type == _InvestmentIncomeType.dividend
                          ? Icons.savings_outlined
                          : Icons.show_chart,
                      color: event.type == _InvestmentIncomeType.dividend
                          ? Colors.green
                          : Colors.blue,
                    ),
                  ),
                  title: Text(event.investmentName),
                  subtitle: Text(
                    '${event.type.label} • ${event.date.toIso8601String().split('T').first}${event.notes.isEmpty ? '' : ' • ${event.notes}'}',
                  ),
                  trailing: Text(
                    '₹${event.amount.toStringAsFixed(0)}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          if (portfolioLots.isNotEmpty) ...[
            const SizedBox(height: 20),
            Text(
              'Tax Lots',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            ...portfolioLots.map(
              (lot) => Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: lot.isClosed
                        ? Colors.indigo.withOpacity(0.12)
                        : Colors.deepPurple.withOpacity(0.12),
                    child: Icon(
                      lot.isClosed ? Icons.done_all : Icons.layers_outlined,
                      color: lot.isClosed ? Colors.indigo : Colors.deepPurple,
                    ),
                  ),
                  title: Text(lot.investmentName),
                  subtitle: Text(
                    '${lot.shares.toStringAsFixed(2)} shares • cost ₹${lot.costBasis.toStringAsFixed(0)}${lot.isClosed ? ' • sold ₹${lot.sellProceeds.toStringAsFixed(0)}' : ' • open lot'}',
                  ),
                  trailing: Text(
                    '${lot.realizedGain >= 0 ? '+' : '-'}₹${lot.realizedGain.abs().toStringAsFixed(0)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: lot.realizedGain >= 0 ? Colors.green : Colors.red,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _showAddMenu() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.add_chart),
              title: const Text('Add Investment'),
              onTap: () {
                Navigator.pop(context);
                if (state.hasSelectedPortfolio) {
                  _showAddInvestmentBottomSheet();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please select a portfolio first')),
                  );
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.folder),
              title: const Text('Create Portfolio'),
              onTap: () {
                Navigator.pop(context);
                _showAddPortfolioBottomSheet();
              },
            ),
            if (state.hasSelectedPortfolio)
              ListTile(
                leading: const Icon(Icons.payments_outlined),
                title: const Text('Add Dividend / Realized Gain'),
                onTap: () {
                  Navigator.pop(context);
                  _showIncomeEventDialog(state.selectedPortfolioId!);
                },
              ),
            if (state.hasSelectedPortfolio)
              ListTile(
                leading: const Icon(Icons.layers_outlined),
                title: const Text('Add Tax Lot'),
                onTap: () {
                  Navigator.pop(context);
                  _showTaxLotDialog(state.selectedPortfolioId!);
                },
              ),
          ],
        ),
      ),
    );
  }

  void _showAddInvestmentBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AddInvestmentBottomSheet(
        portfolioId: state.selectedPortfolioId!,
      ),
    );
  }

  void _showAddPortfolioBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const AddPortfolioBottomSheet(),
    );
  }

  Future<void> _loadJournal() async {
    final prefs = getIt<SharedPreferences>();
    final raw = prefs.getString(_journalKey);
    if (!mounted) {
      return;
    }
    setState(() {
      _journal = raw == null || raw.isEmpty
          ? []
          : (jsonDecode(raw) as List<dynamic>)
              .map((item) => _InvestmentIncomeEvent.fromJson(item as Map<String, dynamic>))
              .toList();
    });
  }

  Future<void> _persistJournal() async {
    final prefs = getIt<SharedPreferences>();
    await prefs.setString(
      _journalKey,
      jsonEncode(_journal.map((item) => item.toJson()).toList()),
    );
  }

  Future<void> _loadTaxLots() async {
    final prefs = getIt<SharedPreferences>();
    final raw = prefs.getString(_taxLotsKey);
    if (!mounted) {
      return;
    }
    setState(() {
      _taxLots = raw == null || raw.isEmpty
          ? []
          : (jsonDecode(raw) as List<dynamic>)
              .map((item) => _TaxLotEvent.fromJson(item as Map<String, dynamic>))
              .toList();
    });
  }

  Future<void> _persistTaxLots() async {
    final prefs = getIt<SharedPreferences>();
    await prefs.setString(
      _taxLotsKey,
      jsonEncode(_taxLots.map((item) => item.toJson()).toList()),
    );
  }

  Future<void> _showIncomeEventDialog(String portfolioId) async {
    final investmentNames = state.currentInvestments.map((item) => item.name).toList();
    if (investmentNames.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Add an investment first to log dividends or realized gains')),
      );
      return;
    }

    final amountController = TextEditingController();
    final notesController = TextEditingController();
    var selectedType = _InvestmentIncomeType.dividend;
    var selectedInvestment = investmentNames.first;

    await showDialog<void>(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setInnerState) => AlertDialog(
          title: const Text('Add Portfolio Income Event'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                initialValue: selectedInvestment,
                items: investmentNames
                    .map((item) => DropdownMenuItem(value: item, child: Text(item)))
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    setInnerState(() {
                      selectedInvestment = value;
                    });
                  }
                },
                decoration: const InputDecoration(labelText: 'Investment'),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<_InvestmentIncomeType>(
                initialValue: selectedType,
                items: _InvestmentIncomeType.values
                    .map(
                      (item) => DropdownMenuItem(
                        value: item,
                        child: Text(item.label),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    setInnerState(() {
                      selectedType = value;
                    });
                  }
                },
                decoration: const InputDecoration(labelText: 'Event Type'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: amountController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(labelText: 'Amount'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: notesController,
                decoration: const InputDecoration(labelText: 'Notes'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () async {
                final amount = double.tryParse(amountController.text.trim());
                if (amount == null || amount <= 0) {
                  return;
                }
                setState(() {
                  _journal = [
                    _InvestmentIncomeEvent(
                      id: DateTime.now().microsecondsSinceEpoch.toString(),
                      portfolioId: portfolioId,
                      investmentName: selectedInvestment,
                      type: selectedType,
                      amount: amount,
                      date: DateTime.now(),
                      notes: notesController.text.trim(),
                    ),
                    ..._journal,
                  ];
                });
                await _persistJournal();
                if (mounted) {
                  Navigator.pop(dialogContext);
                }
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showTaxLotDialog(String portfolioId) async {
    final investmentNames = state.currentInvestments.map((item) => item.name).toList();
    if (investmentNames.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Add an investment first to track tax lots')),
      );
      return;
    }

    final sharesController = TextEditingController();
    final costBasisController = TextEditingController();
    final proceedsController = TextEditingController();
    var selectedInvestment = investmentNames.first;
    var markClosed = false;

    await showDialog<void>(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setInnerState) => AlertDialog(
          title: const Text('Add Tax Lot'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                initialValue: selectedInvestment,
                items: investmentNames
                    .map((item) => DropdownMenuItem(value: item, child: Text(item)))
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    setInnerState(() {
                      selectedInvestment = value;
                    });
                  }
                },
                decoration: const InputDecoration(labelText: 'Investment'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: sharesController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(labelText: 'Shares'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: costBasisController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(labelText: 'Cost Basis'),
              ),
              const SizedBox(height: 12),
              SwitchListTile(
                value: markClosed,
                contentPadding: EdgeInsets.zero,
                title: const Text('Mark as sold'),
                subtitle: const Text('Capture realized gain when the lot is closed'),
                onChanged: (value) {
                  setInnerState(() {
                    markClosed = value;
                  });
                },
              ),
              if (markClosed)
                TextField(
                  controller: proceedsController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(labelText: 'Sell Proceeds'),
                ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () async {
                final shares = double.tryParse(sharesController.text.trim());
                final costBasis = double.tryParse(costBasisController.text.trim());
                final proceeds = markClosed ? double.tryParse(proceedsController.text.trim()) : 0.0;
                if (shares == null || shares <= 0 || costBasis == null || costBasis < 0) {
                  return;
                }
                if (markClosed && (proceeds == null || proceeds < 0)) {
                  return;
                }
                setState(() {
                  _taxLots = [
                    _TaxLotEvent(
                      id: DateTime.now().microsecondsSinceEpoch.toString(),
                      portfolioId: portfolioId,
                      investmentName: selectedInvestment,
                      shares: shares,
                      costBasis: costBasis,
                      sellProceeds: proceeds ?? 0,
                      isClosed: markClosed,
                      date: DateTime.now(),
                    ),
                    ..._taxLots,
                  ];
                });
                await _persistTaxLots();
                if (mounted) {
                  Navigator.pop(dialogContext);
                }
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  InvestmentState get state => context.read<InvestmentBloc>().state;

  Color _getColorForInvestment(InvestmentType? type) {
    switch (type) {
      case InvestmentType.stock:
        return Colors.blue;
      case InvestmentType.bond:
        return Colors.green;
      case InvestmentType.etf:
        return Colors.purple;
      case InvestmentType.mutualFund:
        return Colors.orange;
      case InvestmentType.reit:
        return Colors.teal;
      case InvestmentType.crypto:
        return Colors.amber;
      case InvestmentType.commodity:
        return Colors.brown;
      case InvestmentType.option:
        return Colors.red;
      case InvestmentType.other:
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }
}

enum _InvestmentIncomeType {
  dividend('Dividend'),
  realizedGain('Realized Gain');

  const _InvestmentIncomeType(this.label);

  final String label;
}

class _InvestmentIncomeEvent {
  const _InvestmentIncomeEvent({
    required this.id,
    required this.portfolioId,
    required this.investmentName,
    required this.type,
    required this.amount,
    required this.date,
    required this.notes,
  });

  factory _InvestmentIncomeEvent.fromJson(Map<String, dynamic> json) {
    return _InvestmentIncomeEvent(
      id: json['id'] as String,
      portfolioId: json['portfolioId'] as String,
      investmentName: json['investmentName'] as String,
      type: _InvestmentIncomeType.values.byName(json['type'] as String),
      amount: (json['amount'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      notes: json['notes'] as String? ?? '',
    );
  }

  final String id;
  final String portfolioId;
  final String investmentName;
  final _InvestmentIncomeType type;
  final double amount;
  final DateTime date;
  final String notes;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'portfolioId': portfolioId,
      'investmentName': investmentName,
      'type': type.name,
      'amount': amount,
      'date': date.toIso8601String(),
      'notes': notes,
    };
  }
}

class _TaxLotEvent {
  const _TaxLotEvent({
    required this.id,
    required this.portfolioId,
    required this.investmentName,
    required this.shares,
    required this.costBasis,
    required this.sellProceeds,
    required this.isClosed,
    required this.date,
  });

  factory _TaxLotEvent.fromJson(Map<String, dynamic> json) {
    return _TaxLotEvent(
      id: json['id'] as String,
      portfolioId: json['portfolioId'] as String,
      investmentName: json['investmentName'] as String,
      shares: (json['shares'] as num).toDouble(),
      costBasis: (json['costBasis'] as num).toDouble(),
      sellProceeds: (json['sellProceeds'] as num?)?.toDouble() ?? 0,
      isClosed: json['isClosed'] as bool? ?? false,
      date: DateTime.parse(json['date'] as String),
    );
  }

  final String id;
  final String portfolioId;
  final String investmentName;
  final double shares;
  final double costBasis;
  final double sellProceeds;
  final bool isClosed;
  final DateTime date;

  double get realizedGain => isClosed ? sellProceeds - costBasis : 0;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'portfolioId': portfolioId,
      'investmentName': investmentName,
      'shares': shares,
      'costBasis': costBasis,
      'sellProceeds': sellProceeds,
      'isClosed': isClosed,
      'date': date.toIso8601String(),
    };
  }
}
