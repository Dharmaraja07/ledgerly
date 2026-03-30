/// User-defined rule applied to each imported bank row (merchant match + flow).
class BankSmartRule {
  const BankSmartRule({
    required this.id,
    required this.merchantKeyword,
    required this.flow,
    required this.category,
    required this.autoNote,
  });

  factory BankSmartRule.fromJson(Map<String, dynamic> json) {
    return BankSmartRule(
      id: json['id'] as String,
      merchantKeyword: json['merchantKeyword'] as String,
      flow: json['flow'] as String,
      category: json['category'] as String,
      autoNote: json['autoNote'] as String? ?? '',
    );
  }

  final String id;
  final String merchantKeyword;
  /// `Debit`, `Credit`, or `Any`.
  final String flow;
  final String category;
  final String autoNote;

  Map<String, dynamic> toJson() => {
        'id': id,
        'merchantKeyword': merchantKeyword,
        'flow': flow,
        'category': category,
        'autoNote': autoNote,
      };
}
