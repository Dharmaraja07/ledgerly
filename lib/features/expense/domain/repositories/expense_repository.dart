import '../entitities/Expense.dart';

abstract class ExpenseRepository {
  Future<void> addExpense(Expense expense);
  Future<List<Expense>> getExpenses(String groupId);
  Future<void> updateExpense(Expense expense);
Future<void> deleteExpense(String expenseId);

}
