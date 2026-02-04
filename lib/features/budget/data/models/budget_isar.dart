import 'package:isar/isar.dart';

part 'budget_isar.g.dart';

@collection
class BudgetIsar {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String budgetId;

  late String groupId;
  late String category;
  late double limit;
  late DateTime month;
}
