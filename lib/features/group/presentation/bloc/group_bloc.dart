import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entitities/group.dart';
import 'group_event.dart';
import 'group_state.dart';
import '../../domain/repositories/group_repository.dart';
import 'package:uuid/uuid.dart';

class GroupBloc extends Bloc<GroupEvent, GroupState> {
  final GroupRepository repository;

  GroupBloc(this.repository) : super(GroupInitial()) {
    on<CreateGroup>(_onCreateGroup);
    on<LoadGroups>(_onLoadGroups);
    on<UpdateGroup>(_onUpdateGroup);
on<DeleteGroup>(_onDeleteGroup);
  }

  Future<void> _onCreateGroup(
    CreateGroup event,
    Emitter<GroupState> emit,
  ) async {
    final group = Group(
      id: const Uuid().v4(),
      name: event.name,
      memberIds: [],
      updatedAt: DateTime.now().toUtc(),
      version: 1,
      isDeleted: false,
    );

    await repository.createGroup(group);
    add(LoadGroups());
  }

  Future<void> _onLoadGroups(
    LoadGroups event,
    Emitter<GroupState> emit,
  ) async {
    final groups = await repository.getGroups();
    emit(GroupLoaded(groups));
  }
  Future<void> _onUpdateGroup(
  UpdateGroup event,
  Emitter<GroupState> emit,
) async {
  await repository.updateGroup(event.group);
  add(LoadGroups());
}

Future<void> _onDeleteGroup(
  DeleteGroup event,
  Emitter<GroupState> emit,
) async {
  await repository.deleteGroup(event.groupId);
  add(LoadGroups());
}
}


