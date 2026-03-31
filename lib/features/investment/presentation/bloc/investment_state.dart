part of 'investment_bloc.dart';

enum InvestmentStatus { initial, loading, success, failure }

class InvestmentState extends Equatable {
  final InvestmentStatus status;
  final List<InvestmentIsar> investments;
  final List<InvestmentPortfolioIsar> portfolios;
  final String? selectedPortfolioId;
  final InvestmentPortfolioIsar? selectedPortfolio;
  final List<InvestmentIsar> currentInvestments;
  final double totalPortfolioValue;
  final double totalPortfolioCost;
  final double totalPortfolioGainLoss;
  final Map<String, double> portfolioAllocation;
  final List<InvestmentIsar> topPerformers;
  final List<InvestmentIsar> worstPerformers;
  final String? errorMessage;

  const InvestmentState({
    this.status = InvestmentStatus.initial,
    this.investments = const [],
    this.portfolios = const [],
    this.selectedPortfolioId,
    this.selectedPortfolio,
    this.currentInvestments = const [],
    this.totalPortfolioValue = 0.0,
    this.totalPortfolioCost = 0.0,
    this.totalPortfolioGainLoss = 0.0,
    this.portfolioAllocation = const {},
    this.topPerformers = const [],
    this.worstPerformers = const [],
    this.errorMessage,
  });

  InvestmentState copyWith({
    InvestmentStatus? status,
    List<InvestmentIsar>? investments,
    List<InvestmentPortfolioIsar>? portfolios,
    String? selectedPortfolioId,
    InvestmentPortfolioIsar? selectedPortfolio,
    List<InvestmentIsar>? currentInvestments,
    double? totalPortfolioValue,
    double? totalPortfolioCost,
    double? totalPortfolioGainLoss,
    Map<String, double>? portfolioAllocation,
    List<InvestmentIsar>? topPerformers,
    List<InvestmentIsar>? worstPerformers,
    String? errorMessage,
  }) {
    return InvestmentState(
      status: status ?? this.status,
      investments: investments ?? this.investments,
      portfolios: portfolios ?? this.portfolios,
      selectedPortfolioId: selectedPortfolioId ?? this.selectedPortfolioId,
      selectedPortfolio: selectedPortfolio ?? this.selectedPortfolio,
      currentInvestments: currentInvestments ?? this.currentInvestments,
      totalPortfolioValue: totalPortfolioValue ?? this.totalPortfolioValue,
      totalPortfolioCost: totalPortfolioCost ?? this.totalPortfolioCost,
      totalPortfolioGainLoss: totalPortfolioGainLoss ?? this.totalPortfolioGainLoss,
      portfolioAllocation: portfolioAllocation ?? this.portfolioAllocation,
      topPerformers: topPerformers ?? this.topPerformers,
      worstPerformers: worstPerformers ?? this.worstPerformers,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        investments,
        portfolios,
        selectedPortfolioId,
        selectedPortfolio,
        currentInvestments,
        totalPortfolioValue,
        totalPortfolioCost,
        totalPortfolioGainLoss,
        portfolioAllocation,
        topPerformers,
        worstPerformers,
        errorMessage,
      ];

  double get totalPortfolioGainLossPercentage {
    if (totalPortfolioCost == 0) return 0.0;
    return (totalPortfolioGainLoss / totalPortfolioCost) * 100;
  }

  int get totalInvestments => currentInvestments.length;

  int get profitableInvestments => currentInvestments.where((inv) => inv.isProfitable).length;

  int get losingInvestments => currentInvestments.where((inv) => inv.isLoss).length;

  bool get hasSelectedPortfolio => selectedPortfolioId != null;

  String get selectedPortfolioName => selectedPortfolio?.name ?? 'No Portfolio Selected';
}
