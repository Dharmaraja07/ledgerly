import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/sync/sync_entity_type.dart';
import '../../../../core/sync/sync_operation_type.dart';
import '../../../../core/sync/sync_queue_isar.dart';
import '../../../auth/data/models/user_isar.dart';
import '../../../budget/data/models/budget_isar.dart';
import '../../../category/data/models/category_isar.dart';
import '../../../expense/data/models/expense_isar.dart';
import '../../../expense/data/models/split_isar.dart';
import '../../../group/data/models/group_isar.dart';
import '../../domain/repositories/export_repository.dart';

class ExportRepositoryImpl implements ExportRepository {
  final Isar isar;
  final SharedPreferences prefs;

  ExportRepositoryImpl(this.isar, this.prefs);

  @override
  Future<String> generateCsv(String groupId) async {
    final expenses = await isar.expenseIsars
        .filter()
        .groupIdEqualTo(groupId)
        .sortByUpdatedAtDesc()
        .findAll();

    final activeExpenses = expenses.where((e) => !e.isDeleted).toList();

    final rows = <List<dynamic>>[
      ['Date', 'Title', 'Amount', 'Paid By', 'Category', 'Type', 'Split Details'],
    ];

    for (final expense in activeExpenses) {
      rows.add([
        expense.updatedAt.toIso8601String(),
        expense.title,
        expense.amount,
        expense.paidBy,
        expense.category,
        expense.transactionType ?? 'expense',
        expense.splits.map((split) => '${split.userId}:${split.amount}').join(', '),
      ]);
    }

    final csv = const ListToCsvConverter().convert(rows);
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/expenses_${DateTime.now().millisecondsSinceEpoch}.csv';
    final file = File(path);
    await file.writeAsString(csv);
    return path;
  }

  @override
  Future<String> generatePdf(String groupId) async {
    final expenses = await isar.expenseIsars
        .filter()
        .groupIdEqualTo(groupId)
        .sortByUpdatedAtDesc()
        .findAll();

    final activeExpenses = expenses.where((e) => !e.isDeleted).toList();
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        build: (context) => [
          pw.Header(level: 0, child: pw.Text('Ledgerly Expense Report')),
          pw.TableHelper.fromTextArray(
            headers: ['Date', 'Title', 'Amount', 'Category', 'Type'],
            data: activeExpenses
                .map(
                  (expense) => [
                    '${expense.updatedAt.year}-${expense.updatedAt.month}-${expense.updatedAt.day}',
                    expense.title,
                    '₹${expense.amount.toStringAsFixed(2)}',
                    expense.category,
                    expense.transactionType ?? 'expense',
                  ],
                )
                .toList(),
          ),
        ],
      ),
    );

    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/expenses_${DateTime.now().millisecondsSinceEpoch}.pdf';
    final file = File(path);
    await file.writeAsBytes(await pdf.save());
    return path;
  }

  @override
  Future<String> generateBackupSnapshot() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/ledgerly_backup_${DateTime.now().millisecondsSinceEpoch}.json';

    final payload = {
      'generatedAt': DateTime.now().toUtc().toIso8601String(),
      'users': (await isar.userIsars.where().findAll()).map(_userToJson).toList(),
      'groups': (await isar.groupIsars.where().findAll()).map(_groupToJson).toList(),
      'expenses': (await isar.expenseIsars.where().findAll()).map(_expenseToJson).toList(),
      'budgets': (await isar.budgetIsars.where().findAll()).map(_budgetToJson).toList(),
      'categories': (await isar.categoryIsars.where().findAll()).map(_categoryToJson).toList(),
      'syncQueue': (await isar.syncQueueIsars.where().findAll()).map(_syncToJson).toList(),
      'preferences': _extractPreferences(),
    };

    final file = File(path);
    await file.writeAsString(const JsonEncoder.withIndent('  ').convert(payload));
    return path;
  }

  @override
  Future<String> restoreLatestBackup() async {
    final directory = await getApplicationDocumentsDirectory();
    final backups = directory
        .listSync()
        .whereType<File>()
        .where((file) => file.path.contains('ledgerly_backup_') && file.path.endsWith('.json'))
        .toList()
      ..sort((a, b) => b.path.compareTo(a.path));

    if (backups.isEmpty) {
      throw Exception('No local backup snapshot found.');
    }

    final latest = backups.first;
    final payload = jsonDecode(await latest.readAsString()) as Map<String, dynamic>;

    await isar.writeTxn(() async {
      await isar.userIsars.clear();
      await isar.groupIsars.clear();
      await isar.expenseIsars.clear();
      await isar.budgetIsars.clear();
      await isar.categoryIsars.clear();
      await isar.syncQueueIsars.clear();

      await isar.userIsars.putAll(
        ((payload['users'] as List<dynamic>? ?? const [])).map(
          (item) => _userFromJson(item as Map<String, dynamic>),
        ).toList(),
      );
      await isar.groupIsars.putAll(
        ((payload['groups'] as List<dynamic>? ?? const [])).map(
          (item) => _groupFromJson(item as Map<String, dynamic>),
        ).toList(),
      );
      await isar.expenseIsars.putAll(
        ((payload['expenses'] as List<dynamic>? ?? const [])).map(
          (item) => _expenseFromJson(item as Map<String, dynamic>),
        ).toList(),
      );
      await isar.budgetIsars.putAll(
        ((payload['budgets'] as List<dynamic>? ?? const [])).map(
          (item) => _budgetFromJson(item as Map<String, dynamic>),
        ).toList(),
      );
      await isar.categoryIsars.putAll(
        ((payload['categories'] as List<dynamic>? ?? const [])).map(
          (item) => _categoryFromJson(item as Map<String, dynamic>),
        ).toList(),
      );
      await isar.syncQueueIsars.putAll(
        ((payload['syncQueue'] as List<dynamic>? ?? const [])).map(
          (item) => _syncFromJson(item as Map<String, dynamic>),
        ).toList(),
      );
    });

    final preferences = payload['preferences'] as Map<String, dynamic>? ?? const {};
    for (final entry in preferences.entries) {
      final value = entry.value;
      if (value == null) {
        await prefs.remove(entry.key);
      } else if (value is bool) {
        await prefs.setBool(entry.key, value);
      } else if (value is int) {
        await prefs.setInt(entry.key, value);
      } else if (value is double) {
        await prefs.setDouble(entry.key, value);
      } else if (value is String) {
        await prefs.setString(entry.key, value);
      }
    }

    return latest.path;
  }

  Map<String, dynamic> _extractPreferences() {
    const keys = [
      'theme_mode',
      'biometric_enabled',
      'notifications_enabled',
      'currency',
      'profile_name',
      'profile_email',
      'planner_goals_v1',
      'planner_recurring_v1',
      'planner_accounts_v1',
    ];

    return {
      for (final key in keys) key: prefs.get(key),
    };
  }

  Map<String, dynamic> _userToJson(UserIsar user) => {
        'id': user.id,
        'userId': user.userId,
        'email': user.email,
        'name': user.name,
        'accessToken': user.accessToken,
        'refreshToken': user.refreshToken,
      };

  UserIsar _userFromJson(Map<String, dynamic> json) {
    return UserIsar()
      ..id = json['id'] as int
      ..userId = json['userId'] as String
      ..email = json['email'] as String
      ..name = json['name'] as String
      ..accessToken = json['accessToken'] as String
      ..refreshToken = json['refreshToken'] as String;
  }

  Map<String, dynamic> _groupToJson(GroupIsar group) => {
        'id': group.id,
        'groupId': group.groupId,
        'name': group.name,
        'memberIds': group.memberIds,
        'updatedAt': group.updatedAt.toIso8601String(),
        'version': group.version,
        'isDeleted': group.isDeleted,
      };

  GroupIsar _groupFromJson(Map<String, dynamic> json) {
    return GroupIsar()
      ..id = json['id'] as int
      ..groupId = json['groupId'] as String
      ..name = json['name'] as String
      ..memberIds = List<String>.from(json['memberIds'] as List<dynamic>)
      ..updatedAt = DateTime.parse(json['updatedAt'] as String)
      ..version = json['version'] as int
      ..isDeleted = json['isDeleted'] as bool;
  }

  Map<String, dynamic> _expenseToJson(ExpenseIsar expense) => {
        'id': expense.id,
        'expenseId': expense.expenseId,
        'groupId': expense.groupId,
        'title': expense.title,
        'amount': expense.amount,
        'paidBy': expense.paidBy,
        'category': expense.category,
        'transactionType': expense.transactionType,
        'splits': expense.splits
            .map((split) => {'userId': split.userId, 'amount': split.amount})
            .toList(),
        'updatedAt': expense.updatedAt.toIso8601String(),
        'version': expense.version,
        'isDeleted': expense.isDeleted,
      };

  ExpenseIsar _expenseFromJson(Map<String, dynamic> json) {
    return ExpenseIsar()
      ..id = json['id'] as int
      ..expenseId = json['expenseId'] as String
      ..groupId = json['groupId'] as String
      ..title = json['title'] as String
      ..amount = (json['amount'] as num).toDouble()
      ..paidBy = json['paidBy'] as String
      ..category = json['category'] as String
      ..transactionType = json['transactionType'] as String?
      ..splits = (json['splits'] as List<dynamic>)
          .map(
            (item) => SplitIsar()
              ..userId = (item as Map<String, dynamic>)['userId'] as String
              ..amount = ((item)['amount'] as num).toDouble(),
          )
          .toList()
      ..updatedAt = DateTime.parse(json['updatedAt'] as String)
      ..version = json['version'] as int
      ..isDeleted = json['isDeleted'] as bool;
  }

  Map<String, dynamic> _budgetToJson(BudgetIsar budget) => {
        'id': budget.id,
        'budgetId': budget.budgetId,
        'groupId': budget.groupId,
        'category': budget.category,
        'limit': budget.limit,
        'month': budget.month.toIso8601String(),
      };

  BudgetIsar _budgetFromJson(Map<String, dynamic> json) {
    return BudgetIsar()
      ..id = json['id'] as int
      ..budgetId = json['budgetId'] as String
      ..groupId = json['groupId'] as String
      ..category = json['category'] as String
      ..limit = (json['limit'] as num).toDouble()
      ..month = DateTime.parse(json['month'] as String);
  }

  Map<String, dynamic> _categoryToJson(CategoryIsar category) => {
        'id': category.id,
        'name': category.name,
        'iconCode': category.iconCode,
        'colorValue': category.colorValue,
        'isDefault': category.isDefault,
      };

  CategoryIsar _categoryFromJson(Map<String, dynamic> json) {
    return CategoryIsar()
      ..id = json['id'] as int
      ..name = json['name'] as String
      ..iconCode = json['iconCode'] as int
      ..colorValue = json['colorValue'] as int
      ..isDefault = json['isDefault'] as bool;
  }

  Map<String, dynamic> _syncToJson(SyncQueueIsar item) => {
        'id': item.id,
        'entityId': item.entityId,
        'entityType': item.entityType.name,
        'operation': item.operation.name,
        'createdAt': item.createdAt.toIso8601String(),
      };

  SyncQueueIsar _syncFromJson(Map<String, dynamic> json) {
    return SyncQueueIsar()
      ..id = json['id'] as int
      ..entityId = json['entityId'] as String
      ..entityType = SyncEntityType.values.byName(json['entityType'] as String)
      ..operation = SyncOperationType.values.byName(json['operation'] as String)
      ..createdAt = DateTime.parse(json['createdAt'] as String);
  }
}
