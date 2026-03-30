part of 'bill_reminder_bloc.dart';

enum BillReminderStatus { initial, loading, success, failure }

enum BillFilter { all, pending, overdue, dueSoon, paid }

class BillReminderState extends Equatable {
  final BillReminderStatus status;
  final List<BillReminderIsar> bills;
  final List<BillReminderIsar> overdueBills;
  final List<BillReminderIsar> dueSoonBills;
  final List<BillReminderIsar> filteredBills;
  final BillFilter filter;
  final String? errorMessage;

  const BillReminderState({
    this.status = BillReminderStatus.initial,
    this.bills = const [],
    this.overdueBills = const [],
    this.dueSoonBills = const [],
    this.filteredBills = const [],
    this.filter = BillFilter.all,
    this.errorMessage,
  });

  BillReminderState copyWith({
    BillReminderStatus? status,
    List<BillReminderIsar>? bills,
    List<BillReminderIsar>? overdueBills,
    List<BillReminderIsar>? dueSoonBills,
    List<BillReminderIsar>? filteredBills,
    BillFilter? filter,
    String? errorMessage,
  }) {
    return BillReminderState(
      status: status ?? this.status,
      bills: bills ?? this.bills,
      overdueBills: overdueBills ?? this.overdueBills,
      dueSoonBills: dueSoonBills ?? this.dueSoonBills,
      filteredBills: filteredBills ?? this.filteredBills,
      filter: filter ?? this.filter,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        bills,
        overdueBills,
        dueSoonBills,
        filteredBills,
        filter,
        errorMessage,
      ];

  double get totalPendingAmount {
    return bills
        .where((bill) => bill.status == BillStatus.pending)
        .fold(0.0, (sum, bill) => sum + bill.amount);
  }

  double get totalOverdueAmount {
    return overdueBills.fold(0.0, (sum, bill) => sum + bill.amount);
  }

  int get pendingBillCount {
    return bills.where((bill) => bill.status == BillStatus.pending).length;
  }

  int get overdueBillCount {
    return overdueBills.length;
  }

  int get dueSoonBillCount {
    return dueSoonBills.length;
  }
}
