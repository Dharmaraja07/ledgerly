import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../features/auth/data/models/user_isar.dart';
import '../../features/group/data/models/group_isar.dart';
import '../../features/expense/data/models/expense_isar.dart';
import '../../features/budget/data/models/budget_isar.dart';
import '../../features/category/data/models/category_isar.dart';
import '../sync/sync_queue_isar.dart';
import '../../features/bill_reminders/data/models/bill_reminder_isar.dart';
import '../../features/debt_planner/data/models/debt_isar.dart';
import '../../features/investment/data/models/investment_isar.dart';
import '../../features/document_vault/data/models/document_isar.dart';
import '../../features/bank_import/data/models/bank_transaction_isar.dart';
import '../../features/receipt_ocr/data/models/receipt_extraction_isar.dart';

class IsarService {
  late final Isar isar;

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();

    isar = await Isar.open(
      [
        UserIsarSchema,
        GroupIsarSchema,
        ExpenseIsarSchema,
        BudgetIsarSchema,
        CategoryIsarSchema,
        SyncQueueIsarSchema,
        BillReminderIsarSchema,
        DebtIsarSchema,
        InvestmentIsarSchema,
        InvestmentPortfolioIsarSchema,
        DocumentIsarSchema,
        BankTransactionIsarSchema,
        BankAccountIsarSchema,
        ImportBatchIsarSchema,
        ReceiptExtractionIsarSchema,
      ],
      directory: dir.path,
    );
  }

  Future<void> writeTransaction(Future<void> Function() operation) async {
    await isar.writeTxn(operation);
  }
}
