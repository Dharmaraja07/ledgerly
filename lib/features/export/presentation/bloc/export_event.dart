abstract class ExportEvent {}

class ExportToCsv extends ExportEvent {
  final String groupId;
  ExportToCsv(this.groupId);
}
