import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:isar/isar.dart';

import '../config/app_config.dart';
import '../database/isar_service.dart';
import '../network/auth_interceptor.dart';
import '../network/network_info.dart';
import '../network/token_storage.dart';
import '../sync/sync_manager.dart';
import '../security/biometric_service.dart';
import '../notifications/notification_service.dart';

// AUTH
import '../../features/auth/data/datasources/auth_local_datasource.dart';
import '../../features/auth/data/datasources/auth_remote_datasource.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';

// GROUP
import '../../features/group/data/repositories/group_repository_impl.dart';
import '../../features/group/domain/repositories/group_repository.dart';
import '../../features/group/presentation/bloc/group_bloc.dart';

// EXPENSE
import '../../features/expense/data/repositories/expense_repository_impl.dart';
import '../../features/expense/domain/repositories/expense_repository.dart';
import '../../features/expense/presentation/bloc/expense_bloc.dart';

// ANALYTICS
import '../../features/analytics/data/repositories/analytics_repository_impl.dart';
import '../../features/analytics/domain/repositories/analytics_repository.dart';
import '../../features/analytics/domain/usecases/get_spending_breakdown.dart';
import '../../features/analytics/presentation/bloc/analytics_bloc.dart';

// BUDGET
import '../../features/budget/data/repositories/budget_repository_impl.dart';
import '../../features/budget/domain/repositories/budget_repository.dart';
import '../../features/budget/domain/usecases/get_budgets_usecase.dart';
import '../../features/budget/presentation/bloc/budget_bloc.dart';

// EXPORT
import '../../features/export/data/repositories/export_repository_impl.dart';
import '../../features/export/domain/repositories/export_repository.dart';
import '../../features/export/domain/usecases/export_expenses_usecase.dart';
import '../../features/export/presentation/bloc/export_bloc.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // ----------------------------
  // CORE
  // ----------------------------
  final isarService = IsarService();
  await isarService.init();

  getIt.registerSingleton<Isar>(isarService.isar);

  getIt.registerLazySingleton<Dio>(
  () {
    print('✅✅✅ INITIALIZING DIO WITH 30s TIMEOUT ✅✅✅');
    return Dio(
    BaseOptions(
      baseUrl: AppConfig.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );
  },
);


  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfo());
  getIt.registerLazySingleton<SyncManager>(
    () => SyncManager(getIt<Isar>(),  getIt<Dio>(),),
  );

  getIt.registerLazySingleton<BiometricService>(() => BiometricService());
  getIt.registerLazySingleton<NotificationService>(() => NotificationService());

  getIt.registerLazySingleton(() => TokenStorage());

  // ----------------------------
  // AUTH - Data sources
  // ----------------------------
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(getIt<Dio>()),
  );

  getIt.registerLazySingleton<AuthLocalDatasource>(
    () => AuthLocalDatasource(getIt<Isar>()),
  );

  // ----------------------------
  // AUTH - Repository
  // ----------------------------
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      getIt<AuthRemoteDataSource>(),
      getIt<AuthLocalDatasource>(),
    ),
  );


final dio = getIt<Dio>();
dio.interceptors.add(AuthInterceptor(getIt<TokenStorage>()));

  // ----------------------------
  // AUTH - Use case
  // ----------------------------
  getIt.registerLazySingleton<LoginUsecase>(
    () => LoginUsecase(getIt<AuthRepository>()),
  );

  // ----------------------------
  // GROUP
  // ----------------------------
  getIt.registerLazySingleton<GroupRepository>(
    () => GroupRepositoryImpl(getIt<Isar>()),
  );

  // ----------------------------
  // EXPENSE
  // ----------------------------
  getIt.registerLazySingleton<ExpenseRepository>(
    () => ExpenseRepositoryImpl(getIt<Isar>()),
  );

  // ----------------------------
  // ANALYTICS
  // ----------------------------
  getIt.registerLazySingleton<AnalyticsRepository>(
    () => AnalyticsRepositoryImpl(getIt<Isar>()),
  );

  getIt.registerLazySingleton<GetSpendingBreakdownUseCase>(
    () => GetSpendingBreakdownUseCase(getIt<AnalyticsRepository>()),
  );

  // ----------------------------
  // BLOCS
  // ----------------------------
  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(
      getIt<LoginUsecase>(),
      getIt<AuthRepository>(),
      getIt<SyncManager>(),
      getIt<BiometricService>(),
    ),
  );

  getIt.registerFactory<GroupBloc>(
    () => GroupBloc(getIt<GroupRepository>()),
  );

  getIt.registerFactory<ExpenseBloc>(
    () => ExpenseBloc(
      getIt<ExpenseRepository>(),
      getIt<BudgetRepository>(),
      getIt<NotificationService>(),
    ),
  );

  getIt.registerFactory<AnalyticsBloc>(
    () => AnalyticsBloc(getIt<GetSpendingBreakdownUseCase>()),
  );

  // ----------------------------
  // BUDGET
  // ----------------------------
  getIt.registerLazySingleton<BudgetRepository>(
    () => BudgetRepositoryImpl(getIt<Isar>()),
  );

  getIt.registerLazySingleton<GetBudgetsUseCase>(
    () => GetBudgetsUseCase(getIt<BudgetRepository>()),
  );

  getIt.registerFactory<BudgetBloc>(
    () => BudgetBloc(getIt<BudgetRepository>(), getIt<GetBudgetsUseCase>()),
  );
  // ----------------------------
  // EXPORT
  // ----------------------------
  getIt.registerLazySingleton<ExportRepository>(
    () => ExportRepositoryImpl(getIt<Isar>()),
  );

  getIt.registerLazySingleton<ExportExpensesUseCase>(
    () => ExportExpensesUseCase(getIt<ExportRepository>()),
  );

  getIt.registerFactory<ExportBloc>(
    () => ExportBloc(getIt<ExportExpensesUseCase>()),
  );
}
