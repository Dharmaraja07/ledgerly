import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../data/models/bill_reminder_isar.dart';
import '../bloc/bill_reminder_bloc.dart';
import '../../../../core/theme/app_theme.dart';

class BillCalendarView extends StatefulWidget {
  final DateTime focusedDay;
  final DateTime? selectedDay;
  final Function(DateTime, DateTime) onDaySelected;

  const BillCalendarView({
    super.key,
    required this.focusedDay,
    this.selectedDay,
    required this.onDaySelected,
  });

  @override
  State<BillCalendarView> createState() => _BillCalendarViewState();
}

class _BillCalendarViewState extends State<BillCalendarView> {
  late DateTime _focusedDay;
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _focusedDay = widget.focusedDay;
    _selectedDay = widget.selectedDay;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BillReminderBloc, BillReminderState>(
      builder: (context, state) {
        return Column(
          children: [
            _buildCalendar(state),
            if (_selectedDay != null) _buildBillsForSelectedDay(state),
          ],
        );
      },
    );
  }

  Widget _buildCalendar(BillReminderState state) {
    return Container(
      margin: const EdgeInsets.all(16),
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
      child: TableCalendar<BillReminderIsar>(
        firstDay: DateTime.now().subtract(const Duration(days: 365)),
        lastDay: DateTime.now().add(const Duration(days: 365)),
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        eventLoader: (day) {
          return _getBillsForDay(day, state.bills);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
          widget.onDaySelected(selectedDay, focusedDay);
        },
        onPageChanged: (focusedDay) {
          setState(() {
            _focusedDay = focusedDay;
          });
        },
        calendarStyle: CalendarStyle(
          outsideDaysVisible: true,
          weekendTextStyle: const TextStyle(color: Colors.red),
          holidayTextStyle: const TextStyle(color: Colors.red),
          selectedDecoration: BoxDecoration(
            color: AppTheme.primaryColor,
            shape: BoxShape.circle,
          ),
          todayDecoration: BoxDecoration(
            color: AppTheme.primaryColor.withOpacity(0.5),
            shape: BoxShape.circle,
          ),
          markerDecoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
          markersMaxCount: 3,
        ),
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          headerPadding: const EdgeInsets.symmetric(vertical: 16),
        ),
        daysOfWeekStyle: DaysOfWeekStyle(
          weekendStyle: const TextStyle(color: Colors.red),
        ),
        calendarBuilders: CalendarBuilders(
          markerBuilder: (context, date, events) {
            if (events.isEmpty) return null;
            
            final overdueCount = events.where((bill) => bill.isOverdue).length;
            final pendingCount = events.where((bill) => bill.status == BillStatus.pending).length;
            
            return Positioned(
              right: 1,
              bottom: 1,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (overdueCount > 0)
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  if (pendingCount > 0 && overdueCount == 0)
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBillsForSelectedDay(BillReminderState state) {
    if (_selectedDay == null) return const SizedBox.shrink();

    final billsForDay = _getBillsForDay(_selectedDay!, state.bills);
    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  color: AppTheme.primaryColor,
                ),
                const SizedBox(width: 8),
                Text(
                  'Bills for ${_formatDate(_selectedDay!)}',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Spacer(),
                Text(
                  '${billsForDay.length} bills',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                ),
              ],
            ),
          ),
          if (billsForDay.isEmpty)
            Container(
              padding: const EdgeInsets.all(32),
              child: Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: 64,
                      color: Colors.green[300],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'No bills due on this day',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.grey[600],
                          ),
                    ),
                  ],
                ),
              ),
            )
          else
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: billsForDay.length,
              itemBuilder: (context, index) {
                final bill = billsForDay[index];
                return _buildBillCard(bill);
              },
            ),
        ],
      ),
    );
  }

  Widget _buildBillCard(BillReminderIsar bill) {
    final isOverdue = bill.isOverdue;
    final isPaid = bill.status == BillStatus.paid;
    
    Color cardColor;
    Color statusColor;
    String statusText;

    if (isPaid) {
      cardColor = Colors.green.withOpacity(0.1);
      statusColor = Colors.green;
      statusText = 'Paid';
    } else if (isOverdue) {
      cardColor = Colors.red.withOpacity(0.1);
      statusColor = Colors.red;
      statusText = 'Overdue';
    } else {
      cardColor = Colors.blue.withOpacity(0.1);
      statusColor = Colors.blue;
      statusText = 'Pending';
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: statusColor.withOpacity(0.3)),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          bill.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              '\$${bill.amount.toStringAsFixed(2)}',
              style: TextStyle(
                color: statusColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (bill.notes != null && bill.notes!.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(
                bill.notes!,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ],
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: statusColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            statusText,
            style: TextStyle(
              color: statusColor,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        onTap: () {
          // Show bill details or actions
          _showBillActions(context, bill);
        },
      ),
    );
  }

  List<BillReminderIsar> _getBillsForDay(DateTime day, List<BillReminderIsar> bills) {
    return bills.where((bill) {
      return isSameDay(bill.dueDate, day) && !bill.isDeleted;
    }).toList();
  }

  void _showBillActions(BuildContext context, BillReminderIsar bill) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Bill Details'),
              onTap: () {
                Navigator.pop(context);
                _showBillDetails(context, bill);
              },
            ),
            if (bill.status == BillStatus.pending)
              ListTile(
                leading: const Icon(Icons.check, color: Colors.green),
                title: const Text('Mark as Paid'),
                onTap: () {
                  Navigator.pop(context);
                  context.read<BillReminderBloc>().add(MarkBillAsPaid(bill.billId));
                },
              ),
            ListTile(
              leading: const Icon(Icons.delete, color: Colors.red),
              title: const Text('Delete Bill'),
              onTap: () {
                Navigator.pop(context);
                _showDeleteConfirmation(context, bill);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showBillDetails(BuildContext context, BillReminderIsar bill) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(bill.title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Amount: \$${bill.amount.toStringAsFixed(2)}'),
            Text('Due Date: ${_formatDate(bill.dueDate)}'),
            Text('Status: ${bill.status.displayName}'),
            if (bill.isRecurring)
              Text('Frequency: ${bill.frequency.displayName}'),
            if (bill.notes != null && bill.notes!.isNotEmpty)
              Text('Notes: ${bill.notes}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, BillReminderIsar bill) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Bill'),
        content: Text('Are you sure you want to delete "${bill.title}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<BillReminderBloc>().add(DeleteBill(bill.billId));
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
