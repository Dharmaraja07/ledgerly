import '../entities/category_total.dart';

abstract class AnalyticsRepository {
  Future<List<CategoryTotal>> getCategoryBreakdown(String groupId);
  Future<Map<String, double>> getMonthlySpending(String groupId);
}
