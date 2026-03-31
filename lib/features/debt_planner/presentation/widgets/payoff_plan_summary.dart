import 'package:flutter/material.dart';
import '../../data/repositories/debt_repository.dart';
import '../../../../core/theme/app_theme.dart';

class PayoffPlanSummary extends StatelessWidget {
  final DebtPayoffPlan plan;
  final bool showDetails;

  const PayoffPlanSummary({
    super.key,
    required this.plan,
    this.showDetails = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildMetricCard(
                'Debt Free Date',
                _formatDate(plan.payoffDate),
                Icons.calendar_today,
                Colors.green,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildMetricCard(
                'Time to Freedom',
                plan.payoffTimeframe,
                Icons.schedule,
                AppTheme.primaryColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildMetricCard(
                'Total Interest',
                '\$${plan.totalInterestPaid.toStringAsFixed(2)}',
                Icons.trending_up,
                Colors.red,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildMetricCard(
                'Monthly Payment',
                '\$${plan.monthlyPayment.toStringAsFixed(2)}',
                Icons.payment,
                Colors.orange,
              ),
            ),
          ],
        ),
        if (showDetails) ...[
          const SizedBox(height: 24),
          _buildDetailedBreakdown(),
        ],
      ],
    );
  }

  Widget _buildMetricCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 16),
              const SizedBox(width: 4),
              Text(
                title,
                style: TextStyle(
                  fontSize: 10,
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailedBreakdown() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Breakdown',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 12),
          _buildBreakdownRow(
            'Original Debt',
            '\$${plan.originalDebt.toStringAsFixed(2)}',
            Colors.black,
          ),
          _buildBreakdownRow(
            'Total Interest Paid',
            '\$${plan.totalInterestPaid.toStringAsFixed(2)}',
            Colors.red,
          ),
          const Divider(height: 24),
          _buildBreakdownRow(
            'Total Amount Paid',
            '\$${plan.totalPaid.toStringAsFixed(2)}',
            AppTheme.primaryColor,
            isBold: true,
          ),
          if (plan.payments.isNotEmpty) ...[
            const SizedBox(height: 16),
            Text(
              'First 6 Months Preview',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 8),
            ...plan.payments.take(6).map((payment) {
              return _buildMonthPreview(payment);
            }),
          ],
        ],
      ),
    );
  }

  Widget _buildBreakdownRow(
    String label,
    String value,
    Color color, {
    bool isBold = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: Colors.grey[700],
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMonthPreview(PayoffMonth payment) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Month ${payment.month}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Payment: \$${payment.totalPayment.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 10),
              ),
              Text(
                'Interest: \$${payment.interestPaid.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 10, color: Colors.red),
              ),
              Text(
                'Principal: \$${payment.principalPaid.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 10, color: Colors.green),
              ),
            ],
          ),
          if (payment.debtPayments.isNotEmpty) ...[
            const SizedBox(height: 4),
            ...payment.debtPayments.take(3).map((debtPayment) {
              return Padding(
                padding: const EdgeInsets.only(left: 8, top: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        debtPayment.debtName,
                        style: const TextStyle(fontSize: 9, color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '\$${debtPayment.paymentAmount.toStringAsFixed(0)}',
                      style: const TextStyle(fontSize: 9, color: Colors.grey),
                    ),
                  ],
                ),
              );
            }),
          ],
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
