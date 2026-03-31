import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/investment_isar.dart';
import '../../data/repositories/investment_repository.dart';

part 'investment_event.dart';
part 'investment_state.dart';

class InvestmentBloc extends Bloc<InvestmentEvent, InvestmentState> {
  final InvestmentRepository _repository;

  InvestmentBloc(this._repository) : super(const InvestmentState()) {
    on<LoadInvestments>(_onLoadInvestments);
    on<LoadPortfolios>(_onLoadPortfolios);
    on<SelectPortfolio>(_onSelectPortfolio);
    on<AddInvestment>(_onAddInvestment);
    on<UpdateInvestment>(_onUpdateInvestment);
    on<DeleteInvestment>(_onDeleteInvestment);
    on<AddPortfolio>(_onAddPortfolio);
    on<UpdatePortfolio>(_onUpdatePortfolio);
    on<DeletePortfolio>(_onDeletePortfolio);
    on<RefreshInvestments>(_onRefreshInvestments);
  }

  Future<void> _onLoadInvestments(LoadInvestments event, Emitter<InvestmentState> emit) async {
    emit(state.copyWith(status: InvestmentStatus.loading));
    try {
      final investments = await _repository.getAllInvestments();
      final portfolios = await _repository.getAllPortfolios();
      
      emit(state.copyWith(
        status: InvestmentStatus.success,
        investments: investments,
        portfolios: portfolios,
      ));

      // Select first portfolio if none selected
      if (state.selectedPortfolioId == null && portfolios.isNotEmpty) {
        add(SelectPortfolio(portfolios.first.portfolioId));
      }
    } catch (e) {
      emit(state.copyWith(
        status: InvestmentStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onLoadPortfolios(LoadPortfolios event, Emitter<InvestmentState> emit) async {
    try {
      final portfolios = await _repository.getAllPortfolios();
      emit(state.copyWith(portfolios: portfolios));
    } catch (e) {
      emit(state.copyWith(
        status: InvestmentStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onSelectPortfolio(SelectPortfolio event, Emitter<InvestmentState> emit) async {
    emit(state.copyWith(status: InvestmentStatus.loading));
    try {
      final portfolio = await _repository.getPortfolioById(event.portfolioId);
      final investments = await _repository.getInvestmentsByPortfolio(event.portfolioId);
      final totalValue = await _repository.getTotalPortfolioValue(event.portfolioId);
      final totalCost = await _repository.getTotalPortfolioCost(event.portfolioId);
      final totalGainLoss = await _repository.getTotalPortfolioGainLoss(event.portfolioId);
      final allocation = await _repository.getPortfolioAllocation(event.portfolioId);
      final topPerformers = await _repository.getTopPerformers(event.portfolioId, 5);
      final worstPerformers = await _repository.getWorstPerformers(event.portfolioId, 5);

      emit(state.copyWith(
        status: InvestmentStatus.success,
        selectedPortfolioId: event.portfolioId,
        selectedPortfolio: portfolio,
        currentInvestments: investments,
        totalPortfolioValue: totalValue,
        totalPortfolioCost: totalCost,
        totalPortfolioGainLoss: totalGainLoss,
        portfolioAllocation: allocation,
        topPerformers: topPerformers,
        worstPerformers: worstPerformers,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: InvestmentStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onAddInvestment(AddInvestment event, Emitter<InvestmentState> emit) async {
    try {
      await _repository.addInvestment(event.investment);
      add(const LoadInvestments());
      if (state.selectedPortfolioId != null) {
        add(SelectPortfolio(state.selectedPortfolioId!));
      }
    } catch (e) {
      emit(state.copyWith(
        status: InvestmentStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onUpdateInvestment(UpdateInvestment event, Emitter<InvestmentState> emit) async {
    try {
      await _repository.updateInvestment(event.investment);
      add(const LoadInvestments());
      if (state.selectedPortfolioId != null) {
        add(SelectPortfolio(state.selectedPortfolioId!));
      }
    } catch (e) {
      emit(state.copyWith(
        status: InvestmentStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onDeleteInvestment(DeleteInvestment event, Emitter<InvestmentState> emit) async {
    try {
      await _repository.deleteInvestment(event.investmentId);
      add(const LoadInvestments());
      if (state.selectedPortfolioId != null) {
        add(SelectPortfolio(state.selectedPortfolioId!));
      }
    } catch (e) {
      emit(state.copyWith(
        status: InvestmentStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onAddPortfolio(AddPortfolio event, Emitter<InvestmentState> emit) async {
    try {
      await _repository.addPortfolio(event.portfolio);
      add(const LoadPortfolios());
      add(SelectPortfolio(event.portfolio.portfolioId));
    } catch (e) {
      emit(state.copyWith(
        status: InvestmentStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onUpdatePortfolio(UpdatePortfolio event, Emitter<InvestmentState> emit) async {
    try {
      await _repository.updatePortfolio(event.portfolio);
      add(const LoadPortfolios());
    } catch (e) {
      emit(state.copyWith(
        status: InvestmentStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onDeletePortfolio(DeletePortfolio event, Emitter<InvestmentState> emit) async {
    try {
      await _repository.deletePortfolio(event.portfolioId);
      add(const LoadPortfolios());
      // Select first available portfolio
      final portfolios = await _repository.getAllPortfolios();
      if (portfolios.isNotEmpty) {
        add(SelectPortfolio(portfolios.first.portfolioId));
      } else {
        emit(state.copyWith(selectedPortfolioId: null, selectedPortfolio: null));
      }
    } catch (e) {
      emit(state.copyWith(
        status: InvestmentStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onRefreshInvestments(RefreshInvestments event, Emitter<InvestmentState> emit) async {
    add(const LoadInvestments());
  }
}
