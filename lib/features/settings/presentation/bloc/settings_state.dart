import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SettingsState extends Equatable {
  final ThemeMode themeMode;
  final bool isBiometricEnabled;
  final bool areNotificationsEnabled;
  final String currency;
  final String profileName;
  final String profileEmail;

  const SettingsState({
    this.themeMode = ThemeMode.system,
    this.isBiometricEnabled = false,
    this.areNotificationsEnabled = true,
    this.currency = 'USD',
    this.profileName = 'Ledgerly User',
    this.profileEmail = 'local@ledgerly.app',
  });

  SettingsState copyWith({
    ThemeMode? themeMode,
    bool? isBiometricEnabled,
    bool? areNotificationsEnabled,
    String? currency,
    String? profileName,
    String? profileEmail,
  }) {
    return SettingsState(
      themeMode: themeMode ?? this.themeMode,
      isBiometricEnabled: isBiometricEnabled ?? this.isBiometricEnabled,
      areNotificationsEnabled: areNotificationsEnabled ?? this.areNotificationsEnabled,
      currency: currency ?? this.currency,
      profileName: profileName ?? this.profileName,
      profileEmail: profileEmail ?? this.profileEmail,
    );
  }

  @override
  List<Object> get props => [
        themeMode,
        isBiometricEnabled,
        areNotificationsEnabled,
        currency,
        profileName,
        profileEmail,
      ];
}
