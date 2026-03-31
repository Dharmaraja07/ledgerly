import '../../../expense/domain/entitities/Expense.dart' as exp;
import '../models/bank_transaction_isar.dart';

/// Candidate ledger row for linking to a bank line.
class ReconciliationCandidate {
  ReconciliationCandidate({
    required this.expense,
    required this.score,
    required this.reason,
  });

  final exp.Expense expense;
  final double score;
  final String reason;
}

/// Ranks local expenses/income against an imported bank row (amount + date + text).
class ReconciliationMatcher {
  ReconciliationMatcher._();

  static const _amountTolerance = 0.02;
  static const _maxDayDelta = 14;

  /// Returns best matches first (higher [ReconciliationCandidate.score] is better).
  static List<ReconciliationCandidate> rank(
    BankTransactionIsar bank,
    List<exp.Expense> ledger, {
    int maxResults = 12,
    String searchQuery = '',
  }) {
    final bankAmount = bank.amount.abs();
    final q = searchQuery.trim().toLowerCase();

    final filtered = ledger.where((e) {
      if (e.isDeleted) return false;
      if (q.isEmpty) return true;
      return e.title.toLowerCase().contains(q) ||
          e.category.toLowerCase().contains(q);
    }).toList();

    final candidates = <ReconciliationCandidate>[];

    for (final e in filtered) {
      if (!_flowCompatible(bank, e)) continue;

      final score = _score(bank, e, bankAmount);
      if (score <= 0) continue;

      candidates.add(
        ReconciliationCandidate(
          expense: e,
          score: score,
          reason: _reason(bank, e, bankAmount),
        ),
      );
    }

    candidates.sort((a, b) => b.score.compareTo(a.score));
    if (candidates.length > maxResults) {
      return candidates.sublist(0, maxResults);
    }
    return candidates;
  }

  static bool _flowCompatible(BankTransactionIsar bank, exp.Expense e) {
    if (e.transactionType == exp.TransactionType.transfer) return true;
    final bankIsIncome = bank.isCredit;
    final ledgerIsIncome = e.transactionType == exp.TransactionType.income;
    return bankIsIncome == ledgerIsIncome;
  }

  static double _score(
    BankTransactionIsar bank,
    exp.Expense e,
    double bankAmount,
  ) {
    final amountDiff = (bankAmount - e.amount.abs()).abs();
    double amountPts = 0;
    if (amountDiff <= _amountTolerance) {
      amountPts = 55;
    } else if (amountDiff <= 1.0) {
      amountPts = 35;
    } else if (amountDiff <= 5.0) {
      amountPts = 15;
    } else {
      return 0;
    }

    final days = bank.transactionDate.difference(e.updatedAt).inDays.abs();
    if (days > _maxDayDelta) {
      amountPts *= 0.4;
    }
    double datePts = 0;
    if (days == 0) {
      datePts = 30;
    } else if (days <= 2) {
      datePts = 22;
    } else if (days <= 7) {
      datePts = 12;
    } else {
      datePts = 4;
    }

    final textPts = _textOverlap(
      '${bank.description} ${bank.merchantName ?? ''}',
      e.title,
    );

    return amountPts + datePts + textPts;
  }

  static String _reason(BankTransactionIsar bank, exp.Expense e, double bankAmount) {
    final parts = <String>[];
    final diff = (bankAmount - e.amount.abs()).abs();
    if (diff <= _amountTolerance) {
      parts.add('Amount match');
    } else {
      parts.add('Amount ~${diff.toStringAsFixed(2)} off');
    }
    final days = bank.transactionDate.difference(e.updatedAt).inDays.abs();
    parts.add(days == 0 ? 'Same day' : '$days d apart');
    if (_textOverlap(
          '${bank.description} ${bank.merchantName ?? ''}',
          e.title,
        ) >
        8) {
      parts.add('Text match');
    }
    return parts.join(' · ');
  }

  static double _textOverlap(String a, String b) {
    final ta = a.toLowerCase().split(RegExp(r'\W+')).where((s) => s.length > 2).toSet();
    final tb = b.toLowerCase().split(RegExp(r'\W+')).where((s) => s.length > 2).toSet();
    if (ta.isEmpty || tb.isEmpty) return 0;
    final inter = ta.intersection(tb).length;
    final union = ta.union(tb).length;
    if (union == 0) return 0;
    return 20.0 * inter / union;
  }
}
