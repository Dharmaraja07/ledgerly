import 'package:flutter/material.dart';
import '../../data/models/debt_isar.dart';
import '../../../../core/theme/app_theme.dart';

class PayoffStrategySelector extends StatelessWidget {
  final DebtPayoffStrategy selectedStrategy;
  final Function(DebtPayoffStrategy) onStrategyChanged;

  const PayoffStrategySelector({
    super.key,
    required this.selectedStrategy,
    required this.onStrategyChanged,
  });

  @override
  Widget build(BuildContext context) {
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
            'Choose Your Strategy',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          ...DebtPayoffStrategy.values.map((strategy) {
            final isSelected = selectedStrategy == strategy;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: InkWell(
                onTap: () => onStrategyChanged(strategy),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isSelected ? AppTheme.primaryColor.withOpacity(0.1) : Colors.grey[50],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected ? AppTheme.primaryColor : Colors.grey[300]!,
                      width: isSelected ? 2 : 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        isSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                        color: isSelected ? AppTheme.primaryColor : Colors.grey[600],
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              strategy.displayName,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: isSelected ? AppTheme.primaryColor : Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              strategy.description,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
