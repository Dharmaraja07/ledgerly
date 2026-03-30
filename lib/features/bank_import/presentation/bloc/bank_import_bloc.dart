import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/bank_transaction_isar.dart';
import '../../data/repositories/bank_import_repository.dart';

part 'bank_import_event.dart';
part 'bank_import_state.dart';

class BankImportBloc extends Bloc<BankImportEvent, BankImportState> {
  final BankImportRepository _repository;

  BankImportBloc(this._repository) : super(const BankImportState()) {
    on<PickStatementFile>((event, emit) async {
      await _onPickStatementFile(emit);
    });
    
    on<ImportStatement>((event, emit) async {
      await _onImportStatement(event.filePath, event.bankAccountId, emit);
    });
    
    on<LoadImportBatches>((event, emit) async {
      await _onLoadImportBatches(emit);
    });
    
    on<LoadPendingTransactions>((event, emit) async {
      await _onLoadPendingTransactions(event.batchId, emit);
    });
    
    on<ReconcileTransaction>((event, emit) async {
      await _onReconcileTransaction(
        event.transactionId,
        event.expenseId,
        event.incomeId,
        event.batchId,
        emit,
      );
    });
    
    on<IgnoreTransaction>((event, emit) async {
      await _onIgnoreTransaction(event.transactionId, event.batchId, emit);
    });
    
    on<LoadBankAccounts>((event, emit) async {
      await _onLoadBankAccounts(emit);
    });
    
    on<AddBankAccount>((event, emit) async {
      await _onAddBankAccount(event.account, emit);
    });
    
    on<SelectBankAccount>((event, emit) async {
      await _onSelectBankAccount(event.account, emit);
    });
  }

  Future<void> _onPickStatementFile(Emitter<BankImportState> emit) async {
    emit(state.copyWith(status: BankImportStatus.loading));
    try {
      final files = await _repository.pickStatementFile();
      emit(state.copyWith(
        status: BankImportStatus.success,
        selectedFiles: files,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: BankImportStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onImportStatement(String filePath, String bankAccountId, Emitter<BankImportState> emit) async {
    emit(state.copyWith(status: BankImportStatus.loading));
    try {
      final batch = await _repository.importStatement(filePath, bankAccountId);
      emit(state.copyWith(
        status: BankImportStatus.imported,
        currentBatch: batch,
      ));
      
      // Load batches after successful import
      add(LoadImportBatches());
    } catch (e) {
      emit(state.copyWith(
        status: BankImportStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onLoadImportBatches(Emitter<BankImportState> emit) async {
    emit(state.copyWith(status: BankImportStatus.loading));
    try {
      final batches = await _repository.getImportBatches();
      emit(state.copyWith(
        status: BankImportStatus.success,
        importBatches: batches,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: BankImportStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onLoadPendingTransactions(String batchId, Emitter<BankImportState> emit) async {
    emit(state.copyWith(status: BankImportStatus.loading));
    try {
      final transactions = await _repository.getPendingTransactions(batchId);
      emit(state.copyWith(
        status: BankImportStatus.success,
        pendingTransactions: transactions,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: BankImportStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onReconcileTransaction(
    String transactionId,
    String? expenseId,
    String? incomeId,
    String? batchId,
    Emitter<BankImportState> emit,
  ) async {
    emit(state.copyWith(status: BankImportStatus.loading));
    try {
      await _repository.reconcileTransaction(transactionId, expenseId, incomeId);
      emit(state.copyWith(status: BankImportStatus.reconciled));
      
      final reloadBatchId = batchId ?? state.currentBatch?.batchId;
      if (reloadBatchId != null) {
        add(LoadPendingTransactions(reloadBatchId));
      }
    } catch (e) {
      emit(state.copyWith(
        status: BankImportStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onIgnoreTransaction(
    String transactionId,
    String? batchId,
    Emitter<BankImportState> emit,
  ) async {
    emit(state.copyWith(status: BankImportStatus.loading));
    try {
      await _repository.ignoreTransaction(transactionId);
      emit(state.copyWith(status: BankImportStatus.ignored));
      
      final reloadBatchId = batchId ?? state.currentBatch?.batchId;
      if (reloadBatchId != null) {
        add(LoadPendingTransactions(reloadBatchId));
      }
    } catch (e) {
      emit(state.copyWith(
        status: BankImportStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onLoadBankAccounts(Emitter<BankImportState> emit) async {
    emit(state.copyWith(status: BankImportStatus.loading));
    try {
      final accounts = await _repository.getBankAccounts();
      emit(state.copyWith(
        status: BankImportStatus.success,
        bankAccounts: accounts,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: BankImportStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onAddBankAccount(BankAccountIsar account, Emitter<BankImportState> emit) async {
    emit(state.copyWith(status: BankImportStatus.loading));
    try {
      await _repository.addBankAccount(account);
      emit(state.copyWith(status: BankImportStatus.accountAdded));
      
      // Reload accounts
      add(LoadBankAccounts());
    } catch (e) {
      emit(state.copyWith(
        status: BankImportStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onSelectBankAccount(BankAccountIsar? account, Emitter<BankImportState> emit) async {
    emit(state.copyWith(selectedBankAccount: account));
  }
}

enum BankImportStatus {
  initial,
  loading,
  success,
  error,
  imported,
  reconciled,
  ignored,
  accountAdded,
}

class BankImportState extends Equatable {
  const BankImportState({
    this.status = BankImportStatus.initial,
    this.selectedFiles = const [],
    this.importBatches = const [],
    this.pendingTransactions = const [],
    this.bankAccounts = const [],
    this.selectedBankAccount,
    this.currentBatch,
    this.errorMessage,
  });

  final BankImportStatus status;
  final List<String> selectedFiles;
  final List<ImportBatchIsar> importBatches;
  final List<BankTransactionIsar> pendingTransactions;
  final List<BankAccountIsar> bankAccounts;
  final BankAccountIsar? selectedBankAccount;
  final ImportBatchIsar? currentBatch;
  final String? errorMessage;

  BankImportState copyWith({
    BankImportStatus? status,
    List<String>? selectedFiles,
    List<ImportBatchIsar>? importBatches,
    List<BankTransactionIsar>? pendingTransactions,
    List<BankAccountIsar>? bankAccounts,
    BankAccountIsar? selectedBankAccount,
    ImportBatchIsar? currentBatch,
    String? errorMessage,
  }) {
    return BankImportState(
      status: status ?? this.status,
      selectedFiles: selectedFiles ?? this.selectedFiles,
      importBatches: importBatches ?? this.importBatches,
      pendingTransactions: pendingTransactions ?? this.pendingTransactions,
      bankAccounts: bankAccounts ?? this.bankAccounts,
      selectedBankAccount: selectedBankAccount ?? this.selectedBankAccount,
      currentBatch: currentBatch ?? this.currentBatch,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        selectedFiles,
        importBatches,
        pendingTransactions,
        bankAccounts,
        selectedBankAccount,
        currentBatch,
        errorMessage,
      ];
}
