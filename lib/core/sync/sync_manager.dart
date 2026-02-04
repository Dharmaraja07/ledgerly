import 'package:dio/dio.dart';
import 'package:isar/isar.dart';
import '../../features/auth/data/models/user_isar.dart';
import '../../features/group/data/models/group_isar.dart';
import '../../features/expense/data/models/expense_isar.dart';
import 'sync_queue_isar.dart';
import 'sync_entity_type.dart';
import 'sync_operation_type.dart';

class SyncManager {
  final Isar isar;
  final Dio dio;
  bool _running = false;

  SyncManager(this.isar,this.dio);

  Future<void> sync() async {
  if (_running) return;

  // ⛔ Do not sync if no user logged in
  final user = isar.userIsars.where().findFirstSync();
  if (user == null) return;

  _running = true;
  try {
    final queue = await isar.syncQueueIsars
        .where()
        .sortByCreatedAt()
        .findAll();

    for (final item in queue) {
      await _markAsSynced(item);
    }
  } finally {
    _running = false;
  }
}

Future<void> _syncExpense(SyncQueueIsar item) async {
  final expense = await isar.expenseIsars
      .filter()
      .expenseIdEqualTo(item.entityId)
      .findFirst();

  if (expense == null) return;

  await dio.post(
    '/expenses/sync',
    data: [
      {
        'id': expense.expenseId,
        'group_id': expense.groupId,
        'title': expense.title,
        'amount': expense.amount,
        'paid_by': expense.paidBy,
        'category': expense.category,
        'updatedAt': expense.updatedAt.toIso8601String(),
        'version': expense.version,
        'isDeleted': expense.isDeleted,
      }
    ],
  );
}


  Future<void> _markAsSynced(SyncQueueIsar item) async {
    await isar.writeTxn(() async {
      await isar.syncQueueIsars.delete(item.id);
    });
  }
}
