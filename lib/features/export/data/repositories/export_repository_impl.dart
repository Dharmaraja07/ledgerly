import 'dart:io';
import 'package:csv/csv.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../expense/data/models/expense_isar.dart';
import '../../domain/repositories/export_repository.dart';

class ExportRepositoryImpl implements ExportRepository {
  final Isar isar;

  ExportRepositoryImpl(this.isar);

  @override
  Future<String> generateCsv(String groupId) async {
    final expenses = await isar.expenseIsars
        .filter()
        .groupIdEqualTo(groupId)
        .sortByUpdatedAtDesc()
        .findAll();

    final activeExpenses = expenses.where((e) => !e.isDeleted).toList();

    List<List<dynamic>> rows = [];
    
    // Header
    rows.add([
      "Date",
      "Title",
      "Amount",
      "Paid By",
      "Category",
      "Split Details"
    ]);

    // Data
    for (var e in activeExpenses) {
      rows.add([
        e.updatedAt.toIso8601String(),
        e.title,
        e.amount,
        e.paidBy,
        e.category,
        e.splits.map((s) => "${s.userId}:${s.amount}").join(", ")
      ]);
    }

    String csv = const ListToCsvConverter().convert(rows);

    final directory = await getApplicationDocumentsDirectory();
    final path = "${directory.path}/expenses_${DateTime.now().millisecondsSinceEpoch}.csv";
    final file = File(path);
    await file.writeAsString(csv);
    
    return path;
  }
}
