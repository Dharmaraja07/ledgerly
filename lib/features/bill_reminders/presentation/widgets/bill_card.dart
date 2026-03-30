import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/bill_reminder_isar.dart';
import '../bloc/bill_reminder_bloc.dart';

class BillCard extends StatelessWidget {
  final BillReminderIsar bill;

  const BillCard({
    super.key,
    required this.bill,
  });

  @override
  Widget build(BuildContext context) {
    final isOverdue = bill.isOverdue;
    final isDueSoon = bill.isDueSoon;
    final daysUntilDue = bill.daysUntilDue;

    Color statusColor;
    String statusText;

    if (bill.status == BillStatus.paid) {
      statusColor = Colors.green;
      statusText = 'Paid';
    } else if (isOverdue) {
      statusColor = Colors.red;
      statusText = 'Overdue';
    } else if (isDueSoon) {
      statusColor = Colors.orange;
      statusText = 'Due Soon';
    } else {
      statusColor = Colors.blue;
      statusText = 'Pending';
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: statusColor.withOpacity(0.3)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
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
                  const Spacer(),
                  PopupMenuButton<String>(
                    icon: Icon(Icons.more_vert, color: statusColor),
                    onSelected: (value) {
                      switch (value) {
                        case 'mark_paid':
                          context.read<BillReminderBloc>().add(MarkBillAsPaid(bill.billId));
                          break;
                        case 'mark_overdue':
                          context.read<BillReminderBloc>().add(MarkBillAsOverdue(bill.billId));
                          break;
                        case 'delete':
                          _showDeleteConfirmation(context);
                          break;
                      }
                    },
                    itemBuilder: (context) => [
                      if (bill.status == BillStatus.pending)
                        const PopupMenuItem(
                          value: 'mark_paid',
                          child: Row(
                            children: [
                              Icon(Icons.check, color: Colors.green),
                              SizedBox(width: 8),
                              Text('Mark as Paid'),
                            ],
                          ),
                        ),
                      if (bill.status == BillStatus.pending && bill.isOverdue)
                        const PopupMenuItem(
                          value: 'mark_overdue',
                          child: Row(
                            children: [
                              Icon(Icons.warning, color: Colors.red),
                              SizedBox(width: 8),
                              Text('Mark as Overdue'),
                            ],
                          ),
                        ),
                      const PopupMenuItem(
                        value: 'delete',
                        child: Row(
                          children: [
                            Icon(Icons.delete, color: Colors.red),
                            SizedBox(width: 8),
                            Text('Delete'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      bill.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Text(
                    '\$${bill.amount.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: statusColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 16,
                    color: statusColor,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Due: ${_formatDate(bill.dueDate)}',
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (bill.status == BillStatus.pending) ...[
                    const Spacer(),
                    Text(
                      _getDaysText(daysUntilDue),
                      style: TextStyle(
                        color: statusColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ],
              ),
              if (bill.isRecurring) ...[
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.repeat,
                      size: 16,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Recurring: ${bill.frequency.displayName}',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
              if (bill.notes != null && bill.notes!.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(
                  bill.notes!,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  String _getDaysText(int days) {
    if (days < 0) {
      return '${(-days)} days overdue';
    } else if (days == 0) {
      return 'Due today';
    } else if (days == 1) {
      return 'Due tomorrow';
    } else {
      return 'Due in $days days';
    }
  }

  void _showDeleteConfirmation(BuildContext context) {
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
}
