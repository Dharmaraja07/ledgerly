import '../repositories/export_repository.dart';

class ExportExpensesUseCase {
  final ExportRepository repository;

  ExportExpensesUseCase(this.repository);

  Future<String> call(String groupId) async {
    return await repository.generateCsv(groupId);
  }
}
