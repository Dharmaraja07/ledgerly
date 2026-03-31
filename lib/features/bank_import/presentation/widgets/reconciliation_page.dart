import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/service_locator.dart';
import '../../../expense/domain/entitities/Expense.dart' as exp;
import '../../../expense/domain/repositories/expense_repository.dart';
import '../../data/models/bank_transaction_isar.dart';
import '../../data/services/reconciliation_matcher.dart';
import '../bloc/bank_import_bloc.dart';

class ReconciliationPage extends StatelessWidget {
  const ReconciliationPage({
    super.key,
    required this.batch,
    this.groupId,
  });

  final ImportBatchIsar batch;
  /// When set, matching searches this group’s ledger entries.
  final String? groupId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<BankImportBloc>(context)
        ..add(LoadPendingTransactions(batch.batchId)),
      child: ReconciliationView(batch: batch, groupId: groupId),
    );
  }
}

class ReconciliationView extends StatefulWidget {
  const ReconciliationView({
    super.key,
    required this.batch,
    this.groupId,
  });

  final ImportBatchIsar batch;
  final String? groupId;

  @override
  State<ReconciliationView> createState() => _ReconciliationViewState();
}

class _ReconciliationViewState extends State<ReconciliationView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reconcile ${widget.batch.fileName}'),
        backgroundColor: Colors.blue.shade50,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<BankImportBloc>().add(
                LoadPendingTransactions(widget.batch.batchId),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _ProgressHeader(batch: widget.batch),
          _SearchBar(controller: _searchController),
          Expanded(
            child: BlocBuilder<BankImportBloc, BankImportState>(
              builder: (context, state) {
                if (state.status == BankImportStatus.loading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state.pendingTransactions.isEmpty) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check_circle, size: 64, color: Colors.green),
                        SizedBox(height: 16),
                        Text(
                          'All transactions reconciled!',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                final filteredTransactions = _filterTransactions(
                  state.pendingTransactions,
                  _searchController.text,
                );

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: filteredTransactions.length,
                  itemBuilder: (context, index) {
                    final transaction = filteredTransactions[index];
                    return TransactionCard(
                      transaction: transaction,
                      groupId: widget.groupId,
                      onReconcile: (expenseId, incomeId) {
                        context.read<BankImportBloc>().add(
                          ReconcileTransaction(
                            transaction.transactionId,
                            expenseId,
                            incomeId,
                            batchId: widget.batch.batchId,
                          ),
                        );
                      },
                      onIgnore: () {
                        context.read<BankImportBloc>().add(
                          IgnoreTransaction(
                            transaction.transactionId,
                            batchId: widget.batch.batchId,
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<BankTransactionIsar> _filterTransactions(
    List<BankTransactionIsar> transactions,
    String query,
  ) {
    if (query.isEmpty) return transactions;
    
    final lowerQuery = query.toLowerCase();
    return transactions.where((transaction) {
      return transaction.description.toLowerCase().contains(lowerQuery) ||
             transaction.merchantName?.toLowerCase().contains(lowerQuery) == true ||
             transaction.category?.toLowerCase().contains(lowerQuery) == true;
    }).toList();
  }
}

class _ProgressHeader extends StatelessWidget {
  const _ProgressHeader({
    required this.batch,
  });

  final ImportBatchIsar batch;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        border: Border(bottom: BorderSide(color: Colors.blue.shade200)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.analytics, color: Colors.blue.shade700),
              const SizedBox(width: 8),
              Text(
                'Reconciliation Progress',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue.shade700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _ProgressItem(
                  label: 'Total',
                  value: batch.totalTransactions.toString(),
                  color: Colors.blue,
                ),
              ),
              Expanded(
                child: _ProgressItem(
                  label: 'Reconciled',
                  value: batch.reconciledTransactions.toString(),
                  color: Colors.green,
                ),
              ),
              Expanded(
                child: _ProgressItem(
                  label: 'Pending',
                  value: batch.pendingTransactions.toString(),
                  color: Colors.orange,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          LinearProgressIndicator(
            value: batch.reconciliationProgress / 100,
            backgroundColor: Colors.grey.shade300,
            valueColor: AlwaysStoppedAnimation<Color>(
              batch.isFullyReconciled ? Colors.green : Colors.orange,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgressItem extends StatelessWidget {
  const _ProgressItem({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
          hintText: 'Search transactions...',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
    required this.transaction,
    required this.onReconcile,
    required this.onIgnore,
    this.groupId,
  });

  final BankTransactionIsar transaction;
  final Function(String? expenseId, String? incomeId) onReconcile;
  final VoidCallback onIgnore;
  final String? groupId;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  transaction.isCredit ? Icons.arrow_downward : Icons.arrow_upward,
                  color: transaction.isCredit ? Colors.green : Colors.red,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction.description,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      if (transaction.merchantName != null)
                        Text(
                          transaction.merchantName!,
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14,
                          ),
                        ),
                    ],
                  ),
                ),
                Text(
                  transaction.formattedAmount,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: transaction.isCredit ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 12),
            
            Row(
              children: [
                Icon(Icons.calendar_today, size: 16, color: Colors.grey.shade600),
                const SizedBox(width: 4),
                Text(
                  _formatDate(transaction.transactionDate),
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
                if (transaction.category != null) ...[
                  const SizedBox(width: 16),
                  Icon(Icons.label, size: 16, color: Colors.grey.shade600),
                  const SizedBox(width: 4),
                  Text(
                    transaction.category!,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                ],
              ],
            ),
            
            const SizedBox(height: 16),
            
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _showMatchDialog(context),
                    icon: const Icon(Icons.link),
                    label: const Text('Match'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: onIgnore,
                    icon: const Icon(Icons.block),
                    label: const Text('Ignore'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.red,
                      side: const BorderSide(color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showMatchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => MatchTransactionDialog(
        transaction: transaction,
        groupId: groupId,
        onMatch: onReconcile,
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}

class MatchTransactionDialog extends StatefulWidget {
  const MatchTransactionDialog({
    super.key,
    required this.transaction,
    required this.onMatch,
    this.groupId,
  });

  final BankTransactionIsar transaction;
  final Function(String? expenseId, String? incomeId) onMatch;
  final String? groupId;

  @override
  State<MatchTransactionDialog> createState() => _MatchTransactionDialogState();
}

class _MatchTransactionDialogState extends State<MatchTransactionDialog> {
  final _search = TextEditingController();
  List<exp.Expense> _ledger = const [];
  bool _loading = true;
  String? _loadError;

  @override
  void initState() {
    super.initState();
    _search.addListener(() => setState(() {}));
    _loadLedger();
  }

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  Future<void> _loadLedger() async {
    final gid = widget.groupId;
    if (gid == null || gid.isEmpty) {
      setState(() {
        _loading = false;
        _loadError =
            'Open Bank Import from the Ledger screen so a group is linked for matching.';
      });
      return;
    }
    try {
      final list = await getIt<ExpenseRepository>().getExpenses(gid);
      if (!mounted) return;
      setState(() {
        _ledger = list;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _loadError = '$e';
        _loading = false;
      });
    }
  }

  void _applyMatch(exp.Expense e) {
    if (e.transactionType == exp.TransactionType.income) {
      widget.onMatch(null, e.id);
    } else {
      widget.onMatch(e.id, null);
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final candidates = _loading || _loadError != null
        ? <ReconciliationCandidate>[]
        : ReconciliationMatcher.rank(
            widget.transaction,
            _ledger,
            searchQuery: _search.text,
          );

    return AlertDialog(
      title: const Text('Match transaction'),
      content: SizedBox(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.transaction.description,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                widget.transaction.formattedAmount,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: widget.transaction.isCredit ? Colors.green : Colors.red,
                ),
              ),
              const SizedBox(height: 12),
              if (_loading)
                const Padding(
                  padding: EdgeInsets.all(24),
                  child: Center(child: CircularProgressIndicator()),
                )
              else if (_loadError != null)
                Text(
                  _loadError!,
                  style: TextStyle(color: Colors.orange.shade800),
                )
              else ...[
                const Text(
                  'Suggested matches (amount · date · text):',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                if (candidates.isEmpty)
                  Text(
                    'No close matches. Try search, or add the entry under Records first.',
                    style: TextStyle(color: Colors.grey.shade700),
                  )
                else
                  ...candidates.map(
                    (c) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      title: Text(c.expense.title),
                      subtitle: Text(
                        '${c.expense.transactionType.name} · '
                        '${c.expense.amount.toStringAsFixed(2)} · ${c.reason}',
                        style: const TextStyle(fontSize: 11),
                      ),
                      trailing: Text(
                        c.score.toStringAsFixed(0),
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      onTap: () => _applyMatch(c.expense),
                    ),
                  ),
                const SizedBox(height: 12),
                TextField(
                  controller: _search,
                  decoration: const InputDecoration(
                    hintText: 'Search ledger by title or category…',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
