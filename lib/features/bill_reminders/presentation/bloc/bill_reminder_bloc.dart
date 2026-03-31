import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/bill_reminder_isar.dart';
import '../../data/repositories/bill_reminder_repository.dart';

part 'bill_reminder_event.dart';
part 'bill_reminder_state.dart';

class BillReminderBloc extends Bloc<BillReminderEvent, BillReminderState> {
  final BillReminderRepository _repository;

  BillReminderBloc(this._repository) : super(const BillReminderState()) {
    on<LoadBills>(_onLoadBills);
    on<AddBill>(_onAddBill);
    on<UpdateBill>(_onUpdateBill);
    on<DeleteBill>(_onDeleteBill);
    on<MarkBillAsPaid>(_onMarkBillAsPaid);
    on<MarkBillAsOverdue>(_onMarkBillAsOverdue);
    on<FilterBills>(_onFilterBills);
    on<RefreshBills>(_onRefreshBills);
  }

  Future<void> _onLoadBills(LoadBills event, Emitter<BillReminderState> emit) async {
    emit(state.copyWith(status: BillReminderStatus.loading));
    try {
      final bills = await _repository.getAllBills();
      final overdueBills = await _repository.getOverdueBills();
      final dueSoonBills = await _repository.getDueSoonBills();
      
      emit(state.copyWith(
        status: BillReminderStatus.success,
        bills: bills,
        overdueBills: overdueBills,
        dueSoonBills: dueSoonBills,
        filteredBills: bills,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: BillReminderStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onAddBill(AddBill event, Emitter<BillReminderState> emit) async {
    try {
      await _repository.addBill(event.bill);
      add(const LoadBills());
    } catch (e) {
      emit(state.copyWith(
        status: BillReminderStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onUpdateBill(UpdateBill event, Emitter<BillReminderState> emit) async {
    try {
      await _repository.updateBill(event.bill);
      add(const LoadBills());
    } catch (e) {
      emit(state.copyWith(
        status: BillReminderStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onDeleteBill(DeleteBill event, Emitter<BillReminderState> emit) async {
    try {
      await _repository.deleteBill(event.billId);
      add(const LoadBills());
    } catch (e) {
      emit(state.copyWith(
        status: BillReminderStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onMarkBillAsPaid(MarkBillAsPaid event, Emitter<BillReminderState> emit) async {
    try {
      await _repository.markBillAsPaid(event.billId);
      add(const LoadBills());
    } catch (e) {
      emit(state.copyWith(
        status: BillReminderStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onMarkBillAsOverdue(MarkBillAsOverdue event, Emitter<BillReminderState> emit) async {
    try {
      await _repository.markBillAsOverdue(event.billId);
      add(const LoadBills());
    } catch (e) {
      emit(state.copyWith(
        status: BillReminderStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onFilterBills(FilterBills event, Emitter<BillReminderState> emit) async {
    List<BillReminderIsar> filteredBills;

    switch (event.filter) {
      case BillFilter.all:
        filteredBills = state.bills;
        break;
      case BillFilter.pending:
        filteredBills = state.bills.where((bill) => bill.status == BillStatus.pending).toList();
        break;
      case BillFilter.overdue:
        filteredBills = state.overdueBills;
        break;
      case BillFilter.dueSoon:
        filteredBills = state.dueSoonBills;
        break;
      case BillFilter.paid:
        filteredBills = state.bills.where((bill) => bill.status == BillStatus.paid).toList();
        break;
    }

    emit(state.copyWith(
      filter: event.filter,
      filteredBills: filteredBills,
    ));
  }

  Future<void> _onRefreshBills(RefreshBills event, Emitter<BillReminderState> emit) async {
    add(const LoadBills());
  }
}
