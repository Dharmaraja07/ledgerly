import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import '../../data/models/debt_isar.dart';
import '../bloc/debt_planner_bloc.dart';
import '../../../../core/theme/app_theme.dart';

class AddDebtBottomSheet extends StatefulWidget {
  const AddDebtBottomSheet({super.key});

  @override
  State<AddDebtBottomSheet> createState() => _AddDebtBottomSheetState();
}

class _AddDebtBottomSheetState extends State<AddDebtBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _creditorController = TextEditingController();
  final _accountController = TextEditingController();
  final _initialAmountController = TextEditingController();
  final _currentBalanceController = TextEditingController();
  final _interestRateController = TextEditingController();
  final _minimumPaymentController = TextEditingController();
  final _notesController = TextEditingController();
  
  DateTime _startDate = DateTime.now().subtract(const Duration(days: 30));
  DateTime? _targetPayoffDate;
  DebtType _type = DebtType.creditCard;
  DebtPayoffStrategy _strategy = DebtPayoffStrategy.snowball;

  @override
  void dispose() {
    _titleController.dispose();
    _creditorController.dispose();
    _accountController.dispose();
    _initialAmountController.dispose();
    _currentBalanceController.dispose();
    _interestRateController.dispose();
    _minimumPaymentController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.95,
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
                    _buildBasicInfoSection(),
                    const SizedBox(height: 20),
                    _buildFinancialDetailsSection(),
                    const SizedBox(height: 20),
                    _buildDatesSection(),
                    const SizedBox(height: 20),
                    _buildStrategySection(),
                    const SizedBox(height: 20),
                    _buildNotesSection(),
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
            'Add New Debt',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          const SizedBox(width: 48),
        ],
      ),
    );
  }

  Widget _buildBasicInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Basic Information',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _titleController,
          decoration: InputDecoration(
            hintText: 'e.g., Chase Credit Card',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            prefixIcon: const Icon(Icons.title),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Please enter a debt title';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<DebtType>(
          value: _type,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            prefixIcon: Text(_type.icon, style: const TextStyle(fontSize: 20)),
          ),
          items: DebtType.values.map((type) {
            return DropdownMenuItem(
              value: type,
              child: Row(
                children: [
                  Text(type.icon),
                  const SizedBox(width: 8),
                  Text(type.displayName),
                ],
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _type = value!;
            });
          },
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _creditorController,
          decoration: InputDecoration(
            hintText: 'e.g., Chase Bank',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            prefixIcon: const Icon(Icons.business),
          ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _accountController,
          decoration: InputDecoration(
            hintText: 'Last 4 digits',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            prefixIcon: const Icon(Icons.credit_card),
          ),
        ),
      ],
    );
  }

  Widget _buildFinancialDetailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Financial Details',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _initialAmountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '0.00',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.account_balance),
                  labelText: 'Initial Amount',
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Required';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Invalid amount';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TextFormField(
                controller: _currentBalanceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '0.00',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.money),
                  labelText: 'Current Balance',
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Required';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Invalid amount';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _interestRateController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '0.0',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.percent),
                  labelText: 'Interest Rate (%)',
                  suffixText: '%',
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Required';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Invalid rate';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TextFormField(
                controller: _minimumPaymentController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '0.00',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.payment),
                  labelText: 'Min. Payment',
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Required';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Invalid amount';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDatesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Important Dates',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        InkWell(
          onTap: _selectStartDate,
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
                  'Start Date: ${_formatDate(_startDate)}',
                  style: const TextStyle(fontSize: 16),
                ),
                const Spacer(),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        InkWell(
          onTap: _selectTargetPayoffDate,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.flag),
                const SizedBox(width: 12),
                Text(
                  _targetPayoffDate != null 
                      ? 'Target Payoff: ${_formatDate(_targetPayoffDate!)}'
                      : 'No target payoff date',
                  style: const TextStyle(fontSize: 16),
                ),
                const Spacer(),
                if (_targetPayoffDate != null)
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _targetPayoffDate = null;
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

  Widget _buildStrategySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Payoff Strategy',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<DebtPayoffStrategy>(
          value: _strategy,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            prefixIcon: const Icon(Icons.lightbulb),
          ),
          items: DebtPayoffStrategy.values.map((strategy) {
            return DropdownMenuItem(
              value: strategy,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(strategy.displayName),
                  Text(
                    strategy.description,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _strategy = value!;
            });
          },
        ),
      ],
    );
  }

  Widget _buildNotesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Notes (Optional)',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _notesController,
          maxLines: 3,
          decoration: InputDecoration(
            hintText: 'Add any additional notes about this debt...',
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
        onPressed: _saveDebt,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.primaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'Save Debt',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Future<void> _selectStartDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _startDate,
      firstDate: DateTime.now().subtract(const Duration(days: 365 * 10)),
      lastDate: DateTime.now(),
    );
    if (date != null) {
      setState(() {
        _startDate = date;
      });
    }
  }

  Future<void> _selectTargetPayoffDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _targetPayoffDate ?? DateTime.now().add(const Duration(days: 365)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 30)),
    );
    if (date != null) {
      setState(() {
        _targetPayoffDate = date;
      });
    }
  }

  void _saveDebt() {
    if (_formKey.currentState!.validate()) {
      final debt = DebtIsar()
        ..debtId = const Uuid().v4()
        ..title = _titleController.text.trim()
        ..type = _type
        ..strategy = _strategy
        ..creditorName = _creditorController.text.trim().isEmpty ? null : _creditorController.text.trim()
        ..accountNumber = _accountController.text.trim().isEmpty ? null : _accountController.text.trim()
        ..initialAmount = double.parse(_initialAmountController.text)
        ..currentBalance = double.parse(_currentBalanceController.text)
        ..interestRate = double.parse(_interestRateController.text)
        ..minimumPayment = double.parse(_minimumPaymentController.text)
        ..startDate = _startDate
        ..targetPayoffDate = _targetPayoffDate
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now()
        ..version = 1
        ..isDeleted = false;

      context.read<DebtPlannerBloc>().add(AddDebt(debt));
      Navigator.pop(context);
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
