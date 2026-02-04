import 'dart:ui';

class CategoryTotal {
  final String categoryName;
  final double totalAmount;
  final double percentage;
  final Color color;

  const CategoryTotal({
    required this.categoryName,
    required this.totalAmount,
    required this.percentage,
    required this.color,
  });
}
