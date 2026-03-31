import 'package:isar/isar.dart';

import '../../data/models/bill_reminder_isar.dart';
import '../../../../core/database/isar_service.dart';

abstract class BillReminderRepository {
  Future<List<BillReminderIsar>> getAllBills();
  Future<List<BillReminderIsar>> getPendingBills();
  Future<List<BillReminderIsar>> getOverdueBills();
  Future<List<BillReminderIsar>> getDueSoonBills();
  Future<BillReminderIsar?> getBillById(String billId);
  Future<void> addBill(BillReminderIsar bill);
  Future<void> updateBill(BillReminderIsar bill);
  Future<void> deleteBill(String billId);
  Future<void> markBillAsPaid(String billId);
  Future<void> markBillAsOverdue(String billId);
  Future<List<BillReminderIsar>> getBillsByCategory(String categoryId);
  Future<List<BillReminderIsar>> getBillsByDateRange(DateTime start, DateTime end);
}

class BillReminderRepositoryImpl implements BillReminderRepository {
  final IsarService _isarService;

  BillReminderRepositoryImpl(this._isarService);

  Future<List<BillReminderIsar>> _activeBills() async {
    final bills = await _isarService.isar.billReminderIsars.where().findAll();
    final activeBills = bills.where((bill) => !bill.isDeleted).toList()
      ..sort((a, b) => a.dueDate.compareTo(b.dueDate));
    return activeBills;
  }

  @override
  Future<List<BillReminderIsar>> getAllBills() async {
    return _activeBills();
  }

  @override
  Future<List<BillReminderIsar>> getPendingBills() async {
    final bills = await _activeBills();
    return bills.where((bill) => bill.status == BillStatus.pending).toList();
  }

  @override
  Future<List<BillReminderIsar>> getOverdueBills() async {
    final bills = await _activeBills();
    return bills.where((bill) => bill.status == BillStatus.pending && bill.isOverdue).toList();
  }

  @override
  Future<List<BillReminderIsar>> getDueSoonBills() async {
    final bills = await _activeBills();
    return bills.where((bill) => bill.status == BillStatus.pending && bill.isDueSoon).toList();
  }

  @override
  Future<BillReminderIsar?> getBillById(String billId) async {
    final bills = await _activeBills();
    try {
      return bills.firstWhere((bill) => bill.billId == billId);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> addBill(BillReminderIsar bill) async {
    final isar = _isarService.isar;
    await isar.writeTxn(() async {
      await isar.billReminderIsars.put(bill);
    });
  }

  @override
  Future<void> updateBill(BillReminderIsar bill) async {
    final isar = _isarService.isar;
    bill.updatedAt = DateTime.now();
    bill.version++;
    await isar.writeTxn(() async {
      await isar.billReminderIsars.put(bill);
    });
  }

  @override
  Future<void> deleteBill(String billId) async {
    final isar = _isarService.isar;
    await isar.writeTxn(() async {
      final bill = await getBillById(billId);
      if (bill != null) {
        bill.isDeleted = true;
        bill.updatedAt = DateTime.now();
        bill.version++;
        await isar.billReminderIsars.put(bill);
      }
    });
  }

  @override
  Future<void> markBillAsPaid(String billId) async {
    final isar = _isarService.isar;
    await isar.writeTxn(() async {
      final bill = await getBillById(billId);
      if (bill != null) {
        bill.status = BillStatus.paid;
        bill.updatedAt = DateTime.now();
        bill.version++;
        
        // Create next bill if recurring
        if (bill.isRecurring) {
          final nextDueDate = bill.frequency.getNextDueDate(bill.dueDate);
          if (nextDueDate != null) {
            final nextBill = BillReminderIsar()
              ..billId = DateTime.now().millisecondsSinceEpoch.toString()
              ..title = bill.title
              ..amount = bill.amount
              ..categoryId = bill.categoryId
              ..dueDate = nextDueDate
              ..reminderDate = bill.reminderDate != null 
                  ? nextDueDate.subtract(Duration(days: bill.dueDate.difference(bill.reminderDate!).inDays))
                  : null
              ..frequency = bill.frequency
              ..status = BillStatus.pending
              ..isRecurring = bill.isRecurring
              ..notes = bill.notes
              ..createdAt = DateTime.now()
              ..updatedAt = DateTime.now()
              ..version = 1
              ..isDeleted = false;
            
            await isar.billReminderIsars.put(nextBill);
          }
        }
        
        await isar.billReminderIsars.put(bill);
      }
    });
  }

  @override
  Future<void> markBillAsOverdue(String billId) async {
    final isar = _isarService.isar;
    await isar.writeTxn(() async {
      final bill = await getBillById(billId);
      if (bill != null && bill.isOverdue) {
        bill.status = BillStatus.overdue;
        bill.updatedAt = DateTime.now();
        bill.version++;
        await isar.billReminderIsars.put(bill);
      }
    });
  }

  @override
  Future<List<BillReminderIsar>> getBillsByCategory(String categoryId) async {
    final bills = await _activeBills();
    return bills.where((bill) => bill.categoryId == categoryId).toList();
  }

  @override
  Future<List<BillReminderIsar>> getBillsByDateRange(DateTime start, DateTime end) async {
    final bills = await _activeBills();
    return bills
        .where(
          (bill) =>
              !bill.dueDate.isBefore(start) &&
              !bill.dueDate.isAfter(end),
        )
        .toList();
  }
}
