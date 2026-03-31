part of 'debt_planner_bloc.dart';

abstract class DebtPlannerEvent extends Equatable {
  const DebtPlannerEvent();

  @override
  List<Object> get props => [];
}

class LoadDebts extends DebtPlannerEvent {
  const LoadDebts();
}

class AddDebt extends DebtPlannerEvent {
  final DebtIsar debt;

  const AddDebt(this.debt);

  @override
  List<Object> get props => [debt];
}

class UpdateDebt extends DebtPlannerEvent {
  final DebtIsar debt;

  const UpdateDebt(this.debt);

  @override
  List<Object> get props => [debt];
}

class DeleteDebt extends DebtPlannerEvent {
  final String debtId;

  const DeleteDebt(this.debtId);

  @override
  List<Object> get props => [debtId];
}

class MakePayment extends DebtPlannerEvent {
  final String debtId;
  final double paymentAmount;

  const MakePayment(this.debtId, this.paymentAmount);

  @override
  List<Object> get props => [debtId, paymentAmount];
}

class GeneratePayoffPlan extends DebtPlannerEvent {
  const GeneratePayoffPlan();
}

class UpdateStrategy extends DebtPlannerEvent {
  final DebtPayoffStrategy strategy;

  const UpdateStrategy(this.strategy);

  @override
  List<Object> get props => [strategy];
}

class UpdateMonthlyPayment extends DebtPlannerEvent {
  final double monthlyPayment;

  const UpdateMonthlyPayment(this.monthlyPayment);

  @override
  List<Object> get props => [monthlyPayment];
}

class RefreshDebts extends DebtPlannerEvent {
  const RefreshDebts();
}
