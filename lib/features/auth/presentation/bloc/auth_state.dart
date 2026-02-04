import '../../domain/entities/user.dart';

abstract class AuthState {}

class AuthInitial  extends AuthState{}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState{
  final User user;
  AuthAuthenticated(this.user);
}

class AuthBiometricRequired extends AuthState {
  final User user;
  AuthBiometricRequired(this.user);
}

class AuthUnAuthenticated extends AuthState {}

class AuthError extends AuthState {
   final String message;
  AuthError(this.message);
}