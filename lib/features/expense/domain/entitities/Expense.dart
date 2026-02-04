class Expense {
  final String id;
  final String groupId;
  final String title;
  final double amount;
  final String paidBy;
  final String category;

  /// userId → amount owed
  final Map<String, double> splits;

  final DateTime updatedAt;
  final int version;
  final bool isDeleted;

  const Expense({
    required this.id,
    required this.groupId,
    required this.title,
    required this.amount,
    required this.paidBy,
    required this.category,
    required this.splits,
    required this.updatedAt,
    required this.version,
    required this.isDeleted,
  });
}
