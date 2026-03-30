import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bank_import_bloc.dart';

class FilePickerWidget extends StatelessWidget {
  const FilePickerWidget({super.key});

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
                  'Select Statement File',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 12),
                
                const Text(
                  'Supported formats: CSV, QFX, OFX, TXT',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                
                const SizedBox(height: 16),
                
                if (state.selectedFiles.isEmpty)
                  OutlinedButton.icon(
                    onPressed: () {
                      context.read<BankImportBloc>().add(const PickStatementFile());
                    },
                    icon: const Icon(Icons.file_upload),
                    label: const Text('Choose File'),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48),
                    ),
                  )
                else
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.blue.shade200),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.description, color: Colors.blue.shade700),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    state.selectedFiles.first.split('/').last,
                                    style: TextStyle(
                                      color: Colors.blue.shade700,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              state.selectedFiles.first,
                              style: TextStyle(
                                color: Colors.blue.shade600,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      OutlinedButton.icon(
                        onPressed: () {
                          context.read<BankImportBloc>().add(const PickStatementFile());
                        },
                        icon: const Icon(Icons.refresh),
                        label: const Text('Choose Different File'),
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 48),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
