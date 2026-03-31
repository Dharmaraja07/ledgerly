import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import '../../data/models/bill_reminder_isar.dart';
import '../bloc/bill_reminder_bloc.dart';
import '../../../../core/theme/app_theme.dart';

class AddBillBottomSheet extends StatefulWidget {
  const AddBillBottomSheet({super.key});

  @override
  State<AddBillBottomSheet> createState() => _AddBillBottomSheetState();
}

class _AddBillBottomSheetState extends State<AddBillBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _notesController = TextEditingController();
  
  DateTime _dueDate = DateTime.now().add(const Duration(days: 7));
  DateTime? _reminderDate;
  BillFrequency _frequency = BillFrequency.oneTime;
  bool _isRecurring = false;
  String _selectedCategory = 'Uncategorized';

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTitleField(),
                    const SizedBox(height: 20),
                    _buildAmountField(),
                    const SizedBox(height: 20),
                    _buildCategoryField(),
                    const SizedBox(height: 20),
                    _buildDateFields(),
                    const SizedBox(height: 20),
                    _buildRecurringSection(),
                    const SizedBox(height: 20),
                    _buildNotesField(),
                    const SizedBox(height: 30),
                    _buildSaveButton(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close, color: Colors.white),
          ),
          const Spacer(),
          const Text(
            'Add New Bill',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          const SizedBox(width: 48), // Balance the close button
        ],
      ),
    );
  }

  Widget _buildTitleField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Bill Title',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _titleController,
          decoration: InputDecoration(
            hintText: 'Enter bill title',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            prefixIcon: const Icon(Icons.title),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Please enter a bill title';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildAmountField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Amount',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _amountController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: '0.00',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            prefixIcon: const Icon(Icons.attach_money),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Please enter an amount';
            }
            if (double.tryParse(value) == null) {
              return 'Please enter a valid amount';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildCategoryField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Category',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: _selectedCategory,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            prefixIcon: const Icon(Icons.category),
          ),
          items: const [
            'Uncategorized',
            'Utilities',
            'Rent/Mortgage',
            'Insurance',
            'Loan Payment',
            'Subscription',
            'Credit Card',
            'Phone/Internet',
            'Groceries',
            'Transportation',
            'Healthcare',
            'Entertainment',
            'Other',
          ].map((category) {
            return DropdownMenuItem(
              value: category,
              child: Text(category),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _selectedCategory = value!;
            });
          },
        ),
      ],
    );
  }

  Widget _buildDateFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Due Date',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: _selectDueDate,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.calendar_today),
                const SizedBox(width: 12),
                Text(
                  _formatDate(_dueDate),
                  style: const TextStyle(fontSize: 16),
                ),
                const Spacer(),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Reminder Date (Optional)',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: _selectReminderDate,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.notifications),
                const SizedBox(width: 12),
                Text(
                  _reminderDate != null ? _formatDate(_reminderDate!) : 'No reminder set',
                  style: const TextStyle(fontSize: 16),
                ),
                const Spacer(),
                if (_reminderDate != null)
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _reminderDate = null;
                      });
                    },
                    icon: const Icon(Icons.clear),
                  ),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRecurringSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Checkbox(
              value: _isRecurring,
              onChanged: (value) {
                setState(() {
                  _isRecurring = value!;
                });
              },
            ),
            const Text(
              'Recurring Bill',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        if (_isRecurring) ...[
          const SizedBox(height: 12),
          DropdownButtonFormField<BillFrequency>(
            value: _frequency,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              prefixIcon: const Icon(Icons.repeat),
            ),
            items: BillFrequency.values.map((frequency) {
              return DropdownMenuItem(
                value: frequency,
                child: Text(frequency.displayName),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _frequency = value!;
              });
            },
          ),
        ],
      ],
    );
  }

  Widget _buildNotesField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Notes (Optional)',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _notesController,
          maxLines: 3,
          decoration: InputDecoration(
            hintText: 'Add any additional notes...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            prefixIcon: const Icon(Icons.note),
          ),
        ),
      ],
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _saveBill,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.primaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'Save Bill',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Future<void> _selectDueDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _dueDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
    );
    if (date != null) {
      setState(() {
        _dueDate = date;
      });
    }
  }

  Future<void> _selectReminderDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _reminderDate ?? _dueDate.subtract(const Duration(days: 3)),
      firstDate: DateTime.now(),
      lastDate: _dueDate,
    );
    if (date != null) {
      setState(() {
        _reminderDate = date;
      });
    }
  }

  void _saveBill() {
    if (_formKey.currentState!.validate()) {
      final bill = BillReminderIsar()
        ..billId = const Uuid().v4()
        ..title = _titleController.text.trim()
        ..amount = double.parse(_amountController.text)
        ..categoryId = _selectedCategory
        ..dueDate = _dueDate
        ..reminderDate = _reminderDate
        ..frequency = _frequency
        ..status = BillStatus.pending
        ..isRecurring = _isRecurring
        ..notes = _notesController.text.trim().isEmpty ? null : _notesController.text.trim()
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now()
        ..version = 1
        ..isDeleted = false;

      context.read<BillReminderBloc>().add(AddBill(bill));
      Navigator.pop(context);
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
