import 'package:flutter/material.dart';

import '../../../domain/entitities/Expense.dart';

Future<Map<String, dynamic>?> showAddExpenseSheet(
  BuildContext context,
  List<String> categories,
) {
  final title = TextEditingController();
  final amount = TextEditingController();

  List<String> uniqueCategories = categories.toSet().toList();
  String selectedCategory = uniqueCategories.contains('General') ? 'General' : (uniqueCategories.isNotEmpty ? uniqueCategories.first : 'General');
  
  if (uniqueCategories.isEmpty) uniqueCategories = ['General'];
  
  TransactionType selectedType = TransactionType.expense;

  return showModalBottomSheet<Map<String, dynamic>>(
    context: context,
    isScrollControlled: true,
    builder: (_) => StatefulBuilder(
      builder: (context, setState) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Add Transaction',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              
              // Type Toggle
              SegmentedButton<TransactionType>(
                segments: const [
                  ButtonSegment(value: TransactionType.expense, label: Text('Expense'), icon: Icon(Icons.outbound)),
                  ButtonSegment(value: TransactionType.income, label: Text('Income'), icon: Icon(Icons.attach_money)),
                  ButtonSegment(value: TransactionType.transfer, label: Text('Transfer'), icon: Icon(Icons.swap_horiz)),
                ],
                selected: {selectedType},
                onSelectionChanged: (Set<TransactionType> newSelection) {
                   setState(() {
                     selectedType = newSelection.first;
                   });
                },
              ),

              const SizedBox(height: 12),

              TextField(
                controller: title,
                decoration: const InputDecoration(labelText: 'Title'),
              ),

              const SizedBox(height: 12),

              TextField(
                controller: amount,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Amount'),
              ),

              const SizedBox(height: 12),

              DropdownButtonFormField<String>(
                initialValue: selectedCategory,
                items: uniqueCategories.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
                onChanged: (v) => setState(() => selectedCategory = v!),
                decoration: const InputDecoration(labelText: 'Category'),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  if (title.text.isNotEmpty && amount.text.isNotEmpty) {
                    Navigator.pop(context, {
                      'title': title.text,
                      'amount': double.parse(amount.text),
                      'category': selectedCategory,
                      'type': selectedType,
                    });
                  }
                },
                child: const Text('Add'),
              ),

              const SizedBox(height: 20),
            ],
          ),
        );
      }
    ),
  );
}
