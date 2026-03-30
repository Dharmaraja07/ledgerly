import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bloc/auth_bloc.dart';
import '../../bloc/auth_event.dart';
import '../../bloc/auth_state.dart';
import '../../../../../core/theme/app_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF0F1218),
              AppColors.background,
              Color(0xFF050505),
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo Area
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.2),
                        blurRadius: 40,
                        spreadRadius: 10,
                      )
                    ]
                  ),
                  child: const Icon(
                    Icons.account_balance_wallet_outlined,
                    size: 80,
                    color: AppColors.primary,
                  ),
                ).animate().scale(duration: 600.ms, curve: Curves.easeOutBack),
                
                const SizedBox(height: 32),
                
                Text(
                  'Create Your Local Vault',
                  style: GoogleFonts.outfit(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2, end: 0),
                
                const SizedBox(height: 8),
                Text(
                  'Use an email and passcode to unlock your offline workspace',
                  style: GoogleFonts.outfit(
                    fontSize: 16,
                    color: AppColors.textSecondary,
                  ),
                ).animate().fadeIn(delay: 400.ms),

                const SizedBox(height: 48),

                // Form
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: AppColors.surfaceHighlight),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          controller: _email,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email_outlined),
                          ),
                          style: const TextStyle(color: AppColors.textPrimary),
                          validator: (v) => v == null || v.isEmpty ? 'Required' : null,
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _password,
                          decoration: const InputDecoration(
                            labelText: 'Passcode',
                            prefixIcon: Icon(Icons.lock_outline),
                          ),
                          obscureText: true,
                          style: const TextStyle(color: AppColors.textPrimary),
                          validator: (v) => v == null || v.isEmpty ? 'Required' : null,
                        ),
                        const SizedBox(height: 32),

                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            final loading = state is AuthLoading;

                            return Container(
                              height: 56,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                gradient: loading ? null : AppColors.primaryGradient,
                                color: loading ? AppColors.surfaceHighlight : null,
                                boxShadow: [
                                  if (!loading)
                                    BoxShadow(
                                      color: AppColors.primary.withValues(alpha: 0.3),
                                      blurRadius: 20,
                                      offset: const Offset(0, 8),
                                    )
                                ],
                              ),
                              child: ElevatedButton(
                                onPressed: loading
                                    ? null
                                    : () {
                                        if (_formKey.currentState!.validate()) {
                                          context.read<AuthBloc>().add(
                                                LoginRequested(
                                                  _email.text,
                                                  _password.text,
                                                ),
                                              );
                                        }
                                      },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: loading
                                    ? const SizedBox(
                                        height: 24,
                                        width: 24,
                                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                                      )
                                    : Text(
                                        'Enter Ledgerly',
                                        style: GoogleFonts.outfit(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black, // Dark text on green button
                                        ),
                                      ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Everything stays on this device unless you export it.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.outfit(
                            color: AppColors.textSecondary,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.1, end: 0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
