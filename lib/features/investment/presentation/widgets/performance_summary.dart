import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../data/models/investment_isar.dart';

class PerformanceSummary extends StatelessWidget {
  final List<InvestmentIsar> topPerformers;
  final List<InvestmentIsar> worstPerformers;

  const PerformanceSummary({
    super.key,
    required this.topPerformers,
    required this.worstPerformers,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (topPerformers.isNotEmpty) ...[
          _buildPerformersSection(
            context,
            'Top Performers',
            topPerformers,
            Colors.green,
            Icons.trending_up,
          ),
          const SizedBox(height: 24),
        ],
        if (worstPerformers.isNotEmpty) ...[
          _buildPerformersSection(
            context,
            'Worst Performers',
            worstPerformers,
            Colors.red,
            Icons.trending_down,
          ),
        ],
        if (topPerformers.isEmpty && worstPerformers.isEmpty) ...[
          Container(
            padding: const EdgeInsets.all(32),
            child: const Center(
              child: Column(
                children: [
                  Icon(Icons.show_chart, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('No performance data available'),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildPerformersSection(
    BuildContext context,
    String title,
    List<InvestmentIsar> performers,
    Color color,
    IconData icon,
  ) {
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
          Row(
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(width: 8),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...performers.asMap().entries.map((entry) {
            final index = entry.key;
            final investment = entry.value;
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: _buildPerformerCard(investment, color, index + 1),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildPerformerCard(InvestmentIsar investment, Color color, int rank) {
    final isProfitable = investment.isProfitable;
    final gainLossColor = isProfitable ? Colors.green : Colors.red;
    final gainLossIcon = isProfitable ? Icons.trending_up : Icons.trending_down;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '$rank',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  investment.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  investment.symbol,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Icon(
                    gainLossIcon,
                    size: 16,
                    color: gainLossColor,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${isProfitable ? '+' : ''}${investment.unrealizedGainLossPercentage.toStringAsFixed(1)}%',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: gainLossColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                '\$${investment.unrealizedGainLoss.abs().toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 12,
                  color: gainLossColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
