import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import '../../../expense/domain/entitities/Expense.dart';
import '../../../expense/domain/repositories/expense_repository.dart';
import '../../data/models/receipt_extraction_isar.dart';
import '../../data/models/receipt_rule.dart';
import '../../data/repositories/receipt_ocr_repository.dart';

part 'receipt_ocr_event.dart';
part 'receipt_ocr_state.dart';

class ReceiptOcrBloc extends Bloc<ReceiptOcrEvent, ReceiptOcrState> {
  static const smartRulesKey = 'receipt_smart_rules_v1';

  final ReceiptOcrRepository _repository;
  final ExpenseRepository _expenseRepository;
  final SharedPreferences _prefs;

  ReceiptOcrBloc(
    this._repository,
    this._expenseRepository,
    this._prefs,
  ) : super(const ReceiptOcrState()) {
    on<CaptureReceipt>((event, emit) async {
      await _onCaptureReceipt(emit);
    });
    
    on<PickReceiptFromGallery>((event, emit) async {
      await _onPickReceiptFromGallery(emit);
    });
    
    on<ProcessReceipt>((event, emit) async {
      await _onProcessReceipt(event.imagePath, emit);
    });
    
    on<LoadRecentExtractions>((event, emit) async {
      await _onLoadRecentExtractions(emit);
    });
    
    on<LoadExtractionsByStatus>((event, emit) async {
      await _onLoadExtractionsByStatus(event.status, emit);
    });
    
    on<SearchExtractions>((event, emit) async {
      await _onSearchExtractions(event.query, emit);
    });
    
    on<UpdateExtraction>((event, emit) async {
      await _onUpdateExtraction(event.extraction, emit);
    });
    
    on<DeleteExtraction>((event, emit) async {
      await _onDeleteExtraction(event.extractionId, emit);
    });
    
    on<RetryExtraction>((event, emit) async {
      await _onRetryExtraction(event.extractionId, emit);
    });
    
    on<LoadStatistics>((event, emit) async {
      await _onLoadStatistics(emit);
    });
    
    on<LoadPopularMerchants>((event, emit) async {
      await _onLoadPopularMerchants(emit);
    });
    
    on<SelectExtraction>((event, emit) async {
      emit(state.copyWith(selectedExtraction: event.extraction));
    });
    
    on<ClearSelection>((event, emit) async {
      emit(state.copyWith(selectedExtraction: null));
    });
  }

  Future<void> _onCaptureReceipt(Emitter<ReceiptOcrState> emit) async {
    emit(state.copyWith(status: ReceiptOcrStatus.loading));
    
    try {
      final imagePath = await _repository.captureReceiptFromCamera();
      if (imagePath != null) {
        emit(state.copyWith(
          status: ReceiptOcrStatus.imageCaptured,
          capturedImagePath: imagePath,
        ));
      } else {
        emit(state.copyWith(
          status: ReceiptOcrStatus.error,
          errorMessage: 'No image captured',
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: ReceiptOcrStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onPickReceiptFromGallery(Emitter<ReceiptOcrState> emit) async {
    emit(state.copyWith(status: ReceiptOcrStatus.loading));
    
    try {
      final imagePath = await _repository.pickReceiptFromGallery();
      if (imagePath != null) {
        emit(state.copyWith(
          status: ReceiptOcrStatus.imageSelected,
          capturedImagePath: imagePath,
        ));
      } else {
        emit(state.copyWith(
          status: ReceiptOcrStatus.error,
          errorMessage: 'No image selected',
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: ReceiptOcrStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onProcessReceipt(String imagePath, Emitter<ReceiptOcrState> emit) async {
    emit(state.copyWith(status: ReceiptOcrStatus.processing));
    
    try {
      final extraction = await _repository.processReceipt(imagePath);
      await _applySmartRules(extraction);
      emit(state.copyWith(
        status: ReceiptOcrStatus.processed,
        recentExtractions: [extraction, ...state.recentExtractions],
      ));
      
      // Reload recent extractions
      add(const LoadRecentExtractions());
    } catch (e) {
      emit(state.copyWith(
        status: ReceiptOcrStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onLoadRecentExtractions(Emitter<ReceiptOcrState> emit) async {
    emit(state.copyWith(status: ReceiptOcrStatus.loading));
    
    try {
      final extractions = await _repository.getRecentExtractions();
      emit(state.copyWith(
        status: ReceiptOcrStatus.loaded,
        recentExtractions: extractions,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ReceiptOcrStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onLoadExtractionsByStatus(
    ExtractionStatus status,
    Emitter<ReceiptOcrState> emit,
  ) async {
    emit(state.copyWith(status: ReceiptOcrStatus.loading));
    
    try {
      final extractions = await _repository.getExtractionsByStatus(status);
      emit(state.copyWith(
        status: ReceiptOcrStatus.loaded,
        recentExtractions: extractions,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ReceiptOcrStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onSearchExtractions(String query, Emitter<ReceiptOcrState> emit) async {
    emit(state.copyWith(status: ReceiptOcrStatus.loading));
    
    try {
      final extractions = await _repository.searchExtractions(query);
      emit(state.copyWith(
        status: ReceiptOcrStatus.loaded,
        recentExtractions: extractions,
        searchQuery: query,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ReceiptOcrStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onUpdateExtraction(
    ReceiptExtractionIsar extraction,
    Emitter<ReceiptOcrState> emit,
  ) async {
    emit(state.copyWith(status: ReceiptOcrStatus.loading));
    
    try {
      await _repository.updateExtraction(extraction);
      
      // Update in local list
      final updatedExtractions = state.recentExtractions.map((e) {
        return e.extractionId == extraction.extractionId ? extraction : e;
      }).toList();
      
      emit(state.copyWith(
        status: ReceiptOcrStatus.updated,
        recentExtractions: updatedExtractions,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ReceiptOcrStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onDeleteExtraction(
    String extractionId,
    Emitter<ReceiptOcrState> emit,
  ) async {
    emit(state.copyWith(status: ReceiptOcrStatus.loading));
    
    try {
      await _repository.deleteExtraction(extractionId);
      
      // Remove from local list
      final updatedExtractions = state.recentExtractions
          .where((e) => e.extractionId != extractionId)
          .toList();
      
      emit(state.copyWith(
        status: ReceiptOcrStatus.deleted,
        recentExtractions: updatedExtractions,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ReceiptOcrStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onRetryExtraction(
    String extractionId,
    Emitter<ReceiptOcrState> emit,
  ) async {
    emit(state.copyWith(status: ReceiptOcrStatus.loading));
    
    try {
      await _repository.retryExtraction(extractionId);
      
      // Reload extractions
      add(const LoadRecentExtractions());
    } catch (e) {
      emit(state.copyWith(
        status: ReceiptOcrStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onLoadStatistics(Emitter<ReceiptOcrState> emit) async {
    try {
      final stats = await _repository.getExtractionStatistics();
      emit(state.copyWith(statistics: stats));
    } catch (e) {
      // Don't change status, just log the error
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  Future<void> _onLoadPopularMerchants(Emitter<ReceiptOcrState> emit) async {
    try {
      final merchants = await _repository.getPopularMerchants();
      emit(state.copyWith(popularMerchants: merchants));
    } catch (e) {
      // Don't change status, just log the error
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  Future<void> _applySmartRules(ReceiptExtractionIsar extraction) async {
    if (extraction.totalAmount == null || extraction.totalAmount! <= 0) {
      return;
    }

    final merchantName = extraction.merchantName?.trim();
    if (merchantName == null || merchantName.isEmpty) {
      return;
    }

    final rawRules = _prefs.getString(smartRulesKey);
    if (rawRules == null || rawRules.isEmpty) {
      return;
    }

    final rules = (jsonDecode(rawRules) as List<dynamic>)
        .map((item) => ReceiptSmartRule.fromJson(item as Map<String, dynamic>))
        .toList();

    final merchantLower = merchantName.toLowerCase();
    final matchedRule = rules.where((rule) => rule.autoCreateExpense).firstWhere(
          (rule) => merchantLower.contains(rule.merchantKeyword.toLowerCase()),
          orElse: () => const ReceiptSmartRule(
            id: '',
            merchantKeyword: '',
            category: '',
            autoCreateExpense: false,
          ),
        );

    if (!matchedRule.autoCreateExpense || matchedRule.merchantKeyword.isEmpty) {
      return;
    }

    final expense = Expense(
      id: const Uuid().v4(),
      groupId: 'default',
      title: matchedRule.titlePrefix?.trim().isNotEmpty == true
          ? '${matchedRule.titlePrefix} ${merchantName}'.trim()
          : merchantName,
      amount: extraction.totalAmount!,
      paidBy: 'local-user',
      category: matchedRule.category,
      splits: {'local-user': extraction.totalAmount!},
      updatedAt: DateTime.now().toUtc(),
      version: 1,
      isDeleted: false,
    );

    await _expenseRepository.addExpense(expense);
  }
}

enum ReceiptOcrStatus {
  initial,
  loading,
  imageCaptured,
  imageSelected,
  processing,
  processed,
  loaded,
  updated,
  deleted,
  error,
}

class ReceiptOcrState extends Equatable {
  const ReceiptOcrState({
    this.status = ReceiptOcrStatus.initial,
    this.recentExtractions = const [],
    this.selectedExtraction,
    this.capturedImagePath,
    this.searchQuery = '',
    this.statistics = const {},
    this.popularMerchants = const [],
    this.errorMessage,
  });

  final ReceiptOcrStatus status;
  final List<ReceiptExtractionIsar> recentExtractions;
  final ReceiptExtractionIsar? selectedExtraction;
  final String? capturedImagePath;
  final String searchQuery;
  final Map<String, int> statistics;
  final List<String> popularMerchants;
  final String? errorMessage;

  ReceiptOcrState copyWith({
    ReceiptOcrStatus? status,
    List<ReceiptExtractionIsar>? recentExtractions,
    ReceiptExtractionIsar? selectedExtraction,
    String? capturedImagePath,
    String? searchQuery,
    Map<String, int>? statistics,
    List<String>? popularMerchants,
    String? errorMessage,
  }) {
    return ReceiptOcrState(
      status: status ?? this.status,
      recentExtractions: recentExtractions ?? this.recentExtractions,
      selectedExtraction: selectedExtraction ?? this.selectedExtraction,
      capturedImagePath: capturedImagePath ?? this.capturedImagePath,
      searchQuery: searchQuery ?? this.searchQuery,
      statistics: statistics ?? this.statistics,
      popularMerchants: popularMerchants ?? this.popularMerchants,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
        status,
        recentExtractions,
        selectedExtraction ?? '',
        capturedImagePath ?? '',
        searchQuery,
        statistics,
        popularMerchants,
        errorMessage ?? '',
      ];
}
