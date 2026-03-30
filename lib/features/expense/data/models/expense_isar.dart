import 'package:isar/isar.dart';
import 'split_isar.dart';

part 'expense_isar.g.dart';

@collection
class ExpenseIsar {
  Id id = Isar.autoIncrement;

  late String expenseId;
  late String groupId;
  late String title;
  late double amount;
  late String paidBy;
  late String category;
  String? transactionType;

  late List<SplitIsar> splits;

  late DateTime updatedAt;
  late int version;
  late bool isDeleted;
}
