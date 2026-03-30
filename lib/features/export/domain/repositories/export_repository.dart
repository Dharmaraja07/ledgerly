abstract class ExportRepository {
  Future<String> generateCsv(String groupId);
  Future<String> generatePdf(String groupId);
  Future<String> generateBackupSnapshot();
  Future<String> restoreLatestBackup();
}
