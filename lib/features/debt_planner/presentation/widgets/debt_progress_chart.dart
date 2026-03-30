import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../data/models/debt_isar.dart';

class DebtProgressChart extends StatelessWidget {
  final List<DebtIsar> debts;

  const DebtProgressChart({
    super.key,
    required this.debts,
  });

  @override
  Widget build(BuildContext context) {
    if (debts.isEmpty) {
      return const Center(
        child: Text('No debts to display'),
      );
    }

    return Column(
      children: [
        _buildPieChart(),
        const SizedBox(height: 20),
        _buildLegend(),
      ],
    );
  }

  Widget _buildPieChart() {
    final totalDebt = debts.fold(0.0, (sum, debt) => sum + debt.currentBalance);
    
    return SizedBox(
      height: 150,
      child: PieChart(
        PieChartData(
          sectionsSpace: 2,
          centerSpaceRadius: 60,
          sections: debts.asMap().entries.map((entry) {
            final debt = entry.value;
            final percentage = totalDebt > 0 ? (debt.currentBalance / totalDebt) : 0.0;
            final color = _getColorForDebtType(debt.type);
            
            return PieChartSectionData(
              color: color,
              value: debt.currentBalance,
              title: '${(percentage * 100).toStringAsFixed(1)}%',
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
    );
  }

  Widget _buildLegend() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Debt Breakdown',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: debts.map((debt) {
            final color = _getColorForDebtType(debt.type);
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
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
                  const SizedBox(width: 4),
                  Text(
                    debt.title.length > 15 
                        ? '${debt.title.substring(0, 15)}...'
                        : debt.title,
                    style: TextStyle(
                      fontSize: 10,
                      color: color,
                      fontWeight: FontWeight.w500,
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

  Color _getColorForDebtType(DebtType type) {
    switch (type) {
      case DebtType.creditCard:
        return Colors.blue;
      case DebtType.studentLoan:
        return Colors.purple;
      case DebtType.mortgage:
        return Colors.green;
      case DebtType.autoLoan:
        return Colors.orange;
      case DebtType.personalLoan:
        return Colors.red;
      case DebtType.medical:
        return Colors.pink;
      case DebtType.other:
        return Colors.grey;
    }
  }
}
