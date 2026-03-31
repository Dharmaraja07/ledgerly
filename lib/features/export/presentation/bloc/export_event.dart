abstract class ExportEvent {}

class ExportToCsv extends ExportEvent {
  final String groupId;
  final String format;
  ExportToCsv(this.groupId, {this.format = 'CSV'});
}

class ExportBackupRequested extends ExportEvent {}

class RestoreLatestBackupRequested extends ExportEvent {}
