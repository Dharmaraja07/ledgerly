abstract class ExportState {}

class ExportInitial extends ExportState {}
class ExportLoading extends ExportState {}
class ExportSuccess extends ExportState {
  final String path;
  ExportSuccess(this.path);
}
class ExportError extends ExportState {
  final String message;
  ExportError(this.message);
}
