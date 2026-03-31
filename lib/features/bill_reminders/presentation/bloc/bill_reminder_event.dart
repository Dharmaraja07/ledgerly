part of 'bill_reminder_bloc.dart';

abstract class BillReminderEvent extends Equatable {
  const BillReminderEvent();

  @override
  List<Object> get props => [];
}

class LoadBills extends BillReminderEvent {
  const LoadBills();
}

class AddBill extends BillReminderEvent {
  final BillReminderIsar bill;

  const AddBill(this.bill);

  @override
  List<Object> get props => [bill];
}

class UpdateBill extends BillReminderEvent {
  final BillReminderIsar bill;

  const UpdateBill(this.bill);

  @override
  List<Object> get props => [bill];
}

class DeleteBill extends BillReminderEvent {
  final String billId;

  const DeleteBill(this.billId);

  @override
  List<Object> get props => [billId];
}

class MarkBillAsPaid extends BillReminderEvent {
  final String billId;

  const MarkBillAsPaid(this.billId);

  @override
  List<Object> get props => [billId];
}

class MarkBillAsOverdue extends BillReminderEvent {
  final String billId;

  const MarkBillAsOverdue(this.billId);

  @override
  List<Object> get props => [billId];
}

class FilterBills extends BillReminderEvent {
  final BillFilter filter;

  const FilterBills(this.filter);

  @override
  List<Object> get props => [filter];
}

class RefreshBills extends BillReminderEvent {
  const RefreshBills();
}
