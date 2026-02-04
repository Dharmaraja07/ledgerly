import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../auth/presentation/pages/ui/group_dialog.dart';
import '../../../../expense/presentation/pages/ui/expense_list_page.dart';
import '../../bloc/group_bloc.dart';
import '../../bloc/group_event.dart';
import '../../bloc/group_state.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/ui/premium_card.dart';

class GroupListPage extends StatelessWidget {
  const GroupListPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<GroupBloc>().add(LoadGroups());

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Your Groups',
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {}, // Add settings later
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final name = await showGroupDialog(context);
          if (name != null) {
            context.read<GroupBloc>().add(CreateGroup(name));
          }
        },
        icon: const Icon(Icons.add_circle_outline),
        label: const Text('New Group'),
        elevation: 10,
        backgroundColor: AppColors.primary,
      ).animate().scale(delay: 500.ms, curve: Curves.elasticOut),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.background,
              Color(0xFF0F1218), // Slightly lighter bottom
            ],
          ),
        ),
        child: BlocBuilder<GroupBloc, GroupState>(
          builder: (context, state) {
            if (state is GroupLoaded) {
              if (state.groups.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.group_off_outlined, size: 80, color: AppColors.textSecondary.withValues(alpha: 0.5)),
                      const SizedBox(height: 16),
                      Text(
                        'No groups yet',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.textSecondary),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Create one to start tracking!',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ).animate().fadeIn(duration: 600.ms),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.only(top: 100, bottom: 80), // Space for AppBar & FAB
                itemCount: state.groups.length,
                itemBuilder: (_, i) {
                  final g = state.groups[i];
                  return PremiumCard(
                    delay: Duration(milliseconds: 50 * i),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ExpenseListPage(groupId: g.id),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
                          ),
                          child: Center(
                            child: Text(
                              g.name.isNotEmpty ? g.name[0].toUpperCase() : '?',
                              style: const TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                g.name,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textPrimary,
                                    ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Tap to view details',
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: AppColors.textSecondary,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete_outline, color: AppColors.error),
                          onPressed: () {
                             // Confirm delete? For now just calling bloc
                             context.read<GroupBloc>().add(DeleteGroup(g.id));
                          },
                        ),
                         const Icon(Icons.chevron_right, color: AppColors.textSecondary),
                      ],
                    ),
                  );
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
