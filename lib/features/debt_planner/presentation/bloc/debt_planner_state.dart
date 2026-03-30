part of 'debt_planner_bloc.dart';

enum DebtPlannerStatus { initial, loading, success, failure }

class DebtPlannerState extends Equatable {
  final DebtPlannerStatus status;
  final List<DebtIsar> debts;
  final DebtPayoffStrategy strategy;
  final double monthlyPayment;
  final DebtPayoffPlan? payoffPlan;
  final double totalDebt;
  final double totalMonthlyPayments;
  final double totalInterestPaid;
  final String? errorMessage;

  const DebtPlannerState({
    this.status = DebtPlannerStatus.initial,
    this.debts = const [],
    this.strategy = DebtPayoffStrategy.snowball,
    this.monthlyPayment = 0.0,
    this.payoffPlan,
    this.totalDebt = 0.0,
    this.totalMonthlyPayments = 0.0,
    this.totalInterestPaid = 0.0,
    this.errorMessage,
  });

  DebtPlannerState copyWith({
    DebtPlannerStatus? status,
    List<DebtIsar>? debts,
    DebtPayoffStrategy? strategy,
    double? monthlyPayment,
    DebtPayoffPlan? payoffPlan,
    double? totalDebt,
    double? totalMonthlyPayments,
    double? totalInterestPaid,
    String? errorMessage,
  }) {
    return DebtPlannerState(
      status: status ?? this.status,
      debts: debts ?? this.debts,
      strategy: strategy ?? this.strategy,
      monthlyPayment: monthlyPayment ?? this.monthlyPayment,
      payoffPlan: payoffPlan ?? this.payoffPlan,
      totalDebt: totalDebt ?? this.totalDebt,
      totalMonthlyPayments: totalMonthlyPayments ?? this.totalMonthlyPayments,
      totalInterestPaid: totalInterestPaid ?? this.totalInterestPaid,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        debts,
        strategy,
        monthlyPayment,
        payoffPlan,
        totalDebt,
        totalMonthlyPayments,
        totalInterestPaid,
        errorMessage,
      ];

  int get totalDebts => debts.length;

  double get averageInterestRate {
    if (debts.isEmpty) return 0.0;
    final totalWeightedRate = debts.fold(0.0, (sum, debt) => sum + (debt.interestRate * debt.currentBalance));
    return totalWeightedRate / totalDebt;
  }

  bool get hasValidPayoffPlan => payoffPlan != null && payoffPlan!.totalMonths > 0;

  String get debtFreeDate {
    if (!hasValidPayoffPlan) return 'Not calculated';
    final date = payoffPlan!.payoffDate;
    return '${date.day}/${date.month}/${date.year}';
  }

  double get totalInterestToPay {
    if (!hasValidPayoffPlan) return 0.0;
    return payoffPlan!.totalInterestPaid;
  }

  double get monthlySavings {
    if (!hasValidPayoffPlan) return 0.0;
    return totalMonthlyPayments - payoffPlan!.monthlyPayment;
  }
}
