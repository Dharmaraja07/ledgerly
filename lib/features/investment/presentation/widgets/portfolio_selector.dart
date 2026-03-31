import 'package:flutter/material.dart';
import '../../data/models/investment_isar.dart';
import '../../../../core/theme/app_theme.dart';

class PortfolioSelector extends StatelessWidget {
  final List<InvestmentPortfolioIsar> portfolios;
  final String? selectedPortfolioId;
  final Function(String) onPortfolioSelected;
  final VoidCallback onAddPortfolio;

  const PortfolioSelector({
    super.key,
    required this.portfolios,
    required this.selectedPortfolioId,
    required this.onPortfolioSelected,
    required this.onAddPortfolio,
  });

  @override
  Widget build(BuildContext context) {
    if (portfolios.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const Icon(Icons.folder_open, color: Colors.grey),
            const SizedBox(width: 12),
            const Expanded(
              child: Text(
                'No portfolios created yet',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            TextButton(
              onPressed: onAddPortfolio,
              child: const Text('Create Portfolio'),
            ),
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: portfolios.map((portfolio) {
                  final isSelected = portfolio.portfolioId == selectedPortfolioId;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: InkWell(
                      onTap: () => onPortfolioSelected(portfolio.portfolioId),
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: isSelected ? AppTheme.primaryColor : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: isSelected ? AppTheme.primaryColor : Colors.grey[300]!,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              portfolio.name,
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '\$${portfolio.totalValue.toStringAsFixed(0)}',
                              style: TextStyle(
                                color: isSelected ? Colors.white70 : Colors.grey[600],
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          IconButton(
            onPressed: onAddPortfolio,
            icon: const Icon(Icons.add),
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: AppTheme.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
