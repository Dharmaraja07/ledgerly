import 'package:isar/isar.dart';
import '../../domain/entities/budget.dart';
import '../../domain/repositories/budget_repository.dart';
import '../models/budget_isar.dart';
import '../../../expense/data/models/expense_isar.dart';

class BudgetRepositoryImpl implements BudgetRepository {
  final Isar isar;

  BudgetRepositoryImpl(this.isar);

  @override
  Future<void> setBudget(Budget budget) async {
    final model = BudgetIsar()
      ..budgetId = budget.id
      ..groupId = budget.groupId
      ..category = budget.category
      ..limit = budget.limit
      ..month = budget.month;

    await isar.writeTxn(() async {
      // Check for existing budget for this Group + Category + Month
      final existing = await isar.budgetIsars
          .filter()
          .groupIdEqualTo(budget.groupId)
          .categoryEqualTo(budget.category)
          .monthEqualTo(budget.month)
          .findFirst();

      if (existing != null) {
        // Update existing
        existing.limit = budget.limit;
        await isar.budgetIsars.put(existing);
      } else {
        // Create new
        await isar.budgetIsars.put(model);
      }
    });
  }

  @override
  Future<List<Budget>> getBudgets(String groupId) async {
    final models = await isar.budgetIsars
        .filter()
        .groupIdEqualTo(groupId)
        .findAll();

    return models.map((e) => Budget(
      id: e.budgetId,
      groupId: e.groupId,
      category: e.category,
      limit: e.limit,
      month: e.month,
    )).toList();
  }

  @override
  Future<double> getSpentAmount(String groupId, String category, DateTime month) async {
    final startOfMonth = DateTime.utc(month.year, month.month, 1);
    final nextMonth = DateTime.utc(month.year, month.month + 1, 1);

    final expenses = await isar.expenseIsars
        .filter()
        .groupIdEqualTo(groupId)
        .categoryEqualTo(category)
        .updatedAtBetween(startOfMonth, nextMonth)
        .findAll();

  return expenses
    .where((e) => !e.isDeleted)
    .fold<double>(0.0, (sum, e) => sum + e.amount);

  }
}
