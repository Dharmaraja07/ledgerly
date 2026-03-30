import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:isar/isar.dart';

import '../../features/category/domain/entities/category.dart';
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

// CATEGORY
import '../../features/category/data/repositories/category_repository_impl.dart';
import '../../features/category/presentation/bloc/category_bloc.dart';

// EXPORT
import '../../features/export/data/repositories/export_repository_impl.dart';
import '../../features/export/domain/repositories/export_repository.dart';
import '../../features/export/domain/usecases/export_expenses_usecase.dart';
import '../../features/export/presentation/bloc/export_bloc.dart';
import '../../features/bill_reminders/data/repositories/bill_reminder_repository.dart';
import '../../features/bill_reminders/presentation/bloc/bill_reminder_bloc.dart';
import '../../features/debt_planner/data/repositories/debt_repository.dart';
import '../../features/debt_planner/presentation/bloc/debt_planner_bloc.dart';
import '../../features/investment/data/repositories/investment_repository.dart';
import '../../features/investment/presentation/bloc/investment_bloc.dart';
import '../../features/document_vault/data/repositories/document_repository.dart';
import '../../features/document_vault/presentation/bloc/document_vault_bloc.dart';
import '../../features/bank_import/data/repositories/bank_import_repository.dart';
import '../../features/bank_import/presentation/bloc/bank_import_bloc.dart';
import '../../features/receipt_ocr/data/repositories/receipt_ocr_repository.dart';
import '../../features/receipt_ocr/data/services/ocr_service.dart';
import '../../features/receipt_ocr/presentation/bloc/receipt_ocr_bloc.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../../features/settings/presentation/bloc/settings_bloc.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // ----------------------------
  // CORE
  // ----------------------------
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  final isarService = IsarService();
  await isarService.init();

  getIt.registerSingleton<IsarService>(isarService);
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
      getIt<SharedPreferences>(),
    ),
  );

  getIt.registerFactory<SettingsBloc>(
    () => SettingsBloc(getIt<SharedPreferences>()),
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
    () => AnalyticsBloc(
      getIt<GetSpendingBreakdownUseCase>(),
      getIt<AnalyticsRepository>(),
    ),
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
    () => ExportRepositoryImpl(
      getIt<Isar>(),
      getIt<SharedPreferences>(),
    ),
  );

  getIt.registerLazySingleton<ExportExpensesUseCase>(
    () => ExportExpensesUseCase(getIt<ExportRepository>()),
  );

  getIt.registerFactory<ExportBloc>(
    () => ExportBloc(getIt<ExportExpensesUseCase>()),
  );

  // ----------------------------
  // CATEGORY
  // ----------------------------
  getIt.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(getIt<IsarService>()),
  );

  getIt.registerFactory<CategoryBloc>(
    () => CategoryBloc(getIt<CategoryRepository>()),
  );

  // ----------------------------
  // ADVANCED OFFLINE MODULES
  // ----------------------------
  getIt.registerLazySingleton<BillReminderRepository>(
    () => BillReminderRepositoryImpl(getIt<IsarService>()),
  );
  getIt.registerFactory<BillReminderBloc>(
    () => BillReminderBloc(getIt<BillReminderRepository>()),
  );

  getIt.registerLazySingleton<DebtRepository>(
    () => DebtRepositoryImpl(getIt<IsarService>()),
  );
  getIt.registerFactory<DebtPlannerBloc>(
    () => DebtPlannerBloc(getIt<DebtRepository>()),
  );

  getIt.registerLazySingleton<InvestmentRepository>(
    () => InvestmentRepositoryImpl(getIt<IsarService>()),
  );
  getIt.registerFactory<InvestmentBloc>(
    () => InvestmentBloc(getIt<InvestmentRepository>()),
  );

  getIt.registerLazySingleton<DocumentRepository>(
    () => DocumentRepositoryImpl(getIt<IsarService>()),
  );
  getIt.registerFactory<DocumentVaultBloc>(
    () => DocumentVaultBloc(getIt<DocumentRepository>()),
  );

  getIt.registerLazySingleton<BankImportRepository>(
    () => BankImportRepository(getIt<IsarService>(), getIt<SharedPreferences>()),
  );
  getIt.registerFactory<BankImportBloc>(
    () => BankImportBloc(getIt<BankImportRepository>()),
  );

  getIt.registerLazySingleton<OcrService>(() => MockOcrService());
  getIt.registerLazySingleton<ReceiptOcrRepository>(
    () => ReceiptOcrRepository(getIt<IsarService>(), getIt<OcrService>()),
  );
  getIt.registerFactory<ReceiptOcrBloc>(
    () => ReceiptOcrBloc(
      getIt<ReceiptOcrRepository>(),
      getIt<ExpenseRepository>(),
      getIt<SharedPreferences>(),
    ),
  );
}
