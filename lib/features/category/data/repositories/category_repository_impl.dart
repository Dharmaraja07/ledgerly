import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import '../../../../core/database/isar_service.dart';
import '../../category_icons.dart';
import '../../domain/entities/category.dart';
import '../models/category_isar.dart';


class CategoryRepositoryImpl implements CategoryRepository {
  final IsarService _isarService;

  CategoryRepositoryImpl(this._isarService);

  @override
  Future<List<TransactionCategory>> getCategories() async {
    final categories = await _isarService.isar.categoryIsars.where().findAll();
    
    if (categories.isEmpty) {
      // Seed default categories if none exist
      await _seedDefaults();
      return getCategories();
    }

    final deduped = <String, CategoryIsar>{};
    for (final category in categories) {
      deduped.putIfAbsent(
        category.name.trim().toLowerCase(),
        () => category,
      );
    }

    return deduped.values
        .map((c) => TransactionCategory(
              id: c.id.toString(),
              name: c.name,
              icon: categoryIconForCodePoint(c.iconCode),
              color: Color(c.colorValue),
              isDefault: c.isDefault,
            ))
        .toList()
      ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
  }

  @override
  Future<void> addCategory(TransactionCategory category) async {
    await _isarService.isar.writeTxn(() async {
      final normalizedName = category.name.trim().toLowerCase();
      final existing = await _isarService.isar.categoryIsars.where().findAll();
      final duplicate = existing.where(
        (item) => item.name.trim().toLowerCase() == normalizedName,
      );

      if (duplicate.isNotEmpty) {
        final match = duplicate.first;
        match
          ..name = category.name.trim()
          ..iconCode = category.icon.codePoint
          ..colorValue = category.color.toARGB32()
          ..isDefault = match.isDefault;
        await _isarService.isar.categoryIsars.put(match);
        return;
      }

      final isarCategory = CategoryIsar()
        ..name = category.name.trim()
        ..iconCode = category.icon.codePoint
        ..colorValue = category.color.toARGB32()
        ..isDefault = false;
      await _isarService.isar.categoryIsars.put(isarCategory);
    });
  }

  @override
  Future<void> deleteCategory(String id) async {
    await _isarService.isar.writeTxn(() async {
      await _isarService.isar.categoryIsars.delete(int.parse(id));
    });
  }

  @override
  Future<void> updateCategory(TransactionCategory category) async {
    await _isarService.isar.writeTxn(() async {
      final existing = await _isarService.isar.categoryIsars.where().findAll();
      final normalizedName = category.name.trim().toLowerCase();
      final duplicate = existing.where(
        (item) =>
            item.id != int.parse(category.id) &&
            item.name.trim().toLowerCase() == normalizedName,
      );

      if (duplicate.isNotEmpty) {
        final duplicateCategory = duplicate.first;
        duplicateCategory
          ..iconCode = category.icon.codePoint
          ..colorValue = category.color.toARGB32();
        await _isarService.isar.categoryIsars.put(duplicateCategory);
        await _isarService.isar.categoryIsars.delete(int.parse(category.id));
        return;
      }

      final isarCategory = CategoryIsar()
        ..id = int.parse(category.id)
        ..name = category.name.trim()
        ..iconCode = category.icon.codePoint
        ..colorValue = category.color.toARGB32()
        ..isDefault = category.isDefault;
      await _isarService.isar.categoryIsars.put(isarCategory);
    });
  }

  Future<void> _seedDefaults() async {
    final defaults = [
      {'name': 'Food', 'icon': Icons.restaurant, 'color': Colors.redAccent},
      {'name': 'Transport', 'icon': Icons.directions_bus, 'color': Colors.blue},
      {'name': 'Shopping', 'icon': Icons.shopping_bag, 'color': Colors.pink},
      {'name': 'Entertainment', 'icon': Icons.movie, 'color': Colors.purple},
      {'name': 'Health', 'icon': Icons.medical_services, 'color': Colors.teal},
      {'name': 'Education', 'icon': Icons.school, 'color': Colors.orange},
      {'name': 'Bills', 'icon': Icons.receipt, 'color': Colors.green},
      {'name': 'Travel', 'icon': Icons.flight, 'color': Colors.lightBlue},
      {'name': 'Salary', 'icon': Icons.attach_money, 'color': Colors.greenAccent},
      {'name': 'Investments', 'icon': Icons.trending_up, 'color': Colors.indigo},
    ];

    await _isarService.isar.writeTxn(() async {
      for (var d in defaults) {
        final c = CategoryIsar()
          ..name = d['name'] as String
          ..iconCode = (d['icon'] as IconData).codePoint
          ..colorValue = (d['color'] as Color).toARGB32()
          ..isDefault = true;
        await _isarService.isar.categoryIsars.put(c);
      }
    });
  }
}
