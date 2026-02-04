
import '../entitities/group.dart';

abstract class GroupRepository {
  Future<void> createGroup(Group group);
  Future<List<Group>> getGroups();
  Future<void> updateGroup(Group group);
Future<void> deleteGroup(String groupId);

}