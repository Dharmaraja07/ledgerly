import 'package:flutter/material.dart';

class TransactionCategory {
  final String id;
  final String name;
  final IconData icon;
  final Color color;
  final bool isDefault;

  TransactionCategory({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    this.isDefault = false,
  });
}

abstract class CategoryRepository {
  Future<List<TransactionCategory>> getCategories();
  Future<void> addCategory(TransactionCategory category);
  Future<void> deleteCategory(String id);
  Future<void> updateCategory(TransactionCategory category);
}
