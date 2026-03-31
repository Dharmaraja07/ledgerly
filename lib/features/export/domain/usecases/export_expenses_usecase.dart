import '../repositories/export_repository.dart';

class ExportExpensesUseCase {
  final ExportRepository repository;

  ExportExpensesUseCase(this.repository);

  Future<String> call(String groupId, {String format = 'CSV'}) async {
    if (format == 'PDF') {
      return await repository.generatePdf(groupId);
    }
    return await repository.generateCsv(groupId);
  }

  Future<String> backup() async {
    return await repository.generateBackupSnapshot();
  }

  Future<String> restoreLatestBackup() async {
    return await repository.restoreLatestBackup();
  }
}
