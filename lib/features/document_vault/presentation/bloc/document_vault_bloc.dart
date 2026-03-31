import 'dart:io' show Directory, File, Platform;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../data/models/document_isar.dart';
import '../../data/repositories/document_repository.dart';

part 'document_vault_event.dart';
part 'document_vault_state.dart';

class DocumentVaultBloc extends Bloc<DocumentVaultEvent, DocumentVaultState> {
  final DocumentRepository _repository;

  DocumentVaultBloc(this._repository) : super(const DocumentVaultState()) {
    on<LoadDocuments>(_onLoadDocuments);
    on<AddDocument>(_onAddDocument);
    on<UpdateDocument>(_onUpdateDocument);
    on<DeleteDocument>(_onDeleteDocument);
    on<FilterByType>(_onFilterByType);
    on<FilterByCategory>(_onFilterByCategory);
    on<FilterByTag>(_onFilterByTag);
    on<SearchDocuments>(_onSearchDocuments);
    on<SelectDocument>(_onSelectDocument);
    on<AddTagToDocument>(_onAddTagToDocument);
    on<RemoveTagFromDocument>(_onRemoveTagFromDocument);
    on<RefreshDocuments>(_onRefreshDocuments);
    on<UploadFile>(_onUploadFile);
    on<UploadImage>(_onUploadImage);
    on<EncryptDocument>(_onEncryptDocument);
    on<DecryptDocument>(_onDecryptDocument);
  }

  Future<void> _onLoadDocuments(LoadDocuments event, Emitter<DocumentVaultState> emit) async {
    emit(state.copyWith(status: DocumentVaultStatus.loading));
    try {
      final documents = await _repository.getAllDocuments();
      final categories = await _repository.getAllCategories();
      final tags = await _repository.getAllTags();
      final totalStorage = await _repository.getTotalStorageUsed();
      final expiringDocuments = await _repository.getExpiringDocuments(30);

      emit(state.copyWith(
        status: DocumentVaultStatus.success,
        documents: documents,
        filteredDocuments: documents,
        categories: categories,
        tags: tags,
        totalStorageUsed: totalStorage,
        expiringDocuments: expiringDocuments,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: DocumentVaultStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onAddDocument(AddDocument event, Emitter<DocumentVaultState> emit) async {
    try {
      await _repository.addDocument(event.document);
      add(const LoadDocuments());
    } catch (e) {
      emit(state.copyWith(
        status: DocumentVaultStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onUpdateDocument(UpdateDocument event, Emitter<DocumentVaultState> emit) async {
    try {
      await _repository.updateDocument(event.document);
      add(const LoadDocuments());
    } catch (e) {
      emit(state.copyWith(
        status: DocumentVaultStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onDeleteDocument(DeleteDocument event, Emitter<DocumentVaultState> emit) async {
    try {
      await _repository.deleteDocument(event.documentId);
      add(const LoadDocuments());
    } catch (e) {
      emit(state.copyWith(
        status: DocumentVaultStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onFilterByType(FilterByType event, Emitter<DocumentVaultState> emit) async {
    emit(state.copyWith(status: DocumentVaultStatus.loading));
    try {
      final documents = await _repository.getDocumentsByType(event.type);
      emit(state.copyWith(
        status: DocumentVaultStatus.success,
        filteredDocuments: documents,
        selectedFilter: DocumentFilter.type,
        selectedType: event.type,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: DocumentVaultStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onFilterByCategory(FilterByCategory event, Emitter<DocumentVaultState> emit) async {
    emit(state.copyWith(status: DocumentVaultStatus.loading));
    try {
      final documents = await _repository.getDocumentsByCategory(event.category);
      emit(state.copyWith(
        status: DocumentVaultStatus.success,
        filteredDocuments: documents,
        selectedFilter: DocumentFilter.category,
        selectedCategory: event.category,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: DocumentVaultStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onFilterByTag(FilterByTag event, Emitter<DocumentVaultState> emit) async {
    emit(state.copyWith(status: DocumentVaultStatus.loading));
    try {
      final documents = await _repository.getDocumentsByTag(event.tag);
      emit(state.copyWith(
        status: DocumentVaultStatus.success,
        filteredDocuments: documents,
        selectedFilter: DocumentFilter.tag,
        selectedTag: event.tag,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: DocumentVaultStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onSearchDocuments(SearchDocuments event, Emitter<DocumentVaultState> emit) async {
    emit(state.copyWith(status: DocumentVaultStatus.loading));
    try {
      final documents = await _repository.searchDocuments(event.query);
      emit(state.copyWith(
        status: DocumentVaultStatus.success,
        filteredDocuments: documents,
        selectedFilter: DocumentFilter.search,
        searchQuery: event.query,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: DocumentVaultStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onSelectDocument(SelectDocument event, Emitter<DocumentVaultState> emit) async {
    emit(state.copyWith(selectedDocumentId: event.documentId));
  }

  Future<void> _onAddTagToDocument(AddTagToDocument event, Emitter<DocumentVaultState> emit) async {
    try {
      await _repository.addTagToDocument(event.documentId, event.tag);
      add(const LoadDocuments());
    } catch (e) {
      emit(state.copyWith(
        status: DocumentVaultStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onRemoveTagFromDocument(RemoveTagFromDocument event, Emitter<DocumentVaultState> emit) async {
    try {
      await _repository.removeTagFromDocument(event.documentId, event.tag);
      add(const LoadDocuments());
    } catch (e) {
      emit(state.copyWith(
        status: DocumentVaultStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onRefreshDocuments(RefreshDocuments event, Emitter<DocumentVaultState> emit) async {
    add(const LoadDocuments());
  }

  Future<void> _onUploadFile(UploadFile event, Emitter<DocumentVaultState> emit) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx', 'txt', 'jpg', 'jpeg', 'png'],
      );

      if (result != null && result.files.single.path != null) {
        final file = File(result.files.single.path!);
        await _saveDocument(file, result.files.single.name);
      }
    } catch (e) {
      emit(state.copyWith(
        status: DocumentVaultStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onUploadImage(UploadImage event, Emitter<DocumentVaultState> emit) async {
    try {
      if (event.source == ImageSource.camera) {
        final camera = await Permission.camera.request();
        if (!camera.isGranted) {
          emit(state.copyWith(
            status: DocumentVaultStatus.failure,
            errorMessage: 'Camera permission denied',
          ));
          return;
        }
      } else if (event.source == ImageSource.gallery) {
        if (!kIsWeb && Platform.isIOS) {
          final photos = await Permission.photos.request();
          if (!photos.isGranted && !photos.isLimited) {
            emit(state.copyWith(
              status: DocumentVaultStatus.failure,
              errorMessage: 'Photos permission denied',
            ));
            return;
          }
        }
      }

      final picker = ImagePicker();
      final result = await picker.pickImage(
        source: event.source,
        imageQuality: 85,
        maxWidth: 4096,
        maxHeight: 4096,
      );

      if (result != null) {
        final file = File(result.path);
        await _saveDocument(file, result.name);
      }
    } catch (e) {
      emit(state.copyWith(
        status: DocumentVaultStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onEncryptDocument(EncryptDocument event, Emitter<DocumentVaultState> emit) async {
    try {
      await _repository.encryptDocument(event.documentId);
      add(const LoadDocuments());
    } catch (e) {
      emit(state.copyWith(
        status: DocumentVaultStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onDecryptDocument(DecryptDocument event, Emitter<DocumentVaultState> emit) async {
    try {
      await _repository.decryptDocument(event.documentId);
      add(const LoadDocuments());
    } catch (e) {
      emit(state.copyWith(
        status: DocumentVaultStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _saveDocument(File file, String fileName) async {
    final appDir = await getApplicationDocumentsDirectory();
    final documentsDir = Directory('${appDir.path}/documents');
    
    if (!await documentsDir.exists()) {
      await documentsDir.create(recursive: true);
    }

    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final savedFile = await file.copy('${documentsDir.path}/$timestamp-$fileName');
    
    final fileSize = await savedFile.length();
    final fileType = _getDocumentType(fileName);
    
    final document = DocumentIsar()
      ..documentId = timestamp.toString()
      ..fileName = fileName
      ..filePath = savedFile.path
      ..thumbnailPath = null
      ..type = fileType
      ..category = null
      ..tags = null
      ..fileSize = fileSize.toDouble()
      ..uploadDate = DateTime.now()
      ..expirationDate = null
      ..description = null
      ..isEncrypted = false
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..isDeleted = false;

    add(AddDocument(document));
  }

  DocumentType _getDocumentType(String fileName) {
    final extension = fileName.toLowerCase().split('.').last;
    
    switch (extension) {
      case 'pdf':
        return DocumentType.pdf;
      case 'jpg':
      case 'jpeg':
      case 'png':
        return DocumentType.photo;
      case 'doc':
      case 'docx':
        return DocumentType.contract;
      case 'txt':
        return DocumentType.other;
      default:
        return DocumentType.other;
    }
  }
}
