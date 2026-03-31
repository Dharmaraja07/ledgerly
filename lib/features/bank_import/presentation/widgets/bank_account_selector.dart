import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/bank_transaction_isar.dart';
import '../bloc/bank_import_bloc.dart';

class BankAccountSelector extends StatelessWidget {
  const BankAccountSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BankImportBloc, BankImportState>(
      builder: (context, state) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Bank Account',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 12),
                
                InputDecorator(
                  decoration: const InputDecoration(
                    hintText: 'Select bank account',
                    prefixIcon: Icon(Icons.account_balance),
                    border: OutlineInputBorder(),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<BankAccountIsar>(
                      isExpanded: true,
                      value: state.selectedBankAccount,
                      hint: const Text('Select bank account'),
                      items: state.bankAccounts.map((account) {
                        return DropdownMenuItem(
                          value: account,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '${account.bankName} - ${account.accountName}',
                                style: const TextStyle(fontWeight: FontWeight.w500),
                              ),
                              Text(
                                account.maskedAccountNumber,
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (account) {
                        context.read<BankImportBloc>().add(SelectBankAccount(account));
                      },
                    ),
                  ),
                ),
                
                const SizedBox(height: 12),
                
                TextButton.icon(
                  onPressed: () => _showAddAccountDialog(context),
                  icon: const Icon(Icons.add),
                  label: const Text('Add New Account'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showAddAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AddBankAccountDialog(),
    );
  }
}

class AddBankAccountDialog extends StatefulWidget {
  const AddBankAccountDialog({super.key});

  @override
  State<AddBankAccountDialog> createState() => _AddBankAccountDialogState();
}

class _AddBankAccountDialogState extends State<AddBankAccountDialog> {
  final _formKey = GlobalKey<FormState>();
  final _bankNameController = TextEditingController();
  final _accountNameController = TextEditingController();
  final _accountNumberController = TextEditingController();
  String _accountType = '';
  double _currentBalance = 0.0;

  @override
  void dispose() {
    _bankNameController.dispose();
    _accountNameController.dispose();
    _accountNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Bank Account'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _bankNameController,
                decoration: const InputDecoration(
                  labelText: 'Bank Name',
                  prefixIcon: Icon(Icons.account_balance),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter bank name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              
              TextFormField(
                controller: _accountNameController,
                decoration: const InputDecoration(
                  labelText: 'Account Name',
                  prefixIcon: Icon(Icons.label),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter account name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              
              TextFormField(
                controller: _accountNumberController,
                decoration: const InputDecoration(
                  labelText: 'Account Number',
                  prefixIcon: Icon(Icons.numbers),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter account number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              
              InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Account Type',
                  prefixIcon: Icon(Icons.category),
                  border: OutlineInputBorder(),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: _accountType.isEmpty ? null : _accountType,
                    hint: const Text('Select type'),
                    items: const [
                      DropdownMenuItem(value: 'Checking', child: Text('Checking')),
                      DropdownMenuItem(value: 'Savings', child: Text('Savings')),
                      DropdownMenuItem(value: 'Credit Card', child: Text('Credit Card')),
                      DropdownMenuItem(value: 'Investment', child: Text('Investment')),
                      DropdownMenuItem(value: 'Other', child: Text('Other')),
                    ],
                    onChanged: (value) {
                      setState(() => _accountType = value ?? '');
                    },
                  ),
                ),
              ),
              const SizedBox(height: 12),
              
              TextFormField(
                controller: TextEditingController(text: _currentBalance.toString()),
                decoration: const InputDecoration(
                  labelText: 'Current Balance',
                  prefixIcon: Icon(Icons.account_balance_wallet),
                  prefixText: '\$',
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter current balance';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid amount';
                  }
                  return null;
                },
                onSaved: (value) {
                  _currentBalance = double.tryParse(value ?? '') ?? 0.0;
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_accountType.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please select account type')),
              );
              return;
            }
            if (_formKey.currentState?.validate() ?? false) {
              _formKey.currentState?.save();
              
              final account = BankAccountIsar()
                ..accountId = DateTime.now().millisecondsSinceEpoch.toString()
                ..bankName = _bankNameController.text
                ..accountName = _accountNameController.text
                ..accountNumber = _accountNumberController.text
                ..accountType = _accountType
                ..currentBalance = _currentBalance;
              
              context.read<BankImportBloc>().add(AddBankAccount(account));
              Navigator.of(context).pop();
            }
          },
          child: const Text('Add Account'),
        ),
      ],
    );
  }
}
