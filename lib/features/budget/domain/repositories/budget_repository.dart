import '../../domain/entities/budget.dart';

abstract class BudgetRepository {
  Future<void> setBudget(Budget budget);
  Future<List<Budget>> getBudgets(String groupId);
  Future<double> getSpentAmount(String groupId, String category, DateTime month);
}
