import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/export_expenses_usecase.dart';
import 'export_event.dart';
import 'export_state.dart';

class ExportBloc extends Bloc<ExportEvent, ExportState> {
  final ExportExpensesUseCase exportExpenses;

  ExportBloc(this.exportExpenses) : super(ExportInitial()) {
    on<ExportToCsv>(_onExportToCsv);
    on<ExportBackupRequested>(_onExportBackupRequested);
    on<RestoreLatestBackupRequested>(_onRestoreLatestBackupRequested);
  }

  Future<void> _onExportToCsv(ExportToCsv event, Emitter<ExportState> emit) async {
    emit(ExportLoading());
    try {
      final path = await exportExpenses(event.groupId, format: event.format);
      emit(ExportSuccess(path));
    } catch (e) {
      emit(ExportError("Failed to export: $e"));
    }
  }

  Future<void> _onExportBackupRequested(
    ExportBackupRequested event,
    Emitter<ExportState> emit,
  ) async {
    emit(ExportLoading());
    try {
      final path = await exportExpenses.backup();
      emit(ExportSuccess(path));
    } catch (e) {
      emit(ExportError("Failed to create backup: $e"));
    }
  }

  Future<void> _onRestoreLatestBackupRequested(
    RestoreLatestBackupRequested event,
    Emitter<ExportState> emit,
  ) async {
    emit(ExportLoading());
    try {
      final path = await exportExpenses.restoreLatestBackup();
      emit(ExportSuccess(path));
    } catch (e) {
      emit(ExportError("Failed to restore backup: $e"));
    }
  }
}
