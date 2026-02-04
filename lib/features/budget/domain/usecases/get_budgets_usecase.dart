import '../../domain/entities/budget.dart';
import '../../domain/repositories/budget_repository.dart';

class BudgetWithProgress {
  final Budget budget;
  final double spent;

  double get percentage => (spent / budget.limit).clamp(0.0, 1.0);
  bool get isOverBudget => spent > budget.limit;

  BudgetWithProgress(this.budget, this.spent);
}

class GetBudgetsUseCase {
  final BudgetRepository repository;

  GetBudgetsUseCase(this.repository);

  Future<List<BudgetWithProgress>> call(String groupId) async {
    final budgets = await repository.getBudgets(groupId);
    final now = DateTime.now();
    final currentMonth = DateTime.utc(now.year, now.month, 1);
    
    // Filter for current month's budgets or handle multiple months
    // For MVP, let's assume budgets are set for "current valid period" or recursive
    // Simplification: We only show budgets that match current Month or are "Monthly"
    // For this implementation, we assume budget.month matches current month.
    
    final currentBudgets = budgets.where((b) => 
      b.month.year == currentMonth.year && b.month.month == currentMonth.month
    ).toList();

    List<BudgetWithProgress> result = [];
    for (var b in currentBudgets) {
      final spent = await repository.getSpentAmount(groupId, b.category, currentMonth);
      result.add(BudgetWithProgress(b, spent));
    }
    return result;
  }
}
