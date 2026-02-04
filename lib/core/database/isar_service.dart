import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../features/auth/data/models/user_isar.dart';
import '../../features/group/data/models/group_isar.dart';
import '../../features/expense/data/models/expense_isar.dart';
import '../sync/sync_queue_isar.dart';

class IsarService {
  late final Isar isar;

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();

    isar = await Isar.open(
      [
        UserIsarSchema,
        GroupIsarSchema,
        ExpenseIsarSchema,
        SyncQueueIsarSchema,
      ],
      directory: dir.path,
    );
  }
}
