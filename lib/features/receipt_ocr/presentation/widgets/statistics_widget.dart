import 'package:flutter/material.dart';

import '../bloc/receipt_ocr_bloc.dart';

class StatisticsWidget extends StatelessWidget {
  const StatisticsWidget({
    super.key,
    required this.state,
  });

  final ReceiptOcrState state;

  @override
  Widget build(BuildContext context) {
    final stats = state.statistics;
    final cards = <_StatItem>[
      _StatItem('Total', '${stats['total'] ?? 0}', Colors.blue),
      _StatItem('Completed', '${stats['completed'] ?? 0}', Colors.green),
      _StatItem('Failed', '${stats['failed'] ?? 0}', Colors.red),
      _StatItem('Review', '${stats['needsReview'] ?? 0}', Colors.orange),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: cards
              .map(
                (item) => SizedBox(
                  width: 160,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.label,
                            style: TextStyle(
                              color: item.color,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item.value,
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 20),
        Text(
          'Popular merchants',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12),
        if (state.popularMerchants.isEmpty)
          const Text('No merchant trends yet.')
        else
          ...state.popularMerchants.map(
            (merchant) => ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.storefront_outlined),
              title: Text(merchant),
            ),
          ),
      ],
    );
  }
}

class _StatItem {
  const _StatItem(this.label, this.value, this.color);

  final String label;
  final String value;
  final Color color;
}
