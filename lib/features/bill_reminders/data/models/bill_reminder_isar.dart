import 'package:isar/isar.dart';

part 'bill_reminder_isar.g.dart';

@collection
class BillReminderIsar {
  Id id = Isar.autoIncrement;

  late String billId;
  late String title;
  late double amount;
  late String categoryId;
  late DateTime dueDate;
  late DateTime? reminderDate;
  @enumerated
  late BillFrequency frequency;
  @enumerated
  late BillStatus status;
  late bool isRecurring;
  late String? notes;
  late DateTime createdAt;
  late DateTime updatedAt;
  late int version;
  late bool isDeleted;

  bool get isOverdue {
    final now = DateTime.now();
    return status == BillStatus.pending && dueDate.isBefore(now);
  }

  bool get isDueSoon {
    final now = DateTime.now();
    final dueSoonThreshold = now.add(const Duration(days: 3));
    return status == BillStatus.pending && 
           dueDate.isAfter(now) && 
           dueDate.isBefore(dueSoonThreshold);
  }

  int get daysUntilDue {
    final now = DateTime.now();
    return dueDate.difference(now).inDays;
  }
}

enum BillFrequency {
  oneTime,
  weekly,
  biWeekly,
  monthly,
  quarterly,
  semiAnnually,
  annually,
}

enum BillStatus {
  pending,
  paid,
  overdue,
  cancelled,
}

extension BillFrequencyExtension on BillFrequency {
  DateTime? getNextDueDate(DateTime currentDueDate) {
    switch (this) {
      case BillFrequency.oneTime:
        return null;
      case BillFrequency.weekly:
        return currentDueDate.add(const Duration(days: 7));
      case BillFrequency.biWeekly:
        return currentDueDate.add(const Duration(days: 14));
      case BillFrequency.monthly:
        return DateTime(
          currentDueDate.year,
          currentDueDate.month + 1,
          currentDueDate.day,
        );
      case BillFrequency.quarterly:
        return DateTime(
          currentDueDate.year,
          currentDueDate.month + 3,
          currentDueDate.day,
        );
      case BillFrequency.semiAnnually:
        return DateTime(
          currentDueDate.year,
          currentDueDate.month + 6,
          currentDueDate.day,
        );
      case BillFrequency.annually:
        return DateTime(
          currentDueDate.year + 1,
          currentDueDate.month,
          currentDueDate.day,
        );
    }
  }

  String get displayName {
    switch (this) {
      case BillFrequency.oneTime:
        return 'One Time';
      case BillFrequency.weekly:
        return 'Weekly';
      case BillFrequency.biWeekly:
        return 'Bi-Weekly';
      case BillFrequency.monthly:
        return 'Monthly';
      case BillFrequency.quarterly:
        return 'Quarterly';
      case BillFrequency.semiAnnually:
        return 'Semi-Annually';
      case BillFrequency.annually:
        return 'Annually';
    }
  }
}

extension BillStatusExtension on BillStatus {
  String get displayName {
    switch (this) {
      case BillStatus.pending:
        return 'Pending';
      case BillStatus.paid:
        return 'Paid';
      case BillStatus.overdue:
        return 'Overdue';
      case BillStatus.cancelled:
        return 'Cancelled';
    }
  }

  String get emoji {
    switch (this) {
      case BillStatus.pending:
        return '⏰';
      case BillStatus.paid:
        return '✅';
      case BillStatus.overdue:
        return '⚠️';
      case BillStatus.cancelled:
        return '❌';
    }
  }
}
