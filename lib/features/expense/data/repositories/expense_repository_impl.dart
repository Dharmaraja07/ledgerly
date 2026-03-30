import 'package:isar/isar.dart';

import '../../domain/entitities/Expense.dart';
import '../../domain/repositories/expense_repository.dart';
import '../models/expense_isar.dart';
import '../models/split_isar.dart';
import '../../../../core/sync/sync_queue_isar.dart';
import '../../../../core/sync/sync_entity_type.dart';
import '../../../../core/sync/sync_operation_type.dart';

class ExpenseRepositoryImpl implements ExpenseRepository {
  final Isar isar;

  ExpenseRepositoryImpl(this.isar);

  @override
  Future<void> addExpense(Expense expense) async {
    final model = ExpenseIsar()
      ..expenseId = expense.id
      ..groupId = expense.groupId
      ..title = expense.title
      ..amount = expense.amount
      ..paidBy = expense.paidBy
      ..category = expense.category
      ..transactionType = expense.transactionType.name
      ..splits = expense.splits.entries
          .map((e) => SplitIsar()
            ..userId = e.key
            ..amount = e.value)
          .toList()
      ..updatedAt = expense.updatedAt
      ..version = expense.version
      ..isDeleted = false;

    await isar.writeTxn(() async {
      await isar.expenseIsars.put(model);

      await isar.syncQueueIsars.put(
        SyncQueueIsar()
          ..entityId = model.expenseId
          ..entityType = SyncEntityType.expense
          ..operation = SyncOperationType.create
          ..createdAt = DateTime.now().toUtc(),
      );
    });
  }

  @override
  Future<List<Expense>> getExpenses(String groupId) async {
    final data = await isar.expenseIsars
        .filter()
        .groupIdEqualTo(groupId)
        .findAll();

    return data
        .where((e) => !e.isDeleted)
        .map(
          (e) => Expense(
            id: e.expenseId,
            groupId: e.groupId,
            title: e.title,
            amount: e.amount,
            paidBy: e.paidBy,
            category: e.category,
            transactionType: TransactionType.values.asNameMap()[e.transactionType] ?? TransactionType.expense,
            splits: {
              for (final s in e.splits) s.userId: s.amount,
            },
            updatedAt: e.updatedAt,
            version: e.version,
            isDeleted: e.isDeleted,
          ),
        )
        .toList();
  }

  Future<void> updateExpense(Expense expense) async {
  final existing = await isar.expenseIsars
      .filter()
      .expenseIdEqualTo(expense.id)
      .findFirst();

  if (existing == null) return;

  existing
    ..title = expense.title
    ..amount = expense.amount
    ..paidBy = expense.paidBy
    ..category = expense.category
    ..transactionType = expense.transactionType.name
    ..splits = expense.splits.entries
        .map((e) => SplitIsar()
          ..userId = e.key
          ..amount = e.value)
        .toList()
    ..updatedAt = DateTime.now().toUtc()
    ..version += 1;

  await isar.writeTxn(() async {
    await isar.expenseIsars.put(existing);

    await isar.syncQueueIsars.put(
      SyncQueueIsar()
        ..entityId = existing.expenseId
        ..entityType = SyncEntityType.expense
        ..operation = SyncOperationType.update
        ..createdAt = DateTime.now().toUtc(),
    );
  });
}

Future<void> deleteExpense(String expenseId) async {
  final existing = await isar.expenseIsars
      .filter()
      .expenseIdEqualTo(expenseId)
      .findFirst();

  if (existing == null) return;

  existing
    ..isDeleted = true
    ..updatedAt = DateTime.now().toUtc()
    ..version += 1;

  await isar.writeTxn(() async {
    await isar.expenseIsars.put(existing);

    await isar.syncQueueIsars.put(
      SyncQueueIsar()
        ..entityId = existing.expenseId
        ..entityType = SyncEntityType.expense
        ..operation = SyncOperationType.delete
        ..createdAt = DateTime.now().toUtc(),
    );
  });
}

}
