import 'package:isar/isar.dart';

import '../../data/models/investment_isar.dart';
import '../../../../core/database/isar_service.dart';

abstract class InvestmentRepository {
  Future<List<InvestmentIsar>> getAllInvestments();
  Future<List<InvestmentPortfolioIsar>> getAllPortfolios();
  Future<InvestmentIsar?> getInvestmentById(String investmentId);
  Future<InvestmentPortfolioIsar?> getPortfolioById(String portfolioId);
  Future<void> addInvestment(InvestmentIsar investment);
  Future<void> updateInvestment(InvestmentIsar investment);
  Future<void> deleteInvestment(String investmentId);
  Future<void> addPortfolio(InvestmentPortfolioIsar portfolio);
  Future<void> updatePortfolio(InvestmentPortfolioIsar portfolio);
  Future<void> deletePortfolio(String portfolioId);
  Future<void> updateInvestmentPrices(List<InvestmentIsar> investments);
  Future<List<InvestmentIsar>> getInvestmentsByPortfolio(String portfolioId);
  Future<double> getTotalPortfolioValue(String portfolioId);
  Future<double> getTotalPortfolioCost(String portfolioId);
  Future<double> getTotalPortfolioGainLoss(String portfolioId);
  Future<Map<String, double>> getPortfolioAllocation(String portfolioId);
  Future<List<InvestmentIsar>> getTopPerformers(String portfolioId, int limit);
  Future<List<InvestmentIsar>> getWorstPerformers(String portfolioId, int limit);
}

class InvestmentRepositoryImpl implements InvestmentRepository {
  final IsarService _isarService;

  InvestmentRepositoryImpl(this._isarService);

  Future<List<InvestmentIsar>> _activeInvestments() async {
    final investments = await _isarService.isar.investmentIsars.where().findAll();
    final activeInvestments = investments.where((investment) => !investment.isDeleted).toList()
      ..sort((a, b) => b.currentValue.compareTo(a.currentValue));
    return activeInvestments;
  }

  Future<List<InvestmentPortfolioIsar>> _activePortfolios() async {
    final portfolios = await _isarService.isar.investmentPortfolioIsars.where().findAll();
    final activePortfolios = portfolios.where((portfolio) => !portfolio.isDeleted).toList()
      ..sort((a, b) => b.totalValue.compareTo(a.totalValue));
    return activePortfolios;
  }

  @override
  Future<List<InvestmentIsar>> getAllInvestments() async {
    return _activeInvestments();
  }

  @override
  Future<List<InvestmentPortfolioIsar>> getAllPortfolios() async {
    return _activePortfolios();
  }

  @override
  Future<InvestmentIsar?> getInvestmentById(String investmentId) async {
    final investments = await _activeInvestments();
    try {
      return investments.firstWhere((investment) => investment.investmentId == investmentId);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<InvestmentPortfolioIsar?> getPortfolioById(String portfolioId) async {
    final portfolios = await _activePortfolios();
    try {
      return portfolios.firstWhere((portfolio) => portfolio.portfolioId == portfolioId);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> addInvestment(InvestmentIsar investment) async {
    final isar = _isarService.isar;
    await isar.writeTxn(() async {
      await isar.investmentIsars.put(investment);
      await _updatePortfolioValue(investment.portfolioId);
    });
  }

  @override
  Future<void> updateInvestment(InvestmentIsar investment) async {
    final isar = _isarService.isar;
    investment.updatedAt = DateTime.now();
    investment.version++;
    await isar.writeTxn(() async {
      await isar.investmentIsars.put(investment);
      await _updatePortfolioValue(investment.portfolioId);
    });
  }

  @override
  Future<void> deleteInvestment(String investmentId) async {
    final isar = _isarService.isar;
    await isar.writeTxn(() async {
      final investment = await getInvestmentById(investmentId);
      if (investment != null) {
        investment.isDeleted = true;
        investment.updatedAt = DateTime.now();
        investment.version++;
        await isar.investmentIsars.put(investment);
        await _updatePortfolioValue(investment.portfolioId);
      }
    });
  }

  @override
  Future<void> addPortfolio(InvestmentPortfolioIsar portfolio) async {
    final isar = _isarService.isar;
    await isar.writeTxn(() async {
      await isar.investmentPortfolioIsars.put(portfolio);
    });
  }

  @override
  Future<void> updatePortfolio(InvestmentPortfolioIsar portfolio) async {
    final isar = _isarService.isar;
    portfolio.updatedAt = DateTime.now();
    portfolio.version++;
    await isar.writeTxn(() async {
      await isar.investmentPortfolioIsars.put(portfolio);
    });
  }

  @override
  Future<void> deletePortfolio(String portfolioId) async {
    final isar = _isarService.isar;
    await isar.writeTxn(() async {
      final portfolio = await getPortfolioById(portfolioId);
      if (portfolio != null) {
        portfolio.isDeleted = true;
        portfolio.updatedAt = DateTime.now();
        portfolio.version++;
        await isar.investmentPortfolioIsars.put(portfolio);
        
        // Also delete all investments in this portfolio
        final investments = await getInvestmentsByPortfolio(portfolioId);
        for (final investment in investments) {
          investment.isDeleted = true;
          investment.updatedAt = DateTime.now();
          investment.version++;
          await isar.investmentIsars.put(investment);
        }
      }
    });
  }

  @override
  Future<void> updateInvestmentPrices(List<InvestmentIsar> investments) async {
    final isar = _isarService.isar;
    await isar.writeTxn(() async {
      for (final investment in investments) {
        investment.lastUpdated = DateTime.now();
        investment.updatedAt = DateTime.now();
        investment.version++;
        await isar.investmentIsars.put(investment);
      }
      
      // Update portfolio values
      final portfolioIds = investments.map((i) => i.portfolioId).toSet();
      for (final portfolioId in portfolioIds) {
        await _updatePortfolioValue(portfolioId);
      }
    });
  }

  @override
  Future<List<InvestmentIsar>> getInvestmentsByPortfolio(String portfolioId) async {
    final investments = await _activeInvestments();
    return investments.where((investment) => investment.portfolioId == portfolioId).toList();
  }

  @override
  Future<double> getTotalPortfolioValue(String portfolioId) async {
    final investments = await getInvestmentsByPortfolio(portfolioId);
    return investments.fold<double>(0.0, (sum, investment) => sum + investment.currentValue);
  }

  @override
  Future<double> getTotalPortfolioCost(String portfolioId) async {
    final investments = await getInvestmentsByPortfolio(portfolioId);
    return investments.fold<double>(0.0, (sum, investment) => sum + investment.totalCost);
  }

  @override
  Future<double> getTotalPortfolioGainLoss(String portfolioId) async {
    final investments = await getInvestmentsByPortfolio(portfolioId);
    return investments.fold<double>(0.0, (sum, investment) => sum + investment.unrealizedGainLoss);
  }

  @override
  Future<Map<String, double>> getPortfolioAllocation(String portfolioId) async {
    final investments = await getInvestmentsByPortfolio(portfolioId);
    final totalValue = investments.fold(0.0, (sum, investment) => sum + investment.currentValue);
    
    final allocation = <String, double>{};
    for (final investment in investments) {
      final percentage = totalValue > 0 ? (investment.currentValue / totalValue) * 100 : 0.0;
      allocation[investment.name] = percentage;
    }
    
    return allocation;
  }

  @override
  Future<List<InvestmentIsar>> getTopPerformers(String portfolioId, int limit) async {
    final investments = await getInvestmentsByPortfolio(portfolioId);
    investments.sort((a, b) => b.unrealizedGainLossPercentage.compareTo(a.unrealizedGainLossPercentage));
    return investments.take(limit).toList();
  }

  @override
  Future<List<InvestmentIsar>> getWorstPerformers(String portfolioId, int limit) async {
    final investments = await getInvestmentsByPortfolio(portfolioId);
    investments.sort((a, b) => a.unrealizedGainLossPercentage.compareTo(b.unrealizedGainLossPercentage));
    return investments.take(limit).toList();
  }

  Future<void> _updatePortfolioValue(String portfolioId) async {
    final portfolio = await getPortfolioById(portfolioId);
    if (portfolio != null) {
      final totalValue = await getTotalPortfolioValue(portfolioId);
      final totalCost = await getTotalPortfolioCost(portfolioId);
      
      portfolio.totalValue = totalValue;
      portfolio.totalCost = totalCost;
      portfolio.updatedAt = DateTime.now();
      portfolio.version++;
      
      final isar = _isarService.isar;
      await isar.investmentPortfolioIsars.put(portfolio);
    }
  }
}
