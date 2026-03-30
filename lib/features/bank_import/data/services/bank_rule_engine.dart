import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/bank_smart_rule.dart';
import '../models/bank_transaction_isar.dart';

/// Executes persisted smart rules on freshly parsed statement rows.
class BankRuleEngine {
  BankRuleEngine._();

  static const smartRulesPrefsKey = 'bank_import_smart_rules_v1';

  static List<BankSmartRule> loadRules(SharedPreferences prefs) {
    final raw = prefs.getString(smartRulesPrefsKey);
    if (raw == null || raw.isEmpty) return [];
    try {
      final list = (jsonDecode(raw) as List<dynamic>)
          .map((e) => BankSmartRule.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList();
      return list;
    } catch (_) {
      return [];
    }
  }

  /// Applies [rules] in order; first matching rule wins per transaction.
  static void applyRules(
    List<BankSmartRule> rules,
    List<BankTransactionIsar> transactions,
    String bankAccountId,
  ) {
    for (final tx in transactions) {
      tx.bankAccountId = bankAccountId;
      if (rules.isEmpty) continue;

      final haystack =
          '${tx.description} ${tx.merchantName ?? ''}'.toLowerCase();

      for (final rule in rules) {
        final keyword = rule.merchantKeyword.toLowerCase();
        if (keyword.isEmpty || !haystack.contains(keyword)) continue;

        if (!_flowMatches(rule.flow, tx)) continue;

        tx.category = rule.category;
        if (rule.autoNote.isNotEmpty) {
          final existing = tx.notes;
          tx.notes = (existing == null || existing.isEmpty)
              ? rule.autoNote
              : '$existing • ${rule.autoNote}';
        }
        break;
      }
    }
  }

  static bool _flowMatches(String flow, BankTransactionIsar tx) {
    switch (flow) {
      case 'Debit':
        return tx.isDebit;
      case 'Credit':
        return tx.isCredit;
      case 'Any':
      default:
        return true;
    }
  }
}
