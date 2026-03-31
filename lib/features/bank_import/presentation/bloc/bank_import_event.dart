part of 'bank_import_bloc.dart';

abstract class BankImportEvent extends Equatable {
  const BankImportEvent();

  @override
  List<Object?> get props => [];
}

class PickStatementFile extends BankImportEvent {
  const PickStatementFile();
}

class ImportStatement extends BankImportEvent {
  const ImportStatement(this.filePath, this.bankAccountId);

  final String filePath;
  final String bankAccountId;

  @override
  List<Object> get props => [filePath, bankAccountId];
}

class LoadImportBatches extends BankImportEvent {
  const LoadImportBatches();
}

class LoadPendingTransactions extends BankImportEvent {
  const LoadPendingTransactions(this.batchId);

  final String batchId;

  @override
  List<Object> get props => [batchId];
}

class ReconcileTransaction extends BankImportEvent {
  const ReconcileTransaction(
    this.transactionId,
    this.expenseId,
    this.incomeId, {
    this.batchId,
  });

  final String transactionId;
  final String? expenseId;
  final String? incomeId;
  /// When set, pending rows reload after reconcile even if [BankImportState.currentBatch] is null.
  final String? batchId;

  @override
  List<Object?> get props => [transactionId, expenseId, incomeId, batchId];
}

class IgnoreTransaction extends BankImportEvent {
  const IgnoreTransaction(this.transactionId, {this.batchId});

  final String transactionId;
  final String? batchId;

  @override
  List<Object?> get props => [transactionId, batchId];
}

class LoadBankAccounts extends BankImportEvent {
  const LoadBankAccounts();
}

class AddBankAccount extends BankImportEvent {
  const AddBankAccount(this.account);

  final BankAccountIsar account;

  @override
  List<Object> get props => [account];
}

class SelectBankAccount extends BankImportEvent {
  const SelectBankAccount(this.account);

  final BankAccountIsar? account;

  @override
  List<Object?> get props => [account];
}
