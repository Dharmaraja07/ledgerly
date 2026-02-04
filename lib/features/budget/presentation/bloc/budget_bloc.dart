import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import '../../domain/entities/budget.dart';
import '../../domain/repositories/budget_repository.dart';
import '../../domain/usecases/get_budgets_usecase.dart';
import 'budget_event.dart';
import 'budget_state.dart';

class BudgetBloc extends Bloc<BudgetEvent, BudgetState> {
  final BudgetRepository repository;
  final GetBudgetsUseCase getBudgets;

  BudgetBloc(this.repository, this.getBudgets) : super(BudgetInitial()) {
    on<LoadBudgets>(_onLoadBudgets);
    on<CreateBudget>(_onCreateBudget);
  }

  Future<void> _onLoadBudgets(LoadBudgets event, Emitter<BudgetState> emit) async {
    emit(BudgetLoading());
    try {
      final budgets = await getBudgets(event.groupId);
      emit(BudgetLoaded(budgets));
    } catch (e) {
      emit(BudgetError('Failed to load budgets'));
    }
  }

  Future<void> _onCreateBudget(CreateBudget event, Emitter<BudgetState> emit) async {
    try {
      final now = DateTime.now();
      final monthStart = DateTime.utc(now.year, now.month, 1);
      
      final budget = Budget(
        id: const Uuid().v4(),
        groupId: event.groupId,
        category: event.category,
        limit: event.limit,
        month: monthStart,
      );

      await repository.setBudget(budget);
      add(LoadBudgets(event.groupId));
    } catch (e) {
      emit(BudgetError('Failed to create budget'));
    }
  }
}
