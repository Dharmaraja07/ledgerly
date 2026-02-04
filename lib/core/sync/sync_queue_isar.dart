import 'package:isar/isar.dart';
import 'sync_entity_type.dart';
import 'sync_operation_type.dart';

part 'sync_queue_isar.g.dart';

@collection
class SyncQueueIsar {
  Id id = Isar.autoIncrement;

  late String entityId;

  @enumerated
  late SyncEntityType entityType;

  @enumerated
  late SyncOperationType operation;

  late DateTime createdAt;
}
