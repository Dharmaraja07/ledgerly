import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/export_expenses_usecase.dart';
import 'export_event.dart';
import 'export_state.dart';

class ExportBloc extends Bloc<ExportEvent, ExportState> {
  final ExportExpensesUseCase exportExpenses;

  ExportBloc(this.exportExpenses) : super(ExportInitial()) {
    on<ExportToCsv>(_onExportToCsv);
  }

  Future<void> _onExportToCsv(ExportToCsv event, Emitter<ExportState> emit) async {
    emit(ExportLoading());
    try {
      final path = await exportExpenses(event.groupId);
      emit(ExportSuccess(path));
    } catch (e) {
      emit(ExportError("Failed to export: $e"));
    }
  }
}
