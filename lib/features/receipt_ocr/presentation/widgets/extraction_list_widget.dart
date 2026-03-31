import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/receipt_extraction_isar.dart';
import '../bloc/receipt_ocr_bloc.dart';
import 'extraction_card_widget.dart';
import 'extraction_detail_widget.dart';

class ExtractionListWidget extends StatelessWidget {
  const ExtractionListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReceiptOcrBloc, ReceiptOcrState>(
      builder: (context, state) {
        if (state.status == ReceiptOcrStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.recentExtractions.isEmpty) {
          return const EmptyStateWidget();
        }

        return RefreshIndicator(
          onRefresh: () async {
            context.read<ReceiptOcrBloc>().add(const LoadRecentExtractions());
          },
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemCount: state.recentExtractions.length,
            itemBuilder: (context, index) {
              final extraction = state.recentExtractions[index];
              return ExtractionCard(
                extraction: extraction,
                onTap: () {
                  context.read<ReceiptOcrBloc>().add(SelectExtraction(extraction));
                  _showExtractionDetails(context, extraction);
                },
                onEdit: () {
                  _showEditDialog(context, extraction);
                },
                onDelete: () {
                  _showDeleteConfirmation(context, extraction);
                },
                onRetry: () {
                  if (extraction.hasErrors) {
                    context.read<ReceiptOcrBloc>().add(RetryExtraction(extraction.extractionId));
                  }
                },
              );
            },
          ),
        );
      },
    );
  }

  void _showExtractionDetails(BuildContext context, ReceiptExtractionIsar extraction) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) {
          return ExtractionDetailWidget(
            extraction: extraction,
            scrollController: scrollController,
          );
        },
      ),
    );
  }

  void _showEditDialog(BuildContext context, ReceiptExtractionIsar extraction) {
    showDialog(
      context: context,
      builder: (context) => EditExtractionDialog(extraction: extraction),
    );
  }

  void _showDeleteConfirmation(BuildContext context, ReceiptExtractionIsar extraction) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete Receipt'),
        content: Text(
          'Are you sure you want to delete the receipt from ${extraction.merchantName ?? 'Unknown Merchant'}?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              context.read<ReceiptOcrBloc>().add(DeleteExtraction(extraction.extractionId));
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.receipt_long,
            size: 80,
            color: Colors.grey.withOpacity(0.5),
          ),
          const SizedBox(height: 24),
          const Text(
            'No receipts yet',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Capture your first receipt to get started',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: () {
              // Switch to capture tab
              DefaultTabController.of(context).animateTo(0);
            },
            icon: const Icon(Icons.camera_alt),
            label: const Text('Capture Receipt'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}

class EditExtractionDialog extends StatefulWidget {
  const EditExtractionDialog({super.key, required this.extraction});

  final ReceiptExtractionIsar extraction;

  @override
  State<EditExtractionDialog> createState() => _EditExtractionDialogState();
}

class _EditExtractionDialogState extends State<EditExtractionDialog> {
  late TextEditingController _merchantController;
  late TextEditingController _amountController;
  late TextEditingController _categoryController;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _merchantController = TextEditingController(text: widget.extraction.merchantName ?? '');
    _amountController = TextEditingController(
      text: widget.extraction.totalAmount?.toStringAsFixed(2) ?? '',
    );
    _categoryController = TextEditingController(text: widget.extraction.category ?? '');
    _selectedDate = widget.extraction.purchaseDate ?? DateTime.now();
  }

  @override
  void dispose() {
    _merchantController.dispose();
    _amountController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Receipt Details'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _merchantController,
              decoration: const InputDecoration(
                labelText: 'Merchant Name',
                prefixIcon: Icon(Icons.store),
              ),
            ),
            const SizedBox(height: 16),
            
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(
                labelText: 'Total Amount',
                prefixIcon: Icon(Icons.attach_money),
                prefixText: '\$',
              ),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 16),
            
            TextField(
              controller: _categoryController,
              decoration: const InputDecoration(
                labelText: 'Category',
                prefixIcon: Icon(Icons.category),
              ),
            ),
            const SizedBox(height: 16),
            
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Purchase Date'),
              subtitle: Text('${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}'),
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: _selectedDate,
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now(),
                );
                if (date != null) {
                  setState(() {
                    _selectedDate = date;
                  });
                }
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final updatedExtraction = widget.extraction;
            updatedExtraction.merchantName = _merchantController.text;
            updatedExtraction.totalAmount = double.tryParse(_amountController.text);
            updatedExtraction.category = _categoryController.text;
            updatedExtraction.purchaseDate = _selectedDate;
            
            context.read<ReceiptOcrBloc>().add(UpdateExtraction(updatedExtraction));
            Navigator.of(context).pop();
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
