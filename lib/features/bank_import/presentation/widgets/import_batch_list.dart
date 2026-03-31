import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/bank_transaction_isar.dart';
import '../bloc/bank_import_bloc.dart';
import '../widgets/reconciliation_page.dart';

class ImportBatchList extends StatelessWidget {
  const ImportBatchList({super.key, this.groupId});

  final String? groupId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BankImportBloc, BankImportState>(
      builder: (context, state) {
        if (state.status == BankImportStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.importBatches.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.receipt_long, size: 64, color: Colors.grey),
                SizedBox(height: 16),
                Text(
                  'No imported statements yet',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                SizedBox(height: 8),
                Text(
                  'Import your first bank statement to get started',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            context.read<BankImportBloc>().add(const LoadImportBatches());
          },
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: state.importBatches.length,
            itemBuilder: (context, index) {
              final batch = state.importBatches[index];
              return ImportBatchCard(
                batch: batch,
                onTap: () => _navigateToReconciliation(context, batch, groupId),
              );
            },
          ),
        );
      },
    );
  }

  void _navigateToReconciliation(
    BuildContext context,
    ImportBatchIsar batch,
    String? groupId,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ReconciliationPage(batch: batch, groupId: groupId),
      ),
    );
  }
}

class ImportBatchCard extends StatelessWidget {
  const ImportBatchCard({
    super.key,
    required this.batch,
    required this.onTap,
  });

  final ImportBatchIsar batch;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.description,
                    color: batch.isFullyReconciled ? Colors.green : Colors.orange,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          batch.fileName,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Imported on ${_formatDate(batch.importDate)}',
                          style: TextStyle(
                            color: Colors.grey.withValues(alpha: 0.6),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (batch.isFullyReconciled)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Complete',
                        style: TextStyle(
                          color: Colors.green.withValues(alpha: 0.8),
                          fontSize: 12,
                        ),
                      ),
                    ),
                ],
              ),
              
              const SizedBox(height: 16),
              
              Row(
                children: [
                  Expanded(
                    child: _StatCard(
                      label: 'Total',
                      value: batch.totalTransactions.toString(),
                      icon: Icons.receipt_long,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _StatCard(
                      label: 'Reconciled',
                      value: batch.reconciledTransactions.toString(),
                      icon: Icons.check_circle,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _StatCard(
                      label: 'Pending',
                      value: batch.pendingTransactions.toString(),
                      icon: Icons.pending,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 12),
              
              LinearProgressIndicator(
                value: batch.reconciliationProgress / 100,
                backgroundColor: Colors.blue.withValues(alpha: 0.1),
                valueColor: AlwaysStoppedAnimation<Color>(
                  batch.isFullyReconciled ? Colors.green : Colors.orange,
                ),
              ),
              
              const SizedBox(height: 8),
              
              Text(
                '${batch.reconciliationProgress.toStringAsFixed(1)}% reconciled',
                style: TextStyle(
                  color: Colors.grey.withValues(alpha: 0.6),
                  fontSize: 12,
                ),
              ),
              
              if (batch.startDate != null && batch.endDate != null) ...[
                const SizedBox(height: 8),
                Text(
                  'Period: ${_formatDate(batch.startDate!)} - ${_formatDate(batch.endDate!)}',
                  style: TextStyle(
                    color: Colors.grey.withValues(alpha: 0.6),
                    fontSize: 12,
                  ),
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
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  final String label;
  final String value;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color.withValues(alpha: 0.8),
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: color.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }
}
