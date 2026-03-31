import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/analytics_repository.dart';
import '../../domain/usecases/get_spending_breakdown.dart';
import 'analytics_event.dart';
import 'analytics_state.dart';

class AnalyticsBloc extends Bloc<AnalyticsEvent, AnalyticsState> {
  final GetSpendingBreakdownUseCase getSpendingBreakdown;
  final AnalyticsRepository analyticsRepository;

  AnalyticsBloc(this.getSpendingBreakdown, this.analyticsRepository)
      : super(AnalyticsInitial()) {
    on<LoadAnalytics>(_onLoadAnalytics);
  }

  Future<void> _onLoadAnalytics(LoadAnalytics event, Emitter<AnalyticsState> emit) async {
    emit(AnalyticsLoading());
    try {
      final breakdown = await getSpendingBreakdown(event.groupId);
      final total = breakdown.fold<double>(0, (sum, item) => sum + item.totalAmount);
      final monthlySpending = await analyticsRepository.getMonthlySpending(event.groupId);

      emit(AnalyticsLoaded(breakdown, total, monthlySpending));
    } catch (e) {
      emit(AnalyticsError("Failed to load analytics: $e"));
    }
  }
}
