import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../data/models/investment_isar.dart';

class PortfolioAllocationChart extends StatelessWidget {
  final Map<String, double> allocation;
  final List<InvestmentIsar> investments;

  const PortfolioAllocationChart({
    super.key,
    required this.allocation,
    required this.investments,
  });

  @override
  Widget build(BuildContext context) {
    if (allocation.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(32),
        child: const Center(
          child: Column(
            children: [
              Icon(Icons.pie_chart, size: 64, color: Colors.grey),
              SizedBox(height: 16),
              Text('No investments to display'),
            ],
          ),
        ),
      );
    }

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
            'Portfolio Allocation',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 200,
            child: PieChart(
              PieChartData(
                sectionsSpace: 2,
                centerSpaceRadius: 60,
                sections: allocation.entries.map((entry) {
                  final investment = investments
                      .where((inv) => inv.name == entry.key)
                      .firstOrNull;
                  final color = _getInvestmentTypeColor(investment?.type);
                  
                  return PieChartSectionData(
                    color: color,
                    value: entry.value,
                    title: '${entry.value.toStringAsFixed(1)}%',
                    radius: 50,
                    titleStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    titlePositionPercentageOffset: 0.6,
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(height: 20),
          _buildLegend(),
        ],
      ),
    );
  }

  Widget _buildLegend() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Holdings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: allocation.entries.map((entry) {
            final investment = investments
                .where((inv) => inv.name == entry.key)
                .firstOrNull;
            final color = _getInvestmentTypeColor(investment?.type);
            
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: color.withOpacity(0.3)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          entry.key.length > 20 
                              ? '${entry.key.substring(0, 20)}...'
                              : entry.key,
                          style: TextStyle(
                            fontSize: 12,
                            color: color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (investment != null)
                          Text(
                            investment.symbol,
                            style: TextStyle(
                              fontSize: 10,
                              color: color.withOpacity(0.8),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${entry.value.toStringAsFixed(1)}%',
                    style: TextStyle(
                      fontSize: 12,
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Color _getInvestmentTypeColor(InvestmentType? type) {
    switch (type) {
      case InvestmentType.stock:
        return Colors.blue;
      case InvestmentType.bond:
        return Colors.green;
      case InvestmentType.etf:
        return Colors.purple;
      case InvestmentType.mutualFund:
        return Colors.orange;
      case InvestmentType.reit:
        return Colors.teal;
      case InvestmentType.crypto:
        return Colors.amber;
      case InvestmentType.commodity:
        return Colors.brown;
      case InvestmentType.option:
        return Colors.red;
      case InvestmentType.other:
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }
}
