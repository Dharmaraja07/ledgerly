import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/category_total.dart';

class SpendingPieChart extends StatefulWidget {
  final List<CategoryTotal> data;
  final double total;

  const SpendingPieChart({
    super.key,
    required this.data,
    required this.total,
  });

  @override
  State<SpendingPieChart> createState() => _SpendingPieChartState();
}

class _SpendingPieChartState extends State<SpendingPieChart> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    if (widget.data.isEmpty) {
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
                  setState(() {
                    if (!event.isInterestedForInteractions ||
                        pieTouchResponse == null ||
                        pieTouchResponse.touchedSection == null) {
                      touchedIndex = -1;
                      return;
                    }
                    touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                  });
                },
              ),
              borderData: FlBorderData(show: false),
              sectionsSpace: 2,
              centerSpaceRadius: 50,
              sections: widget.data.asMap().entries.map((entry) {
                final index = entry.key;
                final item = entry.value;
                final isTouched = index == touchedIndex;
                final radius = isTouched ? 70.0 : 60.0;
                final fontSize = isTouched ? 18.0 : 14.0;
                final fontWeight = isTouched ? FontWeight.bold : FontWeight.normal;

                return PieChartSectionData(
                  color: item.color,
                  value: item.totalAmount,
                  title: '${item.percentage.toStringAsFixed(0)}%',
                  radius: radius,
                  titleStyle: TextStyle(
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                    color: Colors.white,
                    shadows: const [Shadow(color: Colors.black, blurRadius: 2)],
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
          children: widget.data.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            final isTouched = index == touchedIndex;

            return AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: touchedIndex == -1 || isTouched ? 1.0 : 0.3,
              child: Row(
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
                      color: isTouched ? AppColors.primary : AppColors.textSecondary,
                      fontSize: 14,
                      fontWeight: isTouched ? FontWeight.bold : FontWeight.normal,
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
}
