import '../repositories/analytics_repository.dart';
import '../entities/category_total.dart';

class GetSpendingBreakdownUseCase {
  final AnalyticsRepository repository;

  GetSpendingBreakdownUseCase(this.repository);

  Future<List<CategoryTotal>> call(String groupId) async {
    return await repository.getCategoryBreakdown(groupId);
  }
}
