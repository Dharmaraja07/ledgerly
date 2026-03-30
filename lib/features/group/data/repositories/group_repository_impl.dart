import 'package:isar/isar.dart';
import '../../../../core/sync/sync_entity_type.dart';
import '../../../../core/sync/sync_operation_type.dart';
import '../../../../core/sync/sync_queue_isar.dart';
import '../../domain/entitities/group.dart';
import '../../domain/repositories/group_repository.dart';
import '../models/group_isar.dart';

class GroupRepositoryImpl implements GroupRepository {
  final Isar isar;

  GroupRepositoryImpl(this.isar);

  @override
  Future<void> createGroup(Group group) async {
    final model = GroupIsar()
      ..groupId = group.id
      ..name = group.name
      ..memberIds = group.memberIds
      ..updatedAt = group.updatedAt
      ..version = group.version
      ..isDeleted = false;

    await isar.writeTxn(() async {
      await isar.groupIsars.put(model);
    });
  }

  @override
  Future<List<Group>> getGroups() async {
    if ((await isar.groupIsars.count()) == 0) {
      await createGroup(
        Group(
          id: 'default',
          name: 'Personal Wallet',
          memberIds: const [],
          updatedAt: DateTime.now().toUtc(),
          version: 1,
          isDeleted: false,
        ),
      );
    }

    final data = await isar.groupIsars.where().findAll();

    return data
        .where((g) => !g.isDeleted)
        .map(
          (g) => Group(
            id: g.groupId,
            name: g.name,
            memberIds: g.memberIds,
            updatedAt: g.updatedAt,
            version: g.version,
            isDeleted: g.isDeleted,
          ),
        )
        .toList();
  }

  @override
Future<void> updateGroup(Group group) async {
  final existing = await isar.groupIsars
      .filter()
      .groupIdEqualTo(group.id)
      .findFirst();

  if (existing == null) return;

  existing
    ..name = group.name
    ..updatedAt = DateTime.now().toUtc()
    ..version += 1;

  await isar.writeTxn(() async {
    await isar.groupIsars.put(existing);

    await isar.syncQueueIsars.put(
      SyncQueueIsar()
        ..entityId = existing.groupId
        ..entityType = SyncEntityType.group
        ..operation = SyncOperationType.update
        ..createdAt = DateTime.now().toUtc(),
    );
  });
}

@override
Future<void> deleteGroup(String groupId) async {
  final existing = await isar.groupIsars
      .filter()
      .groupIdEqualTo(groupId)
      .findFirst();

  if (existing == null) return;

  existing
    ..isDeleted = true
    ..updatedAt = DateTime.now().toUtc()
    ..version += 1;

  await isar.writeTxn(() async {
    await isar.groupIsars.put(existing);

    await isar.syncQueueIsars.put(
      SyncQueueIsar()
        ..entityId = existing.groupId
        ..entityType = SyncEntityType.group
        ..operation = SyncOperationType.delete
        ..createdAt = DateTime.now().toUtc(),
    );
  });
}

}
