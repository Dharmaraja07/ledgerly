import 'dart:math';

import 'package:isar/isar.dart';

part 'investment_isar.g.dart';

@collection
class InvestmentIsar {
  Id id = Isar.autoIncrement;

  late String investmentId;
  late String portfolioId;
  late String name;
  late String symbol;
  @enumerated
  late InvestmentType type;
  late double sharesOwned;
  late double averageCostPerShare;
  late double currentPricePerShare;
  late DateTime purchaseDate;
  late DateTime? lastUpdated;
  late String? broker;
  late String? sector;
  late String? region;
  late double? dividendYield;
  late double? expenseRatio;
  late DateTime createdAt;
  late DateTime updatedAt;
  late int version;
  late bool isDeleted;

  double get totalCost => sharesOwned * averageCostPerShare;
  
  double get currentValue => sharesOwned * currentPricePerShare;
  
  double get unrealizedGainLoss => currentValue - totalCost;
  
  double get unrealizedGainLossPercentage {
    if (totalCost == 0) return 0.0;
    return (unrealizedGainLoss / totalCost) * 100;
  }

  double get annualizedReturn {
    final daysHeld = DateTime.now().difference(purchaseDate).inDays;
    if (daysHeld == 0 || totalCost == 0) return 0.0;
    final years = daysHeld / 365.25;
    return (pow(currentValue / totalCost, 1 / years) - 1) * 100;
  }

  bool get isProfitable => unrealizedGainLoss > 0;
  
  bool get isLoss => unrealizedGainLoss < 0;
}

@collection
class InvestmentPortfolioIsar {
  Id id = Isar.autoIncrement;

  late String portfolioId;
  late String name;
  late String? description;
  late double totalValue;
  late double totalCost;
  late DateTime createdAt;
  late DateTime updatedAt;
  late int version;
  late bool isDeleted;

  double get totalGainLoss => totalValue - totalCost;
  
  double get totalGainLossPercentage {
    if (totalCost == 0) return 0.0;
    return (totalGainLoss / totalCost) * 100;
  }

  double get dividendYield {
    // This would be calculated based on portfolio's dividend-paying investments
    return 0.0; // Placeholder
  }

  double get expenseRatio {
    // Weighted average of expense ratios
    return 0.0; // Placeholder
  }
}

enum InvestmentType {
  stock,
  bond,
  etf,
  mutualFund,
  reit,
  crypto,
  commodity,
  option,
  other,
}

extension InvestmentTypeExtension on InvestmentType {
  String get displayName {
    switch (this) {
      case InvestmentType.stock:
        return 'Stock';
      case InvestmentType.bond:
        return 'Bond';
      case InvestmentType.etf:
        return 'ETF';
      case InvestmentType.mutualFund:
        return 'Mutual Fund';
      case InvestmentType.reit:
        return 'REIT';
      case InvestmentType.crypto:
        return 'Cryptocurrency';
      case InvestmentType.commodity:
        return 'Commodity';
      case InvestmentType.option:
        return 'Option';
      case InvestmentType.other:
        return 'Other';
    }
  }

  String get icon {
    switch (this) {
      case InvestmentType.stock:
        return '📈';
      case InvestmentType.bond:
        return '📊';
      case InvestmentType.etf:
        return '💼';
      case InvestmentType.mutualFund:
        return '🏦';
      case InvestmentType.reit:
        return '🏢';
      case InvestmentType.crypto:
        return '₿';
      case InvestmentType.commodity:
        return '🌾';
      case InvestmentType.option:
        return '📋';
      case InvestmentType.other:
        return '📄';
    }
  }
}
