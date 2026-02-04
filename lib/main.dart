import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';
import 'app/app_bloc_observer.dart';
import 'core/di/service_locator.dart';
import 'core/notifications/notification_service.dart';

import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/bloc/auth_event.dart';
import 'features/group/presentation/bloc/group_bloc.dart';
import 'features/expense/presentation/bloc/expense_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print('🔵🔵🔵 APP FULL RESTART - NEW CONFIG LOADED 🔵🔵🔵');

  await setupDependencies();
  
  // Init Notifications
  final notificationService = getIt<NotificationService>();
  await notificationService.init();
  await notificationService.scheduleDailyNotification(
    id: 999,
    title: '📝 Daily Tracker',
    body: 'Don\'t forget to log your expenses today!',
    time: const TimeOfDay(hour: 20, minute: 0),
  );

  Bloc.observer = AppBlocObserver();

  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    debugPrint(details.exceptionAsString());
  };

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => getIt<AuthBloc>()..add(AppStarted()),
        ),
        BlocProvider(create: (_) => getIt<GroupBloc>()),
        BlocProvider(create: (_) => getIt<ExpenseBloc>()),
      ],
      child: const LedgerlyApp(),
    ),
  );
}
