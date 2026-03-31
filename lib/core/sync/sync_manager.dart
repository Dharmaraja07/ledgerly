import 'package:dio/dio.dart';
import 'package:isar/isar.dart';
import '../../features/auth/data/models/user_isar.dart';
import 'sync_queue_isar.dart';

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




  Future<void> _markAsSynced(SyncQueueIsar item) async {
    await isar.writeTxn(() async {
      await isar.syncQueueIsars.delete(item.id);
    });
  }
}
