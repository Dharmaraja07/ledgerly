
import '../../domain/usecases/get_budgets_usecase.dart';

abstract class BudgetState {}

class BudgetInitial extends BudgetState {}
class BudgetLoading extends BudgetState {}
class BudgetLoaded extends BudgetState {
  final List<BudgetWithProgress> budgets;
  BudgetLoaded(this.budgets);
}
class BudgetError extends BudgetState {
  final String message;
  BudgetError(this.message);
}
