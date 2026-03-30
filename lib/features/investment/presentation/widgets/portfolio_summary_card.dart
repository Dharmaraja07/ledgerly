import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class PortfolioSummaryCard extends StatelessWidget {
  final double totalValue;
  final double totalCost;
  final double totalGainLoss;
  final double totalGainLossPercentage;
  final int investmentCount;
  final int profitableCount;
  final int losingCount;

  const PortfolioSummaryCard({
    super.key,
    required this.totalValue,
    required this.totalCost,
    required this.totalGainLoss,
    required this.totalGainLossPercentage,
    required this.investmentCount,
    required this.profitableCount,
    required this.losingCount,
  });

  @override
  Widget build(BuildContext context) {
    final isProfitable = totalGainLoss >= 0;
    final gainLossColor = isProfitable ? Colors.green : Colors.red;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.primaryColor.withOpacity(0.1),
            AppTheme.primaryColor.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.primaryColor.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.account_balance,
                color: AppTheme.primaryColor,
                size: 28,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Portfolio Summary',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppTheme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Value',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '\$${totalValue.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Total Gain/Loss',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          isProfitable ? Icons.trending_up : Icons.trending_down,
                          color: gainLossColor,
                          size: 20,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${isProfitable ? '+' : ''}\$${totalGainLoss.abs().toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: gainLossColor,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${isProfitable ? '+' : ''}${totalGainLossPercentage.toStringAsFixed(1)}%',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: gainLossColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(color: Colors.grey),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildStatItem(
                  'Total Investments',
                  investmentCount.toString(),
                  Icons.pie_chart,
                  Colors.blue,
                ),
              ),
              Expanded(
                child: _buildStatItem(
                  'Profitable',
                  profitableCount.toString(),
                  Icons.trending_up,
                  Colors.green,
                ),
              ),
              Expanded(
                child: _buildStatItem(
                  'Losing',
                  losingCount.toString(),
                  Icons.trending_down,
                  Colors.red,
                ),
              ),
            ],
          ),
          if (totalCost > 0) ...[
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Cost',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    '\$${totalCost.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildStatItem(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Column(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(height: 4),
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
            color: Colors.grey[600],
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
