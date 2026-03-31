import 'package:flutter/material.dart';

abstract class SettingsEvent {}

class SettingsLoadRequested extends SettingsEvent {}

class SettingsThemeChanged extends SettingsEvent {
  final ThemeMode themeMode;
  SettingsThemeChanged(this.themeMode);
}

class SettingsBiometricToggled extends SettingsEvent {
  final bool isEnabled;
  SettingsBiometricToggled(this.isEnabled);
}

class SettingsNotificationsToggled extends SettingsEvent {
  final bool isEnabled;
  SettingsNotificationsToggled(this.isEnabled);
}

class SettingsCurrencyChanged extends SettingsEvent {
  final String currency;
  SettingsCurrencyChanged(this.currency);
}

class SettingsProfileUpdated extends SettingsEvent {
  final String profileName;
  final String profileEmail;

  SettingsProfileUpdated({
    required this.profileName,
    required this.profileEmail,
  });
}
