import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import '../../../expense/data/models/expense_isar.dart';
import '../../domain/entities/category_total.dart';
import '../../domain/repositories/analytics_repository.dart';

class AnalyticsRepositoryImpl implements AnalyticsRepository {
  final Isar isar;

  AnalyticsRepositoryImpl(this.isar);

  @override
  Future<List<CategoryTotal>> getCategoryBreakdown(String groupId) async {
    final expenses = await isar.collection<ExpenseIsar>()
        .filter()
        .groupIdEqualTo(groupId)
        .findAll();

    final activeExpenses = expenses.where((e) => !e.isDeleted).toList();
    if (activeExpenses.isEmpty) return [];

    final total = activeExpenses.fold<double>(0, (sum, e) => sum + e.amount);
    final grouped = <String, double>{};

    for (final e in activeExpenses) {
      final cat = (e.category.isEmpty) ? 'General' : e.category;
      grouped[cat] = (grouped[cat] ?? 0) + e.amount;
    }

    final colors = [
      const Color(0xFF4CAF50), // Green
      const Color(0xFF2196F3), // Blue
      const Color(0xFFFFC107), // Amber
      const Color(0xFFE91E63), // Pink
      const Color(0xFF9C27B0), // Purple
      const Color(0xFF00BCD4), // Cyan
      const Color(0xFFFF5722), // Deep Orange
    ];
    
    int colorIndex = 0;
    
    return grouped.entries.map((e) {
      final percentage = (e.value / total) * 100;
      final color = colors[colorIndex % colors.length];
      colorIndex++;
      
      return CategoryTotal(
        categoryName: e.key,
        totalAmount: e.value,
        percentage: percentage,
        color: color,
      );
    }).toList()
      ..sort((a, b) => b.totalAmount.compareTo(a.totalAmount));
  }

  @override
  Future<Map<String, double>> getMonthlySpending(String groupId) async {
    final expenses = await isar.collection<ExpenseIsar>()
        .filter()
        .groupIdEqualTo(groupId)
        .findAll();

    final active = expenses.where((e) => !e.isDeleted);
    final Map<String, double> monthly = {};

    for (final e in active) {
      final key = "${e.updatedAt.month}/${e.updatedAt.year}"; // format: M/YYYY
      monthly[key] = (monthly[key] ?? 0) + e.amount;
    }
    
    return monthly;
  }
}
