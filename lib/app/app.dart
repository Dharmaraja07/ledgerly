import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/theme/app_theme.dart';
import '../features/auth/presentation/bloc/auth_bloc.dart';
import '../features/auth/presentation/bloc/auth_state.dart';
import '../features/auth/presentation/pages/ui/login_page.dart';
import '../features/group/presentation/pages/ui/group_list_page.dart';
import '../features/auth/presentation/pages/ui/biometric_lock_page.dart';
import '../core/presentation/pages/splash_screen.dart';

class LedgerlyApp extends StatefulWidget {
  const LedgerlyApp({super.key});

  @override
  State<LedgerlyApp> createState() => _LedgerlyAppState();
}

class _LedgerlyAppState extends State<LedgerlyApp> {
  bool _showSplash = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _showSplash = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: AppTheme.darkTheme,
      darkTheme: AppTheme.darkTheme,
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (_showSplash) {
            return const SplashScreen();
          }
          if (state is AuthAuthenticated) {
            return const GroupListPage();
          }
          if (state is AuthBiometricRequired) {
            return const BiometricLockPage();
          }
          return const LoginPage();
        },
      ),
    );
  }
}
