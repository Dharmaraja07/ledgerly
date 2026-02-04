import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/security/biometric_service.dart';
import '../../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../../auth/presentation/bloc/auth_event.dart';
import '../../../../auth/presentation/bloc/auth_state.dart';
import 'package:get_it/get_it.dart';

class BiometricLockPage extends StatefulWidget {
  const BiometricLockPage({super.key});

  @override
  State<BiometricLockPage> createState() => _BiometricLockPageState();
}

class _BiometricLockPageState extends State<BiometricLockPage> {
  @override
  void initState() {
    super.initState();
    _triggerAuth();
  }

  Future<void> _triggerAuth() async {
    final service = GetIt.instance<BiometricService>();
    final authenticated = await service.authenticate();
    
    if (authenticated && mounted) {
      final state = context.read<AuthBloc>().state;
      if (state is AuthBiometricRequired) {
        context.read<AuthBloc>().add(BiometricAuthSuccess(state.user));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
         decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
               Color(0xFF0F1218),
              Color(0xFF000000),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(32),
                 decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.2),
                        blurRadius: 50,
                        spreadRadius: 2,
                      )
                    ]
                  ),
                child: const Icon(
                  Icons.lock_outline_rounded,
                  size: 64,
                  color: AppColors.primary,
                ),
              ).animate().scale(duration: 500.ms, curve: Curves.easeOutBack),
              
              const SizedBox(height: 32),
              
              Text(
                'Ledgerly Locked',
                style: GoogleFonts.outfit(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ).animate().fadeIn(delay: 200.ms),
              
              const SizedBox(height: 16),
              
              TextButton.icon(
                onPressed: _triggerAuth,
                icon: const Icon(Icons.fingerprint, color: AppColors.primary),
                label: Text(
                  'Tap to Unlock',
                  style: GoogleFonts.outfit(
                    color: AppColors.primary,
                    fontSize: 16,
                  ),
                ),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  side: BorderSide(color: AppColors.primary.withValues(alpha: 0.3)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.2, end: 0),
                
                const SizedBox(height: 24),

                TextButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(LogoutRequested());
                  },
                  child: Text(
                    'Log Out',
                    style: GoogleFonts.outfit(
                      color: AppColors.textSecondary,
                      fontSize: 14,
                    ),
                  ),
                ).animate().fadeIn(delay: 600.ms),
            ],
          ),
        ),
      ),
    );
  }
}
