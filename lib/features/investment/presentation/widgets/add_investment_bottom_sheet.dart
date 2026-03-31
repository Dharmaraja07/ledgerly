import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import '../../data/models/investment_isar.dart';
import '../bloc/investment_bloc.dart';
import '../../../../core/theme/app_theme.dart';

class AddInvestmentBottomSheet extends StatefulWidget {
  final String portfolioId;

  const AddInvestmentBottomSheet({
    super.key,
    required this.portfolioId,
  });

  @override
  State<AddInvestmentBottomSheet> createState() => _AddInvestmentBottomSheetState();
}

class _AddInvestmentBottomSheetState extends State<AddInvestmentBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _symbolController = TextEditingController();
  final _sharesController = TextEditingController();
  final _avgCostController = TextEditingController();
  final _currentPriceController = TextEditingController();
  final _brokerController = TextEditingController();
  final _sectorController = TextEditingController();
  final _regionController = TextEditingController();
  final _dividendController = TextEditingController();
  final _expenseController = TextEditingController();
  
  DateTime _purchaseDate = DateTime.now().subtract(const Duration(days: 30));
  InvestmentType _type = InvestmentType.stock;

  @override
  void dispose() {
    _nameController.dispose();
    _symbolController.dispose();
    _sharesController.dispose();
    _avgCostController.dispose();
    _currentPriceController.dispose();
    _brokerController.dispose();
    _sectorController.dispose();
    _regionController.dispose();
    _dividendController.dispose();
    _expenseController.dispose();
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
                    _buildInvestmentDetailsSection(),
                    const SizedBox(height: 20),
                    _buildPricingSection(),
                    const SizedBox(height: 20),
                    _buildAdditionalInfoSection(),
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
            'Add Investment',
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
          controller: _nameController,
          decoration: InputDecoration(
            hintText: 'e.g., Apple Inc.',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            prefixIcon: const Icon(Icons.business),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Please enter investment name';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _symbolController,
          decoration: InputDecoration(
            hintText: 'e.g., AAPL',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            prefixIcon: const Icon(Icons.code),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Please enter symbol';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<InvestmentType>(
          value: _type,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            prefixIcon: Text(_type.icon, style: const TextStyle(fontSize: 20)),
          ),
          items: InvestmentType.values.map((type) {
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
      ],
    );
  }

  Widget _buildInvestmentDetailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Investment Details',
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
                controller: _sharesController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '0.00',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.pie_chart),
                  labelText: 'Shares Owned',
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Required';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Invalid number';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: InkWell(
                onTap: _selectPurchaseDate,
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
                        'Purchase: ${_formatDate(_purchaseDate)}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPricingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Pricing Information',
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
                controller: _avgCostController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '0.00',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.attach_money),
                  labelText: 'Avg Cost/Share',
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
                controller: _currentPriceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '0.00',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.trending_up),
                  labelText: 'Current Price',
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

  Widget _buildAdditionalInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Additional Information (Optional)',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _brokerController,
          decoration: InputDecoration(
            hintText: 'e.g., Robinhood, Fidelity',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            prefixIcon: const Icon(Icons.account_balance),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _sectorController,
                decoration: InputDecoration(
                  hintText: 'e.g., Technology',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.category),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TextFormField(
                controller: _regionController,
                decoration: InputDecoration(
                  hintText: 'e.g., US',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.public),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _dividendController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '0.0',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.percent),
                  labelText: 'Dividend Yield (%)',
                  suffixText: '%',
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TextFormField(
                controller: _expenseController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '0.0',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.money_off),
                  labelText: 'Expense Ratio (%)',
                  suffixText: '%',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _saveInvestment,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.primaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'Save Investment',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Future<void> _selectPurchaseDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _purchaseDate,
      firstDate: DateTime.now().subtract(const Duration(days: 365 * 50)),
      lastDate: DateTime.now(),
    );
    if (date != null) {
      setState(() {
        _purchaseDate = date;
      });
    }
  }

  void _saveInvestment() {
    if (_formKey.currentState!.validate()) {
      final investment = InvestmentIsar()
        ..investmentId = const Uuid().v4()
        ..portfolioId = widget.portfolioId
        ..name = _nameController.text.trim()
        ..symbol = _symbolController.text.trim().toUpperCase()
        ..type = _type
        ..sharesOwned = double.parse(_sharesController.text)
        ..averageCostPerShare = double.parse(_avgCostController.text)
        ..currentPricePerShare = double.parse(_currentPriceController.text)
        ..purchaseDate = _purchaseDate
        ..lastUpdated = DateTime.now()
        ..broker = _brokerController.text.trim().isEmpty ? null : _brokerController.text.trim()
        ..sector = _sectorController.text.trim().isEmpty ? null : _sectorController.text.trim()
        ..region = _regionController.text.trim().isEmpty ? null : _regionController.text.trim()
        ..dividendYield = _dividendController.text.trim().isEmpty ? null : double.tryParse(_dividendController.text)
        ..expenseRatio = _expenseController.text.trim().isEmpty ? null : double.tryParse(_expenseController.text)
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now()
        ..version = 1
        ..isDeleted = false;

      context.read<InvestmentBloc>().add(AddInvestment(investment));
      Navigator.pop(context);
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
