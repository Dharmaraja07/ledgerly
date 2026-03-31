import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../settings/presentation/bloc/settings_bloc.dart';
import '../bloc/export_bloc.dart';
import '../bloc/export_event.dart';
import '../bloc/export_state.dart';

class ExportPage extends StatefulWidget {
  const ExportPage({super.key});

  @override
  State<ExportPage> createState() => _ExportPageState();
}

class _ExportPageState extends State<ExportPage> {
  String _selectedFormat = 'CSV';
  String _selectedRange = 'All Time';

  @override
  Widget build(BuildContext context) {
    final currency = context.select<SettingsBloc, String>((bloc) => bloc.state.currency);

    return BlocProvider(
      create: (_) => getIt<ExportBloc>(),
      child: BlocConsumer<ExportBloc, ExportState>(
        listener: (context, state) {
          if (state is ExportSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Completed successfully: ${state.path}'),
                backgroundColor: AppColors.success,
              ),
            );
          } else if (state is ExportError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: AppColors.error,
              ),
            );
          }
        },
        builder: (context, state) {
          final loading = state is ExportLoading;

          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: AppBar(
              title: Text(
                'Export & Backup',
                style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
              ),
              elevation: 0,
            ),
            body: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Text(
                  'Reports',
                  style: GoogleFonts.outfit(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 12),
                _buildDropdown(
                  value: _selectedRange,
                  items: const ['Current Month', 'Last 3 Months', 'This Year', 'All Time'],
                  onChanged: (value) => setState(() => _selectedRange = value!),
                  context: context,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    _buildFormatCard('CSV', Icons.table_chart_outlined, context),
                    const SizedBox(width: 16),
                    _buildFormatCard('PDF', Icons.picture_as_pdf_outlined, context),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Local reporting',
                        style: GoogleFonts.outfit(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Create $currency-ready reports for tax, review, or archival workflows. Files are saved directly on this device.',
                        style: GoogleFonts.outfit(
                          color: AppColors.textSecondary,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: ElevatedButton(
                          onPressed: loading
                              ? null
                              : () {
                                  context.read<ExportBloc>().add(
                                        ExportToCsv('default', format: _selectedFormat),
                                      );
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: loading
                              ? const CircularProgressIndicator(color: Colors.black)
                              : Text(
                                  'Export $_selectedFormat',
                                  style: GoogleFonts.outfit(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                Text(
                  'Backups',
                  style: GoogleFonts.outfit(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.surfaceHighlight),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Full local snapshot',
                        style: GoogleFonts.outfit(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Capture categories, budgets, records, planner data, and settings in one JSON backup. You can also restore the latest snapshot later.',
                        style: GoogleFonts.outfit(
                          color: AppColors.textSecondary,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: loading
                                  ? null
                                  : () {
                                      context.read<ExportBloc>().add(ExportBackupRequested());
                                    },
                              icon: const Icon(Icons.save_alt_outlined),
                              label: const Text('Create Backup'),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: AppColors.primary,
                                side: const BorderSide(color: AppColors.primary),
                                padding: const EdgeInsets.symmetric(vertical: 14),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: FilledButton.icon(
                              onPressed: loading
                                  ? null
                                  : () {
                                      context.read<ExportBloc>().add(
                                            RestoreLatestBackupRequested(),
                                          );
                                    },
                              icon: const Icon(Icons.restore_outlined),
                              label: const Text('Restore Latest'),
                              style: FilledButton.styleFrom(
                                backgroundColor: AppColors.accent,
                                foregroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(vertical: 14),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildDropdown({
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
    required BuildContext context,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).inputDecorationTheme.fillColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          dropdownColor: Theme.of(context).cardTheme.color,
          icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.textSecondary),
          items: items.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item, style: GoogleFonts.outfit()),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildFormatCard(String format, IconData icon, BuildContext context) {
    final isSelected = _selectedFormat == format;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedFormat = format),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.primary.withValues(alpha: 0.12)
                : Theme.of(context).cardTheme.color,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected ? AppColors.primary : Colors.transparent,
              width: 2,
            ),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                color: isSelected ? AppColors.primary : AppColors.textSecondary,
                size: 32,
              ),
              const SizedBox(height: 8),
              Text(
                format,
                style: GoogleFonts.outfit(
                  color: isSelected ? AppColors.textPrimary : AppColors.textSecondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
