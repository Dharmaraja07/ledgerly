import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/category_total.dart';

class SpendingPieChart extends StatelessWidget {
  final List<CategoryTotal> data;
  final double total;

  const SpendingPieChart({
    super.key,
    required this.data,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return const SizedBox(
        height: 200,
        child: Center(child: Text('No data available', style: TextStyle(color: Colors.white54))),
      );
    }

    return Column(
      children: [
        SizedBox(
          height: 250,
          child: PieChart(
            PieChartData(
              pieTouchData: PieTouchData(
                touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  // TODO: Handle touch to show details
                },
              ),
              borderData: FlBorderData(show: false),
              sectionsSpace: 2,
              centerSpaceRadius: 50,
              sections: data.map((item) {
                return PieChartSectionData(
                  color: item.color,
                  value: item.totalAmount,
                  title: '${item.percentage.toStringAsFixed(0)}%',
                  radius: 60,
                  titleStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [Shadow(color: Colors.black, blurRadius: 2)],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        const SizedBox(height: 24),
        // Legend
        Wrap(
          spacing: 16,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: data.map((item) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: item.color,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  item.categoryName,
                  style: GoogleFonts.outfit(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
