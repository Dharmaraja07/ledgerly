import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../bloc/bill_reminder_bloc.dart';
import '../widgets/bill_card.dart';
import '../widgets/add_bill_bottom_sheet.dart';
import '../widgets/bill_calendar_view.dart';
import '../../../../core/theme/app_theme.dart';

class BillRemindersScreen extends StatefulWidget {
  const BillRemindersScreen({super.key});

  @override
  State<BillRemindersScreen> createState() => _BillRemindersScreenState();
}

class _BillRemindersScreenState extends State<BillRemindersScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    context.read<BillReminderBloc>().add(LoadBills());
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
        title: const Text('Bill Reminders'),
        backgroundColor: AppTheme.primaryColor,
        foregroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(text: 'Overview', icon: Icon(Icons.dashboard)),
            Tab(text: 'Calendar', icon: Icon(Icons.calendar_today)),
            Tab(text: 'All Bills', icon: Icon(Icons.list)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<BillReminderBloc>().add(const RefreshBills());
            },
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOverviewTab(),
          _buildCalendarTab(),
          _buildAllBillsTab(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddBillBottomSheet,
        backgroundColor: AppTheme.primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildOverviewTab() {
    return BlocBuilder<BillReminderBloc, BillReminderState>(
      builder: (context, state) {
        if (state.status == BillReminderStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.status == BillReminderStatus.failure) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error, size: 64, color: Colors.red),
                const SizedBox(height: 16),
                Text(
                  'Error loading bills',
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
                    context.read<BillReminderBloc>().add(const LoadBills());
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
              _buildOverdueBills(state),
              const SizedBox(height: 24),
              _buildDueSoonBills(state),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSummaryCards(BillReminderState state) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildSummaryCard(
                'Pending Bills',
                '${state.pendingBillCount}',
                '\$${state.totalPendingAmount.toStringAsFixed(2)}',
                Colors.orange,
                Icons.pending,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildSummaryCard(
                'Overdue Bills',
                '${state.overdueBillCount}',
                '\$${state.totalOverdueAmount.toStringAsFixed(2)}',
                Colors.red,
                Icons.warning,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildSummaryCard(
                'Due Soon',
                '${state.dueSoonBillCount}',
                'Next 3 days',
                Colors.yellow[700]!,
                Icons.schedule,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildSummaryCard(
                'Total Bills',
                '${state.bills.length}',
                'All time',
                AppTheme.primaryColor,
                Icons.receipt,
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
              fontSize: 24,
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

  Widget _buildOverdueBills(BillReminderState state) {
    if (state.overdueBills.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.warning, color: Colors.red),
            const SizedBox(width: 8),
            Text(
              'Overdue Bills (${state.overdueBills.length})',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...state.overdueBills.map((bill) {
          return AnimationConfiguration.staggeredList(
            position: state.overdueBills.indexOf(bill),
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: BillCard(bill: bill),
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildDueSoonBills(BillReminderState state) {
    if (state.dueSoonBills.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.schedule, color: Colors.orange),
            const SizedBox(width: 8),
            Text(
              'Due Soon (${state.dueSoonBills.length})',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...state.dueSoonBills.map((bill) {
          return AnimationConfiguration.staggeredList(
            position: state.dueSoonBills.indexOf(bill),
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: BillCard(bill: bill),
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildCalendarTab() {
    return BillCalendarView(
      focusedDay: _focusedDay,
      selectedDay: _selectedDay,
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
      },
    );
  }

  Widget _buildAllBillsTab() {
    return BlocBuilder<BillReminderBloc, BillReminderState>(
      builder: (context, state) {
        if (state.status == BillReminderStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            _buildFilterChips(state),
            Expanded(
              child: state.filteredBills.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.receipt_long, size: 64, color: Colors.grey),
                          SizedBox(height: 16),
                          Text('No bills found'),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: state.filteredBills.length,
                      itemBuilder: (context, index) {
                        final bill = state.filteredBills[index];
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 375),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: BillCard(bill: bill),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildFilterChips(BillReminderState state) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: BillFilter.values.map((filter) {
            final isSelected = state.filter == filter;
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: FilterChip(
                label: Text(filter.name.toUpperCase()),
                selected: isSelected,
                onSelected: (selected) {
                  context.read<BillReminderBloc>().add(FilterBills(filter));
                },
                backgroundColor: Colors.grey[200],
                selectedColor: AppTheme.primaryColor.withOpacity(0.2),
                checkmarkColor: AppTheme.primaryColor,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  void _showAddBillBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const AddBillBottomSheet(),
    );
  }
}
