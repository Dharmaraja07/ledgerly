import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ledgerly/features/auth/domain/repositories/auth_repository.dart';
import 'package:ledgerly/features/auth/domain/usecases/login_usecase.dart';
import 'package:ledgerly/features/auth/presentation/bloc/auth_state.dart';

import '../../../../core/sync/sync_manager.dart';
import '../../../../core/security/biometric_service.dart';
import 'auth_event.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthBloc extends Bloc<AuthEvent,AuthState> {
  final LoginUsecase loginUseCase;
  final AuthRepository repository;
  final SyncManager syncManager;
  final BiometricService biometricService;
  final SharedPreferences prefs;

  AuthBloc(
    this.loginUseCase,
    this.repository,
    this.syncManager,
    this.biometricService,
    this.prefs,
  ) : super(AuthInitial()) {
    on<AppStarted>(_onAppStarted);
    on<LoginRequested>(_onLoginRequested);
    on<LogoutRequested>(_onLogout);
    on<BiometricAuthSuccess>(_onBiometricSuccess);
  }

  Future<void> _onAppStarted(AppStarted event, Emitter<AuthState> emit) async {
    final user = await repository.getCachedUser();
    if (user != null) {
      final isBioAvailable = await biometricService.isAvailable;
      final isBioEnabled = prefs.getBool('biometric_enabled') ?? false;
      
      if (isBioAvailable && isBioEnabled) {
        emit(AuthBiometricRequired(user));
      } else {
        emit(AuthAuthenticated(user));
      }
    } else {
      emit(AuthUnAuthenticated());
    }
  }

  Future<void> _onBiometricSuccess(BiometricAuthSuccess event, Emitter<AuthState> emit) async {
    emit(AuthAuthenticated(event.user));
  }


  Future<void> _onLoginRequested(
      LoginRequested event,
      Emitter<AuthState> emit,
      ) async {
    emit(AuthLoading());
    try {
      final user = await loginUseCase(
        event.email,
        event.password,
      );
      await prefs.setString('profile_name', user.name);
      await prefs.setString('profile_email', user.email);

      emit(AuthAuthenticated(user));
    } catch (e, s) {
      print('🔴 AuthBloc Error: $e');
      print('🔴 StackTrace: $s');
      emit(AuthError('Login failed: $e'));
    }
  }

  Future<void> _onLogout(
      LogoutRequested event,
      Emitter<AuthState> emit,
      ) async {
    await repository.logout();
    emit(AuthUnAuthenticated());
  }

}
