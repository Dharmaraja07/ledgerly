abstract class BudgetEvent {}

class LoadBudgets extends BudgetEvent {
  final String groupId;
  LoadBudgets(this.groupId);
}

class CreateBudget extends BudgetEvent {
  final String groupId;
  final String category;
  final double limit;
  CreateBudget({required this.groupId, required this.category, required this.limit});
}
