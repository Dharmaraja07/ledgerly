import 'package:flutter/material.dart';

Future<Map<String, dynamic>?> showAddExpenseSheet(
  BuildContext context,
) {
  final title = TextEditingController();
  final amount = TextEditingController();

  String selectedCategory = 'General';
  final categories = ['General', 'Food', 'Transport', 'Rent', 'Entertainment', 'Health', 'Shopping'];

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
              const Text('Add Expense',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                value: selectedCategory,
                items: categories.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
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
