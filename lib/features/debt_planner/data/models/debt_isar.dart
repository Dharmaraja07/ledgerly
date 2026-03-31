import 'package:isar/isar.dart';

part 'debt_isar.g.dart';

@collection
class DebtIsar {
  Id id = Isar.autoIncrement;

  late String debtId;
  late String title;
  late double initialAmount;
  late double currentBalance;
  late double interestRate;
  late double minimumPayment;
  late DateTime startDate;
  late DateTime? targetPayoffDate;
  @enumerated
  late DebtType type;
  @enumerated
  late DebtPayoffStrategy strategy;
  late String? creditorName;
  late String? accountNumber;
  late DateTime createdAt;
  late DateTime updatedAt;
  late int version;
  late bool isDeleted;

  double get totalPaid => initialAmount - currentBalance;
  
  double get progressPercentage {
    if (initialAmount == 0) return 0.0;
    return (totalPaid / initialAmount) * 100;
  }

  int get monthsRemaining {
    if (currentBalance <= 0 || minimumPayment <= 0) return 0;
    return (currentBalance / minimumPayment).ceil();
  }

  double get totalInterestPaid {
    return (initialAmount - currentBalance) * (interestRate / 100);
  }

  DateTime? get estimatedPayoffDate {
    if (currentBalance <= 0 || minimumPayment <= 0) return null;
    final months = monthsRemaining;
    return DateTime.now().add(Duration(days: months * 30));
  }
}

enum DebtType {
  creditCard,
  studentLoan,
  mortgage,
  autoLoan,
  personalLoan,
  medical,
  other,
}

enum DebtPayoffStrategy {
  snowball,
  avalanche,
  custom,
}

extension DebtTypeExtension on DebtType {
  String get displayName {
    switch (this) {
      case DebtType.creditCard:
        return 'Credit Card';
      case DebtType.studentLoan:
        return 'Student Loan';
      case DebtType.mortgage:
        return 'Mortgage';
      case DebtType.autoLoan:
        return 'Auto Loan';
      case DebtType.personalLoan:
        return 'Personal Loan';
      case DebtType.medical:
        return 'Medical Debt';
      case DebtType.other:
        return 'Other';
    }
  }

  String get icon {
    switch (this) {
      case DebtType.creditCard:
        return '💳';
      case DebtType.studentLoan:
        return '🎓';
      case DebtType.mortgage:
        return '🏠';
      case DebtType.autoLoan:
        return '🚗';
      case DebtType.personalLoan:
        return '💰';
      case DebtType.medical:
        return '🏥';
      case DebtType.other:
        return '📄';
    }
  }
}

extension DebtPayoffStrategyExtension on DebtPayoffStrategy {
  String get displayName {
    switch (this) {
      case DebtPayoffStrategy.snowball:
        return 'Snowball (Smallest First)';
      case DebtPayoffStrategy.avalanche:
        return 'Avalanche (Highest Interest)';
      case DebtPayoffStrategy.custom:
        return 'Custom Order';
    }
  }

  String get description {
    switch (this) {
      case DebtPayoffStrategy.snowball:
        return 'Pay off smallest debts first for quick wins';
      case DebtPayoffStrategy.avalanche:
        return 'Pay off highest interest debts first to save money';
      case DebtPayoffStrategy.custom:
        return 'Create your own payoff order';
    }
  }
}
