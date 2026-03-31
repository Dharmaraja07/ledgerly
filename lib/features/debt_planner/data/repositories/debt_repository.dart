import 'package:isar/isar.dart';

import '../../data/models/debt_isar.dart';
import '../../../../core/database/isar_service.dart';

abstract class DebtRepository {
  Future<List<DebtIsar>> getAllDebts();
  Future<DebtIsar?> getDebtById(String debtId);
  Future<void> addDebt(DebtIsar debt);
  Future<void> updateDebt(DebtIsar debt);
  Future<void> deleteDebt(String debtId);
  Future<void> makePayment(String debtId, double paymentAmount);
  Future<List<DebtIsar>> getDebtsByStrategy(DebtPayoffStrategy strategy);
  Future<DebtPayoffPlan> generatePayoffPlan(DebtPayoffStrategy strategy, double monthlyPayment);
  Future<double> getTotalDebt();
  Future<double> getTotalMonthlyPayments();
  Future<double> getTotalInterestPaid();
}

class DebtRepositoryImpl implements DebtRepository {
  final IsarService _isarService;

  DebtRepositoryImpl(this._isarService);

  Future<List<DebtIsar>> _activeDebts() async {
    final debts = await _isarService.isar.debtIsars.where().findAll();
    final activeDebts = debts.where((debt) => !debt.isDeleted).toList()
      ..sort((a, b) => b.currentBalance.compareTo(a.currentBalance));
    return activeDebts;
  }

  @override
  Future<List<DebtIsar>> getAllDebts() async {
    return _activeDebts();
  }

  @override
  Future<DebtIsar?> getDebtById(String debtId) async {
    final debts = await _activeDebts();
    try {
      return debts.firstWhere((debt) => debt.debtId == debtId);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> addDebt(DebtIsar debt) async {
    final isar = _isarService.isar;
    await isar.writeTxn(() async {
      await isar.debtIsars.put(debt);
    });
  }

  @override
  Future<void> updateDebt(DebtIsar debt) async {
    final isar = _isarService.isar;
    debt.updatedAt = DateTime.now();
    debt.version++;
    await isar.writeTxn(() async {
      await isar.debtIsars.put(debt);
    });
  }

  @override
  Future<void> deleteDebt(String debtId) async {
    final isar = _isarService.isar;
    await isar.writeTxn(() async {
      final debt = await getDebtById(debtId);
      if (debt != null) {
        debt.isDeleted = true;
        debt.updatedAt = DateTime.now();
        debt.version++;
        await isar.debtIsars.put(debt);
      }
    });
  }

  @override
  Future<void> makePayment(String debtId, double paymentAmount) async {
    final isar = _isarService.isar;
    await isar.writeTxn(() async {
      final debt = await getDebtById(debtId);
      if (debt != null) {
        debt.currentBalance = (debt.currentBalance - paymentAmount).clamp(0.0, double.infinity);
        debt.updatedAt = DateTime.now();
        debt.version++;
        await isar.debtIsars.put(debt);
      }
    });
  }

  @override
  Future<List<DebtIsar>> getDebtsByStrategy(DebtPayoffStrategy strategy) async {
    final debts = await getAllDebts();
    
    switch (strategy) {
      case DebtPayoffStrategy.snowball:
        // Sort by balance (smallest first)
        debts.sort((a, b) => a.currentBalance.compareTo(b.currentBalance));
        break;
      case DebtPayoffStrategy.avalanche:
        // Sort by interest rate (highest first)
        debts.sort((a, b) => b.interestRate.compareTo(a.interestRate));
        break;
      case DebtPayoffStrategy.custom:
        // Keep current order
        break;
    }
    
    return debts;
  }

  @override
  Future<DebtPayoffPlan> generatePayoffPlan(DebtPayoffStrategy strategy, double monthlyPayment) async {
    final debts = await getDebtsByStrategy(strategy);
    final plan = DebtPayoffPlan(
      strategy: strategy,
      monthlyPayment: monthlyPayment,
      payments: [],
      debts: [],
    );

    if (debts.isEmpty) return plan;

    final workingDebts = debts.map((debt) => debt.copyWith()).toList();
    double availablePayment = monthlyPayment;
    int month = 0;
    double totalPaid = 0.0;
    double totalInterestPaid = 0.0;

    while (workingDebts.any((debt) => debt.currentBalance > 0)) {
      month++;
      double monthPayment = availablePayment;
      double monthInterestPaid = 0.0;
      final List<DebtPayment> monthPayments = [];

      for (final debt in workingDebts) {
        if (debt.currentBalance <= 0) continue;

        final monthlyInterest = (debt.currentBalance * debt.interestRate / 100) / 12;
        monthInterestPaid += monthlyInterest;
        
        double paymentForDebt;
        if (workingDebts.where((d) => d.currentBalance > 0).length == 1) {
          // Last debt - pay everything available
          paymentForDebt = monthPayment;
        } else {
          // Pay minimum payment
          paymentForDebt = debt.minimumPayment;
        }

        paymentForDebt = paymentForDebt.clamp(0.0, debt.currentBalance + monthlyInterest);
        
        debt.currentBalance = (debt.currentBalance + monthlyInterest - paymentForDebt).clamp(0.0, double.infinity);
        monthPayment -= paymentForDebt;
        totalPaid += paymentForDebt;

        monthPayments.add(DebtPayment(
          debtId: debt.debtId,
          debtName: debt.title,
          paymentAmount: paymentForDebt,
          interestAmount: monthlyInterest,
          remainingBalance: debt.currentBalance,
        ));

        if (monthPayment <= 0) break;
      }

      totalInterestPaid += monthInterestPaid;
      
      plan.payments.add(PayoffMonth(
        month: month,
        totalPayment: availablePayment - monthPayment,
        interestPaid: monthInterestPaid,
        principalPaid: (availablePayment - monthPayment) - monthInterestPaid,
        remainingDebt: workingDebts.fold(0.0, (sum, debt) => sum + debt.currentBalance),
        debtPayments: monthPayments,
      ));

      if (month > 600) break; // Safety limit (50 years)
    }

    plan.totalMonths = month;
    plan.totalPaid = totalPaid;
    plan.totalInterestPaid = totalInterestPaid;
    plan.originalDebt = debts.fold(0.0, (sum, debt) => sum + debt.currentBalance);

    return plan;
  }

  @override
  Future<double> getTotalDebt() async {
    final debts = await getAllDebts();
    return debts.fold<double>(0.0, (sum, debt) => sum + debt.currentBalance);
  }

  @override
  Future<double> getTotalMonthlyPayments() async {
    final debts = await getAllDebts();
    return debts.fold<double>(0.0, (sum, debt) => sum + debt.minimumPayment);
  }

  @override
  Future<double> getTotalInterestPaid() async {
    final debts = await getAllDebts();
    return debts.fold<double>(0.0, (sum, debt) => sum + debt.totalInterestPaid);
  }
}

class DebtPayoffPlan {
  final DebtPayoffStrategy strategy;
  final double monthlyPayment;
  final List<PayoffMonth> payments;
  final List<DebtIsar> debts;
  int totalMonths;
  double totalPaid;
  double totalInterestPaid;
  double originalDebt;

  DebtPayoffPlan({
    required this.strategy,
    required this.monthlyPayment,
    required this.payments,
    required this.debts,
    this.totalMonths = 0,
    this.totalPaid = 0.0,
    this.totalInterestPaid = 0.0,
    this.originalDebt = 0.0,
  });

  DateTime get payoffDate {
    return DateTime.now().add(Duration(days: totalMonths * 30));
  }

  double get totalInterestSaved {
    return totalInterestPaid;
  }

  String get payoffTimeframe {
    if (totalMonths < 12) {
      return '$totalMonths months';
    } else {
      final years = totalMonths ~/ 12;
      final months = totalMonths % 12;
      if (months == 0) {
        return '$years years';
      } else {
        return '$years years, $months months';
      }
    }
  }
}

class PayoffMonth {
  final int month;
  final double totalPayment;
  final double interestPaid;
  final double principalPaid;
  final double remainingDebt;
  final List<DebtPayment> debtPayments;

  PayoffMonth({
    required this.month,
    required this.totalPayment,
    required this.interestPaid,
    required this.principalPaid,
    required this.remainingDebt,
    required this.debtPayments,
  });
}

class DebtPayment {
  final String debtId;
  final String debtName;
  final double paymentAmount;
  final double interestAmount;
  final double remainingBalance;

  DebtPayment({
    required this.debtId,
    required this.debtName,
    required this.paymentAmount,
    required this.interestAmount,
    required this.remainingBalance,
  });
}

extension DebtIsarCopy on DebtIsar {
  DebtIsar copyWith() {
    return DebtIsar()
      ..debtId = debtId
      ..title = title
      ..initialAmount = initialAmount
      ..currentBalance = currentBalance
      ..interestRate = interestRate
      ..minimumPayment = minimumPayment
      ..startDate = startDate
      ..targetPayoffDate = targetPayoffDate
      ..type = type
      ..strategy = strategy
      ..creditorName = creditorName
      ..accountNumber = accountNumber
      ..createdAt = createdAt
      ..updatedAt = updatedAt
      ..version = version
      ..isDeleted = isDeleted;
  }
}
