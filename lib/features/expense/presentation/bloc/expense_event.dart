import '../../domain/entitities/Expense.dart';

abstract class ExpenseEvent {}

class AddExpense extends ExpenseEvent {
  final String groupId;
  final String title;
  final double amount;
  final String paidBy;
  final String category;
  final Map<String, double> splits;

  final TransactionType transactionType;

  AddExpense({
    required this.groupId,
    required this.title,
    required this.amount,
    required this.paidBy,
    required this.category,
    required this.splits,
    this.transactionType = TransactionType.expense,
  });
}
class UpdateExpense extends ExpenseEvent {
  final Expense expense;
  UpdateExpense(this.expense);
}

class DeleteExpense extends ExpenseEvent {
  final String expenseId;
  final String groupId;
  DeleteExpense(this.expenseId, this.groupId);
}

class LoadExpenses extends ExpenseEvent {
  final String groupId;

  LoadExpenses(this.groupId);
}
