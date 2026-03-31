import 'package:flutter/material.dart';

import '../../data/models/receipt_extraction_isar.dart';

class ExtractionDetailWidget extends StatelessWidget {
  const ExtractionDetailWidget({
    super.key,
    required this.extraction,
    required this.scrollController,
  });

  final ReceiptExtractionIsar extraction;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      padding: const EdgeInsets.all(20),
      children: [
        Text(
          extraction.merchantName ?? 'Unknown Merchant',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          extraction.status.displayName,
          style: TextStyle(
            color: extraction.status.color,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        _DetailRow(label: 'Amount', value: extraction.totalAmount?.toStringAsFixed(2) ?? 'N/A'),
        _DetailRow(label: 'Category', value: extraction.category ?? 'Uncategorized'),
        _DetailRow(
          label: 'Purchase Date',
          value: extraction.purchaseDate?.toIso8601String().split('T').first ?? 'Unknown',
        ),
        _DetailRow(label: 'Payment', value: extraction.paymentMethod ?? 'Unknown'),
        _DetailRow(label: 'Receipt No.', value: extraction.receiptNumber ?? 'N/A'),
        if (extraction.items.isNotEmpty) ...[
          const SizedBox(height: 20),
          Text(
            'Items',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 12),
          ...extraction.items.map(
            (item) => ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(item.itemName ?? 'Unnamed item'),
              subtitle: Text(item.category ?? 'General'),
              trailing: Text(item.totalPrice?.toStringAsFixed(2) ?? 'N/A'),
            ),
          ),
        ],
        if ((extraction.rawText ?? '').isNotEmpty) ...[
          const SizedBox(height: 20),
          Text(
            'Raw OCR Text',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(extraction.rawText!),
        ],
      ],
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
