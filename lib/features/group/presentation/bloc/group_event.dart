import '../../domain/entitities/group.dart';

abstract class GroupEvent {}

class CreateGroup extends GroupEvent {
  final String name;
  CreateGroup(this.name);
}

class LoadGroups extends GroupEvent {}
class UpdateGroup extends GroupEvent {
  final Group group;
  UpdateGroup(this.group);
}

class DeleteGroup extends GroupEvent {
  final String groupId;
  DeleteGroup(this.groupId);
}
