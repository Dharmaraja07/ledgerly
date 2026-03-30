part of 'investment_bloc.dart';

abstract class InvestmentEvent extends Equatable {
  const InvestmentEvent();

  @override
  List<Object> get props => [];
}

class LoadInvestments extends InvestmentEvent {
  const LoadInvestments();
}

class LoadPortfolios extends InvestmentEvent {
  const LoadPortfolios();
}

class SelectPortfolio extends InvestmentEvent {
  final String portfolioId;

  const SelectPortfolio(this.portfolioId);

  @override
  List<Object> get props => [portfolioId];
}

class AddInvestment extends InvestmentEvent {
  final InvestmentIsar investment;

  const AddInvestment(this.investment);

  @override
  List<Object> get props => [investment];
}

class UpdateInvestment extends InvestmentEvent {
  final InvestmentIsar investment;

  const UpdateInvestment(this.investment);

  @override
  List<Object> get props => [investment];
}

class DeleteInvestment extends InvestmentEvent {
  final String investmentId;

  const DeleteInvestment(this.investmentId);

  @override
  List<Object> get props => [investmentId];
}

class AddPortfolio extends InvestmentEvent {
  final InvestmentPortfolioIsar portfolio;

  const AddPortfolio(this.portfolio);

  @override
  List<Object> get props => [portfolio];
}

class UpdatePortfolio extends InvestmentEvent {
  final InvestmentPortfolioIsar portfolio;

  const UpdatePortfolio(this.portfolio);

  @override
  List<Object> get props => [portfolio];
}

class DeletePortfolio extends InvestmentEvent {
  final String portfolioId;

  const DeletePortfolio(this.portfolioId);

  @override
  List<Object> get props => [portfolioId];
}

class RefreshInvestments extends InvestmentEvent {
  const RefreshInvestments();
}
