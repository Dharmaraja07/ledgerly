import 'package:isar/isar.dart';

part 'bank_transaction_isar.g.dart';

@collection
class BankTransactionIsar {
  Id id = Isar.autoIncrement;

  late String transactionId;
  late String importBatchId;
  late String bankAccountId;
  late String description;
  late double amount;
  late DateTime transactionDate;
  late String? referenceNumber;
  late String? category;
  late String? merchantName;
  late String? merchantCategory;
  @enumerated
  late TransactionType type;
  @enumerated
  late ReconciliationStatus reconciliationStatus;
  String? matchedExpenseId;
  String? matchedIncomeId;
  String? notes;
  late DateTime createdAt;
  late DateTime updatedAt;
  late int version;
  late bool isDeleted;

  bool get isReconciled => reconciliationStatus == ReconciliationStatus.reconciled;
  
  bool get needsReview => reconciliationStatus == ReconciliationStatus.pending;
  
  bool get isCredit => type == TransactionType.credit;
  
  bool get isDebit => type == TransactionType.debit;

  String get formattedAmount {
    final prefix = isCredit ? '+' : '-';
    return '$prefix\$${amount.abs().toStringAsFixed(2)}';
  }
}

@collection
class BankAccountIsar {
  Id id = Isar.autoIncrement;

  late String accountId;
  late String bankName;
  late String accountName;
  late String accountNumber;
  late String accountType;
  late double currentBalance;
  late DateTime? lastSyncDate;
  late DateTime createdAt;
  late DateTime updatedAt;
  late int version;
  late bool isDeleted;

  String get maskedAccountNumber {
    if (accountNumber.length <= 4) return accountNumber;
    return '****${accountNumber.substring(accountNumber.length - 4)}';
  }
}

@collection
class ImportBatchIsar {
  Id id = Isar.autoIncrement;

  late String batchId;
  late String bankAccountId;
  late String fileName;
  late DateTime importDate;
  late int totalTransactions;
  late int reconciledTransactions;
  late int pendingTransactions;
  late DateTime? startDate;
  late DateTime? endDate;
  late DateTime createdAt;
  late DateTime updatedAt;
  late int version;
  late bool isDeleted;

  double get reconciliationProgress {
    if (totalTransactions == 0) return 0.0;
    return (reconciledTransactions / totalTransactions) * 100;
  }

  bool get isFullyReconciled => reconciliationProgress >= 100.0;
}

enum TransactionType {
  credit,
  debit,
}

enum ReconciliationStatus {
  pending,
  matched,
  reconciled,
  ignored,
}

extension TransactionTypeExtension on TransactionType {
  String get displayName {
    switch (this) {
      case TransactionType.credit:
        return 'Credit';
      case TransactionType.debit:
        return 'Debit';
    }
  }
}

extension ReconciliationStatusExtension on ReconciliationStatus {
  String get displayName {
    switch (this) {
      case ReconciliationStatus.pending:
        return 'Pending';
      case ReconciliationStatus.matched:
        return 'Matched';
      case ReconciliationStatus.reconciled:
        return 'Reconciled';
      case ReconciliationStatus.ignored:
        return 'Ignored';
    }
  }

  String get icon {
    switch (this) {
      case ReconciliationStatus.pending:
        return '⏳';
      case ReconciliationStatus.matched:
        return '🔄';
      case ReconciliationStatus.reconciled:
        return '✅';
      case ReconciliationStatus.ignored:
        return '🚫';
    }
  }
}
