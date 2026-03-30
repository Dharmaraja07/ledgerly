class ReceiptSmartRule {
  final String id;
  final String merchantKeyword;
  final String category;
  final bool autoCreateExpense;
  final String? titlePrefix;

  const ReceiptSmartRule({
    required this.id,
    required this.merchantKeyword,
    required this.category,
    required this.autoCreateExpense,
    this.titlePrefix,
  });

  factory ReceiptSmartRule.fromJson(Map<String, dynamic> json) {
    return ReceiptSmartRule(
      id: json['id'] as String,
      merchantKeyword: json['merchantKeyword'] as String,
      category: json['category'] as String,
      autoCreateExpense: json['autoCreateExpense'] as bool? ?? false,
      titlePrefix: json['titlePrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'merchantKeyword': merchantKeyword,
      'category': category,
      'autoCreateExpense': autoCreateExpense,
      'titlePrefix': titlePrefix,
    };
  }
}
