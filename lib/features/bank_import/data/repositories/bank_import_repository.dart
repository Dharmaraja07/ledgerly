import 'dart:io';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:isar/isar.dart';
import 'package:path/path.dart' as path;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/bank_transaction_isar.dart';
import '../services/bank_rule_engine.dart';
import '../../../../core/database/isar_service.dart';

class BankImportRepository {
  final IsarService _isarService;
  final SharedPreferences _prefs;

  BankImportRepository(this._isarService, this._prefs);

  Future<List<String>> pickStatementFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['csv', 'qfx', 'ofx', 'txt'],
        allowMultiple: false,
      );

      if (result != null && result.files.single.path != null) {
        return [result.files.single.path!];
      }
      return [];
    } catch (e) {
      throw Exception('Failed to pick file: $e');
    }
  }

  Future<ImportBatchIsar> importStatement(String filePath, String bankAccountId) async {
    try {
      final file = File(filePath);
      if (!await file.exists()) {
        throw Exception('File not found: $filePath');
      }

      final extension = path.extension(filePath).toLowerCase();
      final transactions = await _parseStatementFile(file, extension);

      final rules = BankRuleEngine.loadRules(_prefs);
      BankRuleEngine.applyRules(rules, transactions, bankAccountId);

      final batch = ImportBatchIsar()
        ..batchId = DateTime.now().millisecondsSinceEpoch.toString()
        ..bankAccountId = bankAccountId
        ..fileName = path.basename(filePath)
        ..importDate = DateTime.now()
        ..totalTransactions = transactions.length
        ..reconciledTransactions = 0
        ..pendingTransactions = transactions.length
        ..startDate = transactions.isNotEmpty ? transactions.first.transactionDate : null
        ..endDate = transactions.isNotEmpty ? transactions.last.transactionDate : null
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now()
        ..version = 1
        ..isDeleted = false;

      await _isarService.writeTransaction(() async {
        await _isarService.isar.importBatchIsars.put(batch);
        
        for (final transaction in transactions) {
          transaction.importBatchId = batch.batchId;
          transaction.transactionId = DateTime.now().millisecondsSinceEpoch.toString() + 
                                     DateTime.now().microsecond.toString();
          transaction.createdAt = DateTime.now();
          transaction.updatedAt = DateTime.now();
          transaction.version = 1;
          transaction.isDeleted = false;
          transaction.reconciliationStatus = ReconciliationStatus.pending;
        }
        
        await _isarService.isar.bankTransactionIsars.putAll(transactions);
      });

      return batch;
    } catch (e) {
      throw Exception('Failed to import statement: $e');
    }
  }

  Future<List<BankTransactionIsar>> _parseStatementFile(File file, String extension) async {
    final content = await file.readAsString();
    
    switch (extension) {
      case '.csv':
        return _parseCSV(content);
      case '.qfx':
      case '.ofx':
        return _parseOFX(content);
      case '.txt':
        return _parseTXT(content);
      default:
        throw Exception('Unsupported file format: $extension');
    }
  }

  List<BankTransactionIsar> _parseCSV(String content) {
    final rows = const CsvToListConverter().convert(content);
    final transactions = <BankTransactionIsar>[];
    
    for (int i = 1; i < rows.length; i++) {
      final row = rows[i];
      if (row.length < 3) continue;
      
      try {
        final transaction = BankTransactionIsar();
        final parsedAmount = double.tryParse(row[1]?.toString() ?? '') ?? 0.0;
        transaction.description = row[0]?.toString() ?? '';
        transaction.amount = parsedAmount;
        transaction.transactionDate = _parseDate(row[2]?.toString() ?? '');
        transaction.type = parsedAmount >= 0 ? TransactionType.credit : TransactionType.debit;
        transaction.bankAccountId = ''; // Will be set during import
        transaction.referenceNumber = row.length > 3 ? row[3]?.toString() : null;
        transaction.merchantName = row.length > 4 ? row[4]?.toString() : null;
        transaction.category = row.length > 5 ? row[5]?.toString() : null;
        
        transactions.add(transaction);
      } catch (e) {
        // Skip invalid rows
        continue;
      }
    }
    
    return transactions;
  }

  List<BankTransactionIsar> _parseOFX(String content) {
    // Basic OFX parsing - would need to be enhanced for full OFX support
    final transactions = <BankTransactionIsar>[];
    final lines = content.split('\n');
    
    String? currentDescription;
    double? currentAmount;
    DateTime? currentDate;
    
    for (final line in lines) {
      if (line.startsWith('<MEMO>')) {
        currentDescription = line.substring(6);
      } else if (line.startsWith('<TRNAMT>')) {
        currentAmount = double.tryParse(line.substring(8));
      } else if (line.startsWith('<DTPOSTED>')) {
        final dateStr = line.substring(10);
        currentDate = _parseOFXDate(dateStr);
      } else if (line.startsWith('</STMTTRN>') && 
                 currentDescription != null && 
                 currentAmount != null && 
                 currentDate != null) {
        final transaction = BankTransactionIsar()
          ..description = currentDescription
          ..amount = currentAmount.abs()
          ..transactionDate = currentDate
          ..type = currentAmount >= 0 ? TransactionType.credit : TransactionType.debit
          ..bankAccountId = '';
        
        transactions.add(transaction);
        
        currentDescription = null;
        currentAmount = null;
        currentDate = null;
      }
    }
    
    return transactions;
  }

  List<BankTransactionIsar> _parseTXT(String content) {
    // Basic text parsing - would need to be enhanced for different bank formats
    final lines = content.split('\n');
    final transactions = <BankTransactionIsar>[];
    
    for (final line in lines) {
      if (line.trim().isEmpty) continue;
      
      // Try to extract date, description, and amount
      final parts = line.split(RegExp(r'\s{2,}'));
      if (parts.length >= 3) {
        try {
          final dateStr = parts[0];
          final description = parts[1];
          final amountStr = parts[2];
          
          final transaction = BankTransactionIsar()
            ..description = description
            ..amount = double.tryParse(amountStr.replaceAll(RegExp(r'[^\d.-]'), '')) ?? 0.0
            ..transactionDate = _parseDate(dateStr)
            ..type = amountStr.contains('-') ? TransactionType.debit : TransactionType.credit
            ..bankAccountId = '';
          
          transactions.add(transaction);
        } catch (e) {
          continue;
        }
      }
    }
    
    return transactions;
  }

  DateTime _parseDate(String dateStr) {
    final formats = ['MM/dd/yyyy', 'MM/dd/yy', 'yyyy-MM-dd', 'dd/MM/yyyy', 'dd-MM-yyyy'];

    for (final _ in formats) {
      try {
        return DateTime.parse(dateStr);
      } catch (e) {
        try {
          final parts = dateStr.split('/');
          if (parts.length == 3) {
            final month = int.parse(parts[0]);
            final day = int.parse(parts[1]);
            final year = int.parse(parts[2].length == 2 ? '20${parts[2]}' : parts[2]);
            return DateTime(year, month, day);
          }
        } catch (e) {
          continue;
        }
      }
    }
    
    return DateTime.now();
  }

  DateTime _parseOFXDate(String dateStr) {
    // OFX format: YYYYMMDDHHMMSS
    if (dateStr.length >= 8) {
      try {
        final year = int.parse(dateStr.substring(0, 4));
        final month = int.parse(dateStr.substring(4, 6));
        final day = int.parse(dateStr.substring(6, 8));
        return DateTime(year, month, day);
      } catch (e) {
        return DateTime.now();
      }
    }
    return DateTime.now();
  }

  Future<List<BankTransactionIsar>> _allTransactions() async {
    final transactions = await _isarService.isar.bankTransactionIsars.where().findAll();
    return transactions.where((transaction) => !transaction.isDeleted).toList();
  }

  Future<List<ImportBatchIsar>> _allBatches() async {
    final batches = await _isarService.isar.importBatchIsars.where().findAll();
    final activeBatches = batches.where((batch) => !batch.isDeleted).toList()
      ..sort((a, b) => b.importDate.compareTo(a.importDate));
    return activeBatches;
  }

  Future<List<BankAccountIsar>> _allAccounts() async {
    final accounts = await _isarService.isar.bankAccountIsars.where().findAll();
    return accounts.where((account) => !account.isDeleted).toList();
  }

  Future<List<BankTransactionIsar>> getPendingTransactions(String batchId) async {
    final transactions = await _allTransactions();
    return transactions
        .where(
          (transaction) =>
              transaction.importBatchId == batchId &&
              transaction.reconciliationStatus == ReconciliationStatus.pending,
        )
        .toList()
      ..sort((a, b) => b.transactionDate.compareTo(a.transactionDate));
  }

  Future<List<ImportBatchIsar>> getImportBatches() async {
    return _allBatches();
  }

  Future<void> reconcileTransaction(String transactionId, String? matchedExpenseId, String? matchedIncomeId) async {
    await _isarService.writeTransaction(() async {
      final transaction = (await _allTransactions())
          .where((item) => item.transactionId == transactionId)
          .cast<BankTransactionIsar?>()
          .firstOrNull;
      
      if (transaction != null) {
        transaction.reconciliationStatus = ReconciliationStatus.reconciled;
        transaction.matchedExpenseId = matchedExpenseId;
        transaction.matchedIncomeId = matchedIncomeId;
        transaction.updatedAt = DateTime.now();
        transaction.version++;
        
        await _isarService.isar.bankTransactionIsars.put(transaction);
        
        // Update batch counts
        await _updateBatchCounts(transaction.importBatchId);
      }
    });
  }

  Future<void> ignoreTransaction(String transactionId) async {
    await _isarService.writeTransaction(() async {
      final transaction = (await _allTransactions())
          .where((item) => item.transactionId == transactionId)
          .cast<BankTransactionIsar?>()
          .firstOrNull;
      
      if (transaction != null) {
        transaction.reconciliationStatus = ReconciliationStatus.ignored;
        transaction.updatedAt = DateTime.now();
        transaction.version++;
        
        await _isarService.isar.bankTransactionIsars.put(transaction);
        
        // Update batch counts
        await _updateBatchCounts(transaction.importBatchId);
      }
    });
  }

  Future<void> _updateBatchCounts(String batchId) async {
    final transactions = (await _allTransactions())
        .where((item) => item.importBatchId == batchId)
        .toList();
    final batch = (await _allBatches())
        .where((item) => item.batchId == batchId)
        .cast<ImportBatchIsar?>()
        .firstOrNull;
    
    if (batch != null) {
      batch.reconciledTransactions = transactions
          .where((t) => t.reconciliationStatus == ReconciliationStatus.reconciled)
          .length;
      batch.pendingTransactions = transactions
          .where((t) => t.reconciliationStatus == ReconciliationStatus.pending)
          .length;
      batch.updatedAt = DateTime.now();
      batch.version++;
      
      await _isarService.isar.importBatchIsars.put(batch);
    }
  }

  Future<List<BankAccountIsar>> getBankAccounts() async {
    return _allAccounts();
  }

  Future<void> addBankAccount(BankAccountIsar account) async {
    account.createdAt = DateTime.now();
    account.updatedAt = DateTime.now();
    account.version = 1;
    account.isDeleted = false;
    
    await _isarService.writeTransaction(() async {
      await _isarService.isar.bankAccountIsars.put(account);
    });
  }
}
