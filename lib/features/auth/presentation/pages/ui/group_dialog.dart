import 'package:flutter/material.dart';

Future<String?> showGroupDialog(
  BuildContext context, {
  String? initialName,
}) {
  final controller = TextEditingController(text: initialName);

  return showDialog<String>(
    context: context,
    builder: (_) => AlertDialog(
      title: Text(initialName == null ? 'Create Group' : 'Rename Group'),
      content: TextField(
        controller: controller,
        decoration: const InputDecoration(labelText: 'Group name'),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (controller.text.isNotEmpty) {
              Navigator.pop(context, controller.text);
            }
          },
          child: const Text('Save'),
        ),
      ],
    ),
  );
}
