import '../../domain/entities/category_total.dart';

abstract class AnalyticsState {}

class AnalyticsInitial extends AnalyticsState {}
class AnalyticsLoading extends AnalyticsState {}
class AnalyticsLoaded extends AnalyticsState {
  final List<CategoryTotal> breakdown;
  final double totalSpent;
  final Map<String, double> monthlySpending;

  AnalyticsLoaded(this.breakdown, this.totalSpent, this.monthlySpending);
}
class AnalyticsError extends AnalyticsState {
  final String message;
  AnalyticsError(this.message);
}
