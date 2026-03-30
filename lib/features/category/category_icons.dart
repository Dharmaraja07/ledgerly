import 'package:flutter/material.dart';

/// Material icons persisted as [IconData.codePoint] in storage. Used for the
/// category picker and to resolve DB values without non-const [IconData] calls
/// (required for release icon font tree shaking).
const List<IconData> kTransactionCategoryIcons = [
  Icons.restaurant,
  Icons.directions_bus,
  Icons.shopping_bag,
  Icons.movie,
  Icons.medical_services,
  Icons.school,
  Icons.receipt,
  Icons.flight,
  Icons.attach_money,
  Icons.home_work_outlined,
  Icons.fitness_center,
  Icons.card_giftcard,
  Icons.trending_up,
];

IconData categoryIconForCodePoint(int codePoint) {
  for (final icon in kTransactionCategoryIcons) {
    if (icon.codePoint == codePoint) return icon;
  }
  return Icons.category;
}
