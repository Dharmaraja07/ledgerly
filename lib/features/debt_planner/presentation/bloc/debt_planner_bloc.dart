import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/debt_isar.dart';
import '../../data/repositories/debt_repository.dart';

part 'debt_planner_event.dart';
part 'debt_planner_state.dart';

class DebtPlannerBloc extends Bloc<DebtPlannerEvent, DebtPlannerState> {
  final DebtRepository _repository;

  DebtPlannerBloc(this._repository) : super(const DebtPlannerState()) {
    on<LoadDebts>(_onLoadDebts);
    on<AddDebt>(_onAddDebt);
    on<UpdateDebt>(_onUpdateDebt);
    on<DeleteDebt>(_onDeleteDebt);
    on<MakePayment>(_onMakePayment);
    on<GeneratePayoffPlan>(_onGeneratePayoffPlan);
    on<UpdateStrategy>(_onUpdateStrategy);
    on<UpdateMonthlyPayment>(_onUpdateMonthlyPayment);
    on<RefreshDebts>(_onRefreshDebts);
  }

  Future<void> _onLoadDebts(LoadDebts event, Emitter<DebtPlannerState> emit) async {
    emit(state.copyWith(status: DebtPlannerStatus.loading));
    try {
      final debts = await _repository.getAllDebts();
      final totalDebt = await _repository.getTotalDebt();
      final totalMonthlyPayments = await _repository.getTotalMonthlyPayments();
      final totalInterestPaid = await _repository.getTotalInterestPaid();

      emit(state.copyWith(
        status: DebtPlannerStatus.success,
        debts: debts,
        totalDebt: totalDebt,
        totalMonthlyPayments: totalMonthlyPayments,
        totalInterestPaid: totalInterestPaid,
      ));

      // Generate plan if we have the required data
      if (state.monthlyPayment > 0) {
        add(GeneratePayoffPlan());
      }
    } catch (e) {
      emit(state.copyWith(
        status: DebtPlannerStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onAddDebt(AddDebt event, Emitter<DebtPlannerState> emit) async {
    try {
      await _repository.addDebt(event.debt);
      add(const LoadDebts());
    } catch (e) {
      emit(state.copyWith(
        status: DebtPlannerStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onUpdateDebt(UpdateDebt event, Emitter<DebtPlannerState> emit) async {
    try {
      await _repository.updateDebt(event.debt);
      add(const LoadDebts());
    } catch (e) {
      emit(state.copyWith(
        status: DebtPlannerStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onDeleteDebt(DeleteDebt event, Emitter<DebtPlannerState> emit) async {
    try {
      await _repository.deleteDebt(event.debtId);
      add(const LoadDebts());
    } catch (e) {
      emit(state.copyWith(
        status: DebtPlannerStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onMakePayment(MakePayment event, Emitter<DebtPlannerState> emit) async {
    try {
      await _repository.makePayment(event.debtId, event.paymentAmount);
      add(const LoadDebts());
    } catch (e) {
      emit(state.copyWith(
        status: DebtPlannerStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onGeneratePayoffPlan(GeneratePayoffPlan event, Emitter<DebtPlannerState> emit) async {
    if (state.monthlyPayment <= 0 || state.debts.isEmpty) return;

    emit(state.copyWith(status: DebtPlannerStatus.loading));
    try {
      final plan = await _repository.generatePayoffPlan(
        state.strategy,
        state.monthlyPayment,
      );

      emit(state.copyWith(
        status: DebtPlannerStatus.success,
        payoffPlan: plan,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: DebtPlannerStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onUpdateStrategy(UpdateStrategy event, Emitter<DebtPlannerState> emit) async {
    emit(state.copyWith(strategy: event.strategy));
    if (state.monthlyPayment > 0) {
      add(GeneratePayoffPlan());
    }
  }

  Future<void> _onUpdateMonthlyPayment(UpdateMonthlyPayment event, Emitter<DebtPlannerState> emit) async {
    emit(state.copyWith(monthlyPayment: event.monthlyPayment));
    if (event.monthlyPayment > 0 && state.debts.isNotEmpty) {
      add(GeneratePayoffPlan());
    }
  }

  Future<void> _onRefreshDebts(RefreshDebts event, Emitter<DebtPlannerState> emit) async {
    add(const LoadDebts());
  }
}
