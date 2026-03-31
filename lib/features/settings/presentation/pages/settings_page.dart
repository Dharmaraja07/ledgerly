import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_event.dart';
import '../../../collaboration/presentation/pages/collaboration_hub_page.dart';
import '../../../export/presentation/pages/export_page.dart';
import '../bloc/settings_bloc.dart';
import '../bloc/settings_event.dart';
import '../bloc/settings_state.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    super.initState();
    context.read<SettingsBloc>().add(SettingsLoadRequested());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        final isDarkMode = state.themeMode == ThemeMode.dark;

        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            title: Text(
              'Settings',
              style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
            ),
            elevation: 0,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ProfileCard(
                  name: state.profileName,
                  email: state.profileEmail,
                  onEdit: () => _showProfileDialog(context, state),
                ),
                const SizedBox(height: 24),
                _SectionTitle('Preferences'),
                _SettingTile(
                  icon: Icons.dark_mode_outlined,
                  title: 'Dark mode',
                  subtitle: 'Choose the look that fits your workflow',
                  trailing: Switch.adaptive(
                    value: isDarkMode,
                    onChanged: (value) {
                      context.read<SettingsBloc>().add(
                            SettingsThemeChanged(
                              value ? ThemeMode.dark : ThemeMode.light,
                            ),
                          );
                    },
                    activeTrackColor: AppColors.primary,
                  ),
                ),
                _SettingTile(
                  icon: Icons.notifications_none_outlined,
                  title: 'Local reminders',
                  subtitle: 'Only on-device alerts. No cloud notifications.',
                  trailing: Switch.adaptive(
                    value: state.areNotificationsEnabled,
                    onChanged: (value) {
                      context.read<SettingsBloc>().add(
                            SettingsNotificationsToggled(value),
                          );
                    },
                    activeTrackColor: AppColors.primary,
                  ),
                ),
                _SettingTile(
                  icon: Icons.currency_exchange_outlined,
                  title: 'Currency',
                  subtitle: 'Used across dashboards, reports, and budgets',
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        state.currency,
                        style: GoogleFonts.outfit(
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Icon(Icons.chevron_right, color: AppColors.textSecondary),
                    ],
                  ),
                  onTap: () => _showCurrencyPicker(context, state.currency),
                ),
                const SizedBox(height: 24),
                _SectionTitle('Privacy & Security'),
                _SettingTile(
                  icon: Icons.fingerprint,
                  title: 'Biometric lock',
                  subtitle: 'Protect your local vault when supported on this device',
                  trailing: Switch.adaptive(
                    value: state.isBiometricEnabled,
                    onChanged: (value) {
                      context.read<SettingsBloc>().add(
                            SettingsBiometricToggled(value),
                          );
                    },
                    activeTrackColor: AppColors.primary,
                  ),
                ),
                _SettingTile(
                  icon: Icons.groups_outlined,
                  title: 'Encrypted collaboration',
                  subtitle: 'Share an AES-256 encrypted snapshot with an advisor',
                  trailing: const Icon(Icons.chevron_right, color: AppColors.textSecondary),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CollaborationHubPage(groupId: 'default'),
                      ),
                    );
                  },
                ),
                const _InfoCard(
                  title: 'Offline-first vault',
                  description:
                      'Ledgerly stores your wallet, categories, budgets, and exports on this device using a local database. No internet is required for everyday use.',
                  icon: Icons.shield_outlined,
                ),
                const SizedBox(height: 24),
                _SectionTitle('Data'),
                _SettingTile(
                  icon: Icons.folder_open_outlined,
                  title: 'Local database',
                  subtitle: 'Your data lives on-device and works without a server',
                ),
                _SettingTile(
                  icon: Icons.file_download_outlined,
                  title: 'Export records',
                  subtitle: 'Generate CSV or PDF snapshots locally',
                  trailing: const Icon(Icons.chevron_right, color: AppColors.textSecondary),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ExportPage()),
                    );
                  },
                ),
                const SizedBox(height: 24),
                _SectionTitle('About'),
                const _InfoCard(
                  title: 'Ledgerly 1.0',
                  description:
                      'A personal finance workspace for tracking expenses, income, categories, budgets, analytics, and exports from one local-first app.',
                  icon: Icons.account_balance_wallet_outlined,
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: TextButton.icon(
                    onPressed: () {
                      context.read<AuthBloc>().add(LogoutRequested());
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: AppColors.error.withValues(alpha: 0.12),
                      foregroundColor: AppColors.error,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    icon: const Icon(Icons.logout),
                    label: Text(
                      'Sign Out',
                      style: GoogleFonts.outfit(fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showCurrencyPicker(BuildContext context, String currentCurrency) {
    const currencies = ['USD', 'INR', 'EUR', 'GBP', 'AED'];

    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Theme.of(context).bottomSheetTheme.backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Select Currency',
                style: GoogleFonts.outfit(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              ...currencies.map(
                (currency) => ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  title: Text(currency, style: GoogleFonts.outfit()),
                  trailing: currentCurrency == currency
                      ? const Icon(Icons.check, color: AppColors.primary)
                      : null,
                  onTap: () {
                    context.read<SettingsBloc>().add(
                          SettingsCurrencyChanged(currency),
                        );
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showProfileDialog(BuildContext context, SettingsState state) {
    final nameController = TextEditingController(text: state.profileName);
    final emailController = TextEditingController(text: state.profileEmail);

    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(
            'Edit Local Profile',
            style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                final profileName = nameController.text.trim();
                final profileEmail = emailController.text.trim().toLowerCase();
                if (profileName.isEmpty || profileEmail.isEmpty) {
                  return;
                }

                context.read<SettingsBloc>().add(
                      SettingsProfileUpdated(
                        profileName: profileName,
                        profileEmail: profileEmail,
                      ),
                    );
                Navigator.pop(dialogContext);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

class _ProfileCard extends StatelessWidget {
  final String name;
  final String email;
  final VoidCallback onEdit;

  const _ProfileCard({
    required this.name,
    required this.email,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.black.withValues(alpha: 0.12),
            child: Text(
              name.isNotEmpty ? name[0].toUpperCase() : 'L',
              style: GoogleFonts.outfit(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.outfit(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: GoogleFonts.outfit(
                    color: Colors.black.withValues(alpha: 0.72),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Local-only workspace',
                  style: GoogleFonts.outfit(
                    color: Colors.black.withValues(alpha: 0.72),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onEdit,
            icon: const Icon(Icons.edit_outlined, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title.toUpperCase(),
        style: GoogleFonts.outfit(
          color: AppColors.textSecondary,
          fontWeight: FontWeight.w800,
          letterSpacing: 1.2,
          fontSize: 12,
        ),
      ),
    );
  }
}

class _SettingTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  const _SettingTile({
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppColors.primary),
        ),
        title: Text(
          title,
          style: GoogleFonts.outfit(fontWeight: FontWeight.w700),
        ),
        subtitle: subtitle == null
            ? null
            : Text(
                subtitle!,
                style: GoogleFonts.outfit(color: AppColors.textSecondary),
              ),
        trailing: trailing,
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const _InfoCard({
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.surfaceHighlight),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppColors.primary),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.outfit(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: GoogleFonts.outfit(
                    color: AppColors.textSecondary,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
