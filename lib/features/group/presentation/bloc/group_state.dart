

import '../../domain/entitities/group.dart';

abstract class GroupState {}

class GroupInitial extends GroupState {}

class GroupLoaded extends GroupState {
  final List<Group> groups;
  GroupLoaded(this.groups);
}
