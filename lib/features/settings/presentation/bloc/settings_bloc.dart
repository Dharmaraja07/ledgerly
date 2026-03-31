import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'settings_event.dart';
import 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SharedPreferences prefs;

  static const _themeKey = 'theme_mode';
  static const _biometricKey = 'biometric_enabled';
  static const _notificationsKey = 'notifications_enabled';
  static const _currencyKey = 'currency';
  static const _profileNameKey = 'profile_name';
  static const _profileEmailKey = 'profile_email';

  SettingsBloc(this.prefs) : super(const SettingsState()) {
    on<SettingsLoadRequested>(_onLoadRequested);
    on<SettingsThemeChanged>(_onThemeChanged);
    on<SettingsBiometricToggled>(_onBiometricToggled);
    on<SettingsNotificationsToggled>(_onNotificationsToggled);
    on<SettingsCurrencyChanged>(_onCurrencyChanged);
    on<SettingsProfileUpdated>(_onProfileUpdated);
  }

  void _onLoadRequested(SettingsLoadRequested event, Emitter<SettingsState> emit) {
    final themeIndex = prefs.getInt(_themeKey) ?? ThemeMode.system.index;
    final biometric = prefs.getBool(_biometricKey) ?? false;
    final notifications = prefs.getBool(_notificationsKey) ?? true;
    final currency = prefs.getString(_currencyKey) ?? 'USD';
    final profileName = prefs.getString(_profileNameKey) ?? 'Ledgerly User';
    final profileEmail = prefs.getString(_profileEmailKey) ?? 'local@ledgerly.app';

    emit(SettingsState(
      themeMode: ThemeMode.values[themeIndex],
      isBiometricEnabled: biometric,
      areNotificationsEnabled: notifications,
      currency: currency,
      profileName: profileName,
      profileEmail: profileEmail,
    ));
  }

  Future<void> _onThemeChanged(SettingsThemeChanged event, Emitter<SettingsState> emit) async {
    await prefs.setInt(_themeKey, event.themeMode.index);
    emit(state.copyWith(themeMode: event.themeMode));
  }

  Future<void> _onBiometricToggled(SettingsBiometricToggled event, Emitter<SettingsState> emit) async {
    await prefs.setBool(_biometricKey, event.isEnabled);
    emit(state.copyWith(isBiometricEnabled: event.isEnabled));
  }

  Future<void> _onNotificationsToggled(SettingsNotificationsToggled event, Emitter<SettingsState> emit) async {
    await prefs.setBool(_notificationsKey, event.isEnabled);
    emit(state.copyWith(areNotificationsEnabled: event.isEnabled));
  }

  Future<void> _onCurrencyChanged(SettingsCurrencyChanged event, Emitter<SettingsState> emit) async {
    await prefs.setString(_currencyKey, event.currency);
    emit(state.copyWith(currency: event.currency));
  }

  Future<void> _onProfileUpdated(SettingsProfileUpdated event, Emitter<SettingsState> emit) async {
    await prefs.setString(_profileNameKey, event.profileName);
    await prefs.setString(_profileEmailKey, event.profileEmail);
    emit(
      state.copyWith(
        profileName: event.profileName,
        profileEmail: event.profileEmail,
      ),
    );
  }
}
