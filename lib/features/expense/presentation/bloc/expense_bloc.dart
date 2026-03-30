import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entitities/Expense.dart';
import '../../domain/repositories/expense_repository.dart';
import '../../../budget/domain/repositories/budget_repository.dart';
import '../../../budget/domain/entities/budget.dart';
import '../../../../core/notifications/notification_service.dart';
import 'expense_event.dart';
import 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  final ExpenseRepository repository;
  final BudgetRepository budgetRepository;
  final NotificationService notificationService;

  ExpenseBloc(
    this.repository,
    this.budgetRepository,
    this.notificationService,
  ) : super(ExpenseInitial()) {
    on<AddExpense>(_onAddExpense);
    on<LoadExpenses>(_onLoadExpenses);
    on<UpdateExpense>(_onUpdateExpense);
on<DeleteExpense>(_onDeleteExpense);
  }

  Future<void> _onAddExpense(
    AddExpense event,
    Emitter<ExpenseState> emit,
  ) async {
    try {
      emit(ExpenseLoading());

      final expense = Expense(
        id: const Uuid().v4(),
        groupId: event.groupId,
        title: event.title,
        amount: event.amount,
        paidBy: event.paidBy,
        category: event.category,
        transactionType: event.transactionType,
        splits: event.splits,
        updatedAt: DateTime.now().toUtc(),
        version: 1,
        isDeleted: false,
      );

      await repository.addExpense(expense);
      
      // 🔔 Budget Check
      try {
        final now = DateTime.now();
        final currentMonth = DateTime.utc(now.year, now.month, 1);
        
        // Check exact match budget
        final budgets = await budgetRepository.getBudgets(event.groupId);
        final budget = budgets.firstWhere(
          (b) => b.category == event.category && b.month.year == currentMonth.year && b.month.month == currentMonth.month,
          orElse: () => Budget(id: '', groupId: '', category: '', limit: 0, month: DateTime.now()), // Dummy
        );

        if (budget.limit > 0) {
          final spent = await budgetRepository.getSpentAmount(event.groupId, event.category, currentMonth);
          
          if (spent > budget.limit) {
             await notificationService.showNotification(
               id: 100, 
               title: '🚨 Budget Exceeded!', 
               body: 'You have exceeded your ${event.category} budget by ₹${(spent - budget.limit).toStringAsFixed(0)}.'
             );
          } else if (spent >= (budget.limit * 0.9)) {
             await notificationService.showNotification(
               id: 101, 
               title: '⚠️ Approaching Budget Limit', 
               body: 'You have used ${(spent/budget.limit*100).toStringAsFixed(0)}% of your ${event.category} budget.'
             );
          }
        }
      } catch (e) {
        // Ignore checking budget failures, don't block expense addition
        print("Budget check failed: $e");
      }

      final expenses = await repository.getExpenses(event.groupId);
      emit(ExpenseLoaded(expenses));
    } catch (e) {
      emit(ExpenseError('Failed to add expense'));
    }
  }

  Future<void> _onLoadExpenses(
    LoadExpenses event,
    Emitter<ExpenseState> emit,
  ) async {
    try {
      emit(ExpenseLoading());
      final expenses = await repository.getExpenses(event.groupId);
      emit(ExpenseLoaded(expenses));
    } catch (e) {
      emit(ExpenseError('Failed to load expenses'));
    }
  }

  Future<void> _onUpdateExpense(
  UpdateExpense event,
  Emitter<ExpenseState> emit,
) async {
  await repository.updateExpense(event.expense);
  add(LoadExpenses(event.expense.groupId));
}

Future<void> _onDeleteExpense(
  DeleteExpense event,
  Emitter<ExpenseState> emit,
) async {
  await repository.deleteExpense(event.expenseId);
  add(LoadExpenses(event.groupId));
}
}
