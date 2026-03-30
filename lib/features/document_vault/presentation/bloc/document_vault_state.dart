part of 'document_vault_bloc.dart';

enum DocumentVaultStatus { initial, loading, success, failure }

enum DocumentFilter { all, type, category, tag, search }

class DocumentVaultState extends Equatable {
  final DocumentVaultStatus status;
  final List<DocumentIsar> documents;
  final List<DocumentIsar> filteredDocuments;
  final List<String> categories;
  final List<String> tags;
  final String? selectedDocumentId;
  final DocumentFilter selectedFilter;
  final DocumentType? selectedType;
  final String? selectedCategory;
  final String? selectedTag;
  final String? searchQuery;
  final double totalStorageUsed;
  final List<DocumentIsar> expiringDocuments;
  final String? errorMessage;

  const DocumentVaultState({
    this.status = DocumentVaultStatus.initial,
    this.documents = const [],
    this.filteredDocuments = const [],
    this.categories = const [],
    this.tags = const [],
    this.selectedDocumentId,
    this.selectedFilter = DocumentFilter.all,
    this.selectedType,
    this.selectedCategory,
    this.selectedTag,
    this.searchQuery,
    this.totalStorageUsed = 0.0,
    this.expiringDocuments = const [],
    this.errorMessage,
  });

  DocumentVaultState copyWith({
    DocumentVaultStatus? status,
    List<DocumentIsar>? documents,
    List<DocumentIsar>? filteredDocuments,
    List<String>? categories,
    List<String>? tags,
    String? selectedDocumentId,
    DocumentFilter? selectedFilter,
    DocumentType? selectedType,
    String? selectedCategory,
    String? selectedTag,
    String? searchQuery,
    double? totalStorageUsed,
    List<DocumentIsar>? expiringDocuments,
    String? errorMessage,
  }) {
    return DocumentVaultState(
      status: status ?? this.status,
      documents: documents ?? this.documents,
      filteredDocuments: filteredDocuments ?? this.filteredDocuments,
      categories: categories ?? this.categories,
      tags: tags ?? this.tags,
      selectedDocumentId: selectedDocumentId ?? this.selectedDocumentId,
      selectedFilter: selectedFilter ?? this.selectedFilter,
      selectedType: selectedType ?? this.selectedType,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedTag: selectedTag ?? this.selectedTag,
      searchQuery: searchQuery ?? this.searchQuery,
      totalStorageUsed: totalStorageUsed ?? this.totalStorageUsed,
      expiringDocuments: expiringDocuments ?? this.expiringDocuments,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        documents,
        filteredDocuments,
        categories,
        tags,
        selectedDocumentId,
        selectedFilter,
        selectedType,
        selectedCategory,
        selectedTag,
        searchQuery,
        totalStorageUsed,
        expiringDocuments,
        errorMessage,
      ];

  int get totalDocuments => documents.length;

  int get filteredDocumentCount => filteredDocuments.length;

  String get formattedStorageUsed {
    if (totalStorageUsed < 1024 * 1024) {
      return '${(totalStorageUsed / 1024).toStringAsFixed(1)} KB';
    } else if (totalStorageUsed < 1024 * 1024 * 1024) {
      return '${(totalStorageUsed / (1024 * 1024)).toStringAsFixed(1)} MB';
    } else {
      return '${(totalStorageUsed / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
    }
  }

  Map<DocumentType, int> get documentTypeCount {
    final counts = <DocumentType, int>{};
    for (final document in documents) {
      counts[document.type] = (counts[document.type] ?? 0) + 1;
    }
    return counts;
  }

  List<DocumentIsar> get recentDocuments {
    final sortedDocs = List<DocumentIsar>.from(documents);
    sortedDocs.sort((a, b) => b.uploadDate.compareTo(a.uploadDate));
    return sortedDocs.take(10).toList();
  }

  List<DocumentIsar> get expiredDocuments {
    return documents.where((doc) => doc.isExpired).toList();
  }

  bool get hasSelectedDocument => selectedDocumentId != null;

  String get selectedFilterDisplayName {
    switch (selectedFilter) {
      case DocumentFilter.all:
        return 'All Documents';
      case DocumentFilter.type:
        return selectedType?.displayName ?? 'Type';
      case DocumentFilter.category:
        return selectedCategory ?? 'Category';
      case DocumentFilter.tag:
        return selectedTag ?? 'Tag';
      case DocumentFilter.search:
        return 'Search: "$searchQuery"';
    }
  }
}
