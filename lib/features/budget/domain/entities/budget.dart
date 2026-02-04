class Budget {
  final String id;
  final String groupId;
  final String category;
  final double limit;
  final DateTime month; // First day of the month

  const Budget({
    required this.id,
    required this.groupId,
    required this.category,
    required this.limit,
    required this.month,
  });
}
