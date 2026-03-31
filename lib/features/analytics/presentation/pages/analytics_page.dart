import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/theme/app_colors.dart';
import '../bloc/analytics_bloc.dart';
import '../bloc/analytics_event.dart';
import '../bloc/analytics_state.dart';
import '../widgets/spending_pie_chart.dart';

class AnalyticsPage extends StatelessWidget {
  final String groupId;

  const AnalyticsPage({super.key, required this.groupId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AnalyticsBloc>()..add(LoadAnalytics(groupId)),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          title: Text(
            'Insights',
            style: GoogleFonts.outfit(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: BlocBuilder<AnalyticsBloc, AnalyticsState>(
          builder: (context, state) {
            if (state is AnalyticsLoading) {
              return const Center(child: CircularProgressIndicator(color: AppColors.primary));
            }
            if (state is AnalyticsError) {
              return Center(
                child: Text(
                  state.message,
                  style: GoogleFonts.outfit(color: AppColors.error),
                ),
              );
            }
            if (state is! AnalyticsLoaded) {
              return const SizedBox.shrink();
            }

            final averageMonthly = state.monthlySpending.isEmpty
                ? 0.0
                : state.monthlySpending.values.fold<double>(0, (sum, value) => sum + value) /
                    state.monthlySpending.length;
            final topCategory = state.breakdown.isEmpty ? null : state.breakdown.first;
            final topThreeShare = state.breakdown
                .take(3)
                .fold<double>(0, (sum, item) => sum + item.percentage);

            return ListView(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
              children: [
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total tracked spending',
                        style: GoogleFonts.outfit(
                          color: Colors.black.withValues(alpha: 0.65),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '₹${state.totalSpent.toStringAsFixed(2)}',
                        style: GoogleFonts.outfit(
                          color: Colors.black,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        topCategory == null
                            ? 'Start adding expenses to unlock spending intelligence.'
                            : 'Top category: ${topCategory.categoryName}',
                        style: GoogleFonts.outfit(
                          color: Colors.black.withValues(alpha: 0.72),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                Row(
                  children: [
                    Expanded(
                      child: _AnalyticsMetricCard(
                        title: 'Monthly avg',
                        value: '₹${averageMonthly.toStringAsFixed(0)}',
                        color: AppColors.accent,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _AnalyticsMetricCard(
                        title: 'Top 3 share',
                        value: '${topThreeShare.toStringAsFixed(0)}%',
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  'Monthly Trend',
                  style: GoogleFonts.outfit(
                    color: AppColors.textPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                _MonthlyTrendCard(monthlySpending: state.monthlySpending),
                const SizedBox(height: 24),
                Text(
                  'Category Breakdown',
                  style: GoogleFonts.outfit(
                    color: AppColors.textPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                SpendingPieChart(
                  data: state.breakdown,
                  total: state.totalSpent,
                ),
                const SizedBox(height: 24),
                Text(
                  'Deep Dive',
                  style: GoogleFonts.outfit(
                    color: AppColors.textPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                if (state.breakdown.isEmpty)
                  const _AnalyticsEmptyCard(
                    title: 'No analytics yet',
                    description: 'Once you add transactions, Ledgerly will surface trend, concentration, and category insights here.',
                  )
                else
                  ...state.breakdown.take(5).map(
                    (item) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _CategoryDetailCard(item: item),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _AnalyticsMetricCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const _AnalyticsMetricCard({
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.outfit(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: GoogleFonts.outfit(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}

class _MonthlyTrendCard extends StatelessWidget {
  final Map<String, double> monthlySpending;

  const _MonthlyTrendCard({required this.monthlySpending});

  @override
  Widget build(BuildContext context) {
    final entries = monthlySpending.entries.toList()
      ..sort((a, b) => _sortKey(a.key).compareTo(_sortKey(b.key)));
    final visible = entries.length > 6 ? entries.sublist(entries.length - 6) : entries;

    if (visible.isEmpty) {
      return const _AnalyticsEmptyCard(
        title: 'No trend data yet',
        description: 'Monthly bars will appear here once you start logging transactions over time.',
      );
    }

    final maxValue = visible
        .map((entry) => entry.value)
        .fold<double>(0, (max, value) => value > max ? value : max);

    return Container(
      height: 260,
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(22),
      ),
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: maxValue == 0 ? 1 : maxValue * 1.2,
          borderData: FlBorderData(show: false),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: maxValue == 0 ? 1 : maxValue / 4,
            getDrawingHorizontalLine: (_) => FlLine(
              color: AppColors.surfaceHighlight,
              strokeWidth: 1,
            ),
          ),
          titlesData: FlTitlesData(
            leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  if (index < 0 || index >= visible.length) {
                    return const SizedBox.shrink();
                  }
                  final label = visible[index].key.split('/');
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      '${label.first}/${label.last.substring(2)}',
                      style: GoogleFonts.outfit(
                        color: AppColors.textSecondary,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          barGroups: [
            for (var index = 0; index < visible.length; index++)
              BarChartGroupData(
                x: index,
                barRods: [
                  BarChartRodData(
                    toY: visible[index].value,
                    width: 18,
                    borderRadius: BorderRadius.circular(8),
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFFE082), Color(0xFFFFCA28)],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  int _sortKey(String key) {
    final parts = key.split('/');
    final month = int.tryParse(parts.first) ?? 0;
    final year = int.tryParse(parts.last) ?? 0;
    return year * 100 + month;
  }
}

class _CategoryDetailCard extends StatelessWidget {
  final dynamic item;

  const _CategoryDetailCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 44,
            decoration: BoxDecoration(
              color: item.color,
              borderRadius: BorderRadius.circular(999),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.categoryName,
                  style: GoogleFonts.outfit(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${item.percentage.toStringAsFixed(1)}% of total spend',
                  style: GoogleFonts.outfit(color: AppColors.textSecondary),
                ),
              ],
            ),
          ),
          Text(
            '₹${item.totalAmount.toStringAsFixed(0)}',
            style: GoogleFonts.outfit(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _AnalyticsEmptyCard extends StatelessWidget {
  final String title;
  final String description;

  const _AnalyticsEmptyCard({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.surfaceHighlight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.outfit(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: GoogleFonts.outfit(
              color: AppColors.textSecondary,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
