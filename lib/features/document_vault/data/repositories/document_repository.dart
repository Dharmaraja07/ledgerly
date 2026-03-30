import '../../data/models/document_isar.dart';
import '../../../../core/database/isar_service.dart';
import 'dart:io';
import 'package:isar/isar.dart';

abstract class DocumentRepository {
  Future<List<DocumentIsar>> getAllDocuments();
  Future<List<DocumentIsar>> getDocumentsByType(DocumentType type);
  Future<List<DocumentIsar>> getDocumentsByCategory(String category);
  Future<List<DocumentIsar>> getDocumentsByTag(String tag);
  Future<DocumentIsar?> getDocumentById(String documentId);
  Future<void> addDocument(DocumentIsar document);
  Future<void> updateDocument(DocumentIsar document);
  Future<void> deleteDocument(String documentId);
  Future<void> addTagToDocument(String documentId, String tag);
  Future<void> removeTagFromDocument(String documentId, String tag);
  Future<List<String>> getAllCategories();
  Future<List<String>> getAllTags();
  Future<double> getTotalStorageUsed();
  Future<List<DocumentIsar>> searchDocuments(String query);
  Future<List<DocumentIsar>> getExpiringDocuments(int daysThreshold);
  Future<void> encryptDocument(String documentId);
  Future<void> decryptDocument(String documentId);
}

class DocumentRepositoryImpl implements DocumentRepository {
  final IsarService _isarService;

  DocumentRepositoryImpl(this._isarService);

  Future<List<DocumentIsar>> _activeDocuments() async {
    final documents = await _isarService.isar.documentIsars.where().findAll();
    final activeDocuments = documents.where((document) => !document.isDeleted).toList()
      ..sort((a, b) => b.uploadDate.compareTo(a.uploadDate));
    return activeDocuments;
  }

  @override
  Future<List<DocumentIsar>> getAllDocuments() async {
    return _activeDocuments();
  }

  @override
  Future<List<DocumentIsar>> getDocumentsByType(DocumentType type) async {
    final documents = await _activeDocuments();
    return documents.where((document) => document.type == type).toList();
  }

  @override
  Future<List<DocumentIsar>> getDocumentsByCategory(String category) async {
    final documents = await _activeDocuments();
    return documents.where((document) => document.category == category).toList();
  }

  @override
  Future<List<DocumentIsar>> getDocumentsByTag(String tag) async {
    final allDocuments = await getAllDocuments();
    return allDocuments.where((doc) => doc.hasTag(tag)).toList();
  }

  @override
  Future<DocumentIsar?> getDocumentById(String documentId) async {
    final documents = await _activeDocuments();
    try {
      return documents.firstWhere((document) => document.documentId == documentId);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> addDocument(DocumentIsar document) async {
    final isar = _isarService.isar;
    await isar.writeTxn(() async {
      await isar.documentIsars.put(document);
    });
  }

  @override
  Future<void> updateDocument(DocumentIsar document) async {
    final isar = _isarService.isar;
    document.updatedAt = DateTime.now();
    document.version++;
    await isar.writeTxn(() async {
      await isar.documentIsars.put(document);
    });
  }

  @override
  Future<void> deleteDocument(String documentId) async {
    final isar = _isarService.isar;
    await isar.writeTxn(() async {
      final document = await getDocumentById(documentId);
      if (document != null) {
        // Delete actual file
        try {
          final file = File(document.filePath);
          if (await file.exists()) {
            await file.delete();
          }
        } catch (e) {
          // Log error but continue with database deletion
          print('Error deleting file: $e');
        }

        // Delete thumbnail if exists
        if (document.thumbnailPath != null) {
          try {
            final thumbnailFile = File(document.thumbnailPath!);
            if (await thumbnailFile.exists()) {
              await thumbnailFile.delete();
            }
          } catch (e) {
            print('Error deleting thumbnail: $e');
          }
        }

        // Mark as deleted in database
        document.isDeleted = true;
        document.updatedAt = DateTime.now();
        document.version++;
        await isar.documentIsars.put(document);
      }
    });
  }

  @override
  Future<void> addTagToDocument(String documentId, String tag) async {
    final isar = _isarService.isar;
    await isar.writeTxn(() async {
      final document = await getDocumentById(documentId);
      if (document != null) {
        document.addTag(tag);
        document.updatedAt = DateTime.now();
        document.version++;
        await isar.documentIsars.put(document);
      }
    });
  }

  @override
  Future<void> removeTagFromDocument(String documentId, String tag) async {
    final isar = _isarService.isar;
    await isar.writeTxn(() async {
      final document = await getDocumentById(documentId);
      if (document != null) {
        document.removeTag(tag);
        document.updatedAt = DateTime.now();
        document.version++;
        await isar.documentIsars.put(document);
      }
    });
  }

  @override
  Future<List<String>> getAllCategories() async {
    final allDocuments = await getAllDocuments();
    final categories = <String>{};
    
    for (final document in allDocuments) {
      if (document.category != null && document.category!.isNotEmpty) {
        categories.add(document.category!);
      }
    }
    
    return categories.toList()..sort();
  }

  @override
  Future<List<String>> getAllTags() async {
    final allDocuments = await getAllDocuments();
    final allTags = <String>{};
    
    for (final document in allDocuments) {
      allTags.addAll(document.tagList);
    }
    
    return allTags.toList()..sort();
  }

  @override
  Future<double> getTotalStorageUsed() async {
    final allDocuments = await getAllDocuments();
    return allDocuments.fold<double>(0.0, (sum, document) => sum + document.fileSize);
  }

  @override
  Future<List<DocumentIsar>> searchDocuments(String query) async {
    final allDocuments = await getAllDocuments();
    final lowerQuery = query.toLowerCase();
    
    return allDocuments.where((document) {
      return document.fileName.toLowerCase().contains(lowerQuery) ||
             (document.description?.toLowerCase().contains(lowerQuery) ?? false) ||
             document.tagList.any((tag) => tag.toLowerCase().contains(lowerQuery)) ||
             (document.category?.toLowerCase().contains(lowerQuery) ?? false);
    }).toList();
  }

  @override
  Future<List<DocumentIsar>> getExpiringDocuments(int daysThreshold) async {
    final allDocuments = await getAllDocuments();
    final thresholdDate = DateTime.now().add(Duration(days: daysThreshold));
    
    return allDocuments.where((document) {
      return document.expirationDate != null && 
             document.expirationDate!.isBefore(thresholdDate) &&
             !document.isExpired;
    }).toList();
  }

  @override
  Future<void> encryptDocument(String documentId) async {
    final isar = _isarService.isar;
    await isar.writeTxn(() async {
      final document = await getDocumentById(documentId);
      if (document != null) {
        document.isEncrypted = true;
        document.updatedAt = DateTime.now();
        document.version++;
        await isar.documentIsars.put(document);
      }
    });
  }

  @override
  Future<void> decryptDocument(String documentId) async {
    final isar = _isarService.isar;
    await isar.writeTxn(() async {
      final document = await getDocumentById(documentId);
      if (document != null) {
        document.isEncrypted = false;
        document.updatedAt = DateTime.now();
        document.version++;
        await isar.documentIsars.put(document);
      }
    });
  }
}
