import '../../domain/entities/user.dart';

abstract class AuthEvent {}

class LoginRequested extends AuthEvent{
  final String email;
  final String password;

  LoginRequested(this.email,this.password);
}

class AppStarted extends AuthEvent{}

class BiometricAuthSuccess extends AuthEvent {
  final User user;
  BiometricAuthSuccess(this.user);
}

class LogoutRequested extends AuthEvent{}