import 'package:isar/isar.dart';

part 'group_isar.g.dart';

@collection
class GroupIsar {
  Id id = Isar.autoIncrement;

  late String groupId;
  late String name;

  late List<String> memberIds;

  late DateTime updatedAt;
  late int version;
  late bool isDeleted;
}
