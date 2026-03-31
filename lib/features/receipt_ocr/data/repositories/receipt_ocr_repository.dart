import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:image_picker/image_picker.dart';
import 'package:isar/isar.dart';
import 'package:permission_handler/permission_handler.dart';
import '../models/receipt_extraction_isar.dart';
import '../services/ocr_service.dart';
import '../../../../core/database/isar_service.dart';

class ReceiptOcrRepository {
  final IsarService _isarService;
  final OcrService _ocrService;

  ReceiptOcrRepository(
    this._isarService,
    this._ocrService,
  );

  Future<String?> captureReceiptFromCamera() async {
    try {
      // Check camera permission
      final cameraPermission = await Permission.camera.request();
      if (!cameraPermission.isGranted) {
        throw Exception('Camera permission denied');
      }

      final picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 85,
        maxWidth: 2000,
        maxHeight: 2000,
      );

      return image?.path;
    } catch (e) {
      throw Exception('Failed to capture receipt: $e');
    }
  }

  Future<String?> pickReceiptFromGallery() async {
    try {
      // iOS: library access. Android: image_picker uses the Photo Picker (API 33+)
      // or ACTION_GET_CONTENT; those do not require READ_MEDIA_IMAGES up front.
      // Pre-requesting Permission.photos without matching manifest entries used to
      // block picking entirely on Android.
      if (!kIsWeb && Platform.isIOS) {
        final photosPermission = await Permission.photos.request();
        if (!photosPermission.isGranted && !photosPermission.isLimited) {
          throw Exception('Photos permission denied');
        }
      }
      // Android: image_picker opens Photo Picker / document UI without requiring a
      // prior Permission.photos grant (manifest declares READ_* for when needed).

      final picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
        maxWidth: 2000,
        maxHeight: 2000,
      );

      return image?.path;
    } catch (e) {
      throw Exception('Failed to pick receipt: $e');
    }
  }

  Future<ReceiptExtractionIsar> processReceipt(
    String imagePath, {
    bool preprocess = true,
    Map<String, dynamic>? options,
  }) async {
    try {
      // Validate image quality
      final isValidImage = await ReceiptImageProcessor.validateImageQuality(imagePath);
      if (!isValidImage) {
        throw Exception('Image quality is too low for processing');
      }

      // Check if it's actually a receipt
      final isReceipt = await _ocrService.isReceipt(imagePath);
      if (!isReceipt) {
        throw Exception('Image does not appear to be a receipt');
      }

      // Preprocess image if requested
      String processedImagePath = imagePath;
      if (preprocess) {
        processedImagePath = await ReceiptImageProcessor.preprocessImage(imagePath);
      }

      // Create pending extraction record
      final extraction = ReceiptExtractionIsar()
        ..extractionId = DateTime.now().millisecondsSinceEpoch.toString()
        ..documentId = DateTime.now().millisecondsSinceEpoch.toString()
        ..imagePath = processedImagePath
        ..extractionDate = DateTime.now()
        ..status = ExtractionStatus.processing
        ..totalAmount = null
        ..currency = null
        ..merchantName = null
        ..merchantAddress = null
        ..transactionDate = null
        ..purchaseDate = null
        ..purchaseTime = null
        ..receiptNumber = null
        ..paymentMethod = null
        ..cardLastFour = null
        ..category = null
        ..items = []
        ..taxAmount = null
        ..tipAmount = null
        ..discountAmount = null
        ..subtotal = null
        ..confidence = null
        ..rawText = null
        ..metadata = null
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now()
        ..version = 1
        ..isDeleted = false;

      await _isarService.writeTransaction(() async {
        await _isarService.isar.receiptExtractionIsars.put(extraction);
      });

      // Perform OCR extraction
      final extractedData = await _ocrService.extractReceiptData(
        processedImagePath,
        options: options,
      );

      // Update with extracted data
      extractedData.extractionId = extraction.extractionId;
      extractedData.documentId = extraction.documentId;
      extractedData.imagePath = processedImagePath;
      extractedData.createdAt = extraction.createdAt;
      extractedData.updatedAt = DateTime.now();
      extractedData.version = extraction.version + 1;

      await _isarService.writeTransaction(() async {
        await _isarService.isar.receiptExtractionIsars.put(extractedData);
      });

      return extractedData;
    } catch (e) {
      // Create failed extraction record
      final failedExtraction = ReceiptExtractionIsar()
        ..extractionId = DateTime.now().millisecondsSinceEpoch.toString()
        ..documentId = DateTime.now().millisecondsSinceEpoch.toString()
        ..imagePath = imagePath
        ..extractionDate = DateTime.now()
        ..status = ExtractionStatus.failed
        ..totalAmount = null
        ..currency = null
        ..merchantName = null
        ..merchantAddress = null
        ..transactionDate = null
        ..purchaseDate = null
        ..purchaseTime = null
        ..receiptNumber = null
        ..paymentMethod = null
        ..cardLastFour = null
        ..category = null
        ..items = []
        ..taxAmount = null
        ..tipAmount = null
        ..discountAmount = null
        ..subtotal = null
        ..confidence = null
        ..rawText = 'Error: ${e.toString()}'
        ..metadata = {'error': e.toString(), 'timestamp': DateTime.now().toIso8601String()}
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now()
        ..version = 1
        ..isDeleted = false;

      await _isarService.writeTransaction(() async {
        await _isarService.isar.receiptExtractionIsars.put(failedExtraction);
      });

      throw e;
    }
  }

  Future<List<ReceiptExtractionIsar>> _allExtractions() async {
    final extractions = await _isarService.isar.receiptExtractionIsars.where().findAll();
    final activeExtractions = extractions.where((item) => !item.isDeleted).toList()
      ..sort((a, b) => b.extractionDate.compareTo(a.extractionDate));
    return activeExtractions;
  }

  Future<List<ReceiptExtractionIsar>> getRecentExtractions({int limit = 50}) async {
    final extractions = await _allExtractions();
    return extractions.take(limit).toList();
  }

  Future<List<ReceiptExtractionIsar>> getExtractionsByStatus(ExtractionStatus status) async {
    final extractions = await _allExtractions();
    return extractions.where((item) => item.status == status).toList();
  }

  Future<ReceiptExtractionIsar?> getExtractionById(String extractionId) async {
    final extractions = await _allExtractions();
    return extractions
        .where((item) => item.extractionId == extractionId)
        .cast<ReceiptExtractionIsar?>()
        .firstOrNull;
  }

  Future<void> updateExtraction(ReceiptExtractionIsar extraction) async {
    extraction.updatedAt = DateTime.now();
    extraction.version++;

    await _isarService.writeTransaction(() async {
      await _isarService.isar.receiptExtractionIsars.put(extraction);
    });
  }

  Future<void> deleteExtraction(String extractionId) async {
    await _isarService.writeTransaction(() async {
      final extraction = (await _allExtractions())
          .where((item) => item.extractionId == extractionId)
          .cast<ReceiptExtractionIsar?>()
          .firstOrNull;
      
      if (extraction != null) {
        extraction.isDeleted = true;
        extraction.updatedAt = DateTime.now();
        extraction.version++;
        await _isarService.isar.receiptExtractionIsars.put(extraction);
      }
    });
  }

  Future<void> retryExtraction(String extractionId) async {
    final extraction = await getExtractionById(extractionId);
    if (extraction == null) return;

    try {
      // Update status to processing
      extraction.status = ExtractionStatus.processing;
      extraction.updatedAt = DateTime.now();
      extraction.version++;
      
      await _isarService.writeTransaction(() async {
        await _isarService.isar.receiptExtractionIsars.put(extraction);
      });

      // Re-process the image
      final newExtraction = await _ocrService.extractReceiptData(
        extraction.imagePath,
      );

      // Update with new data
      newExtraction.extractionId = extraction.extractionId;
      newExtraction.documentId = extraction.documentId;
      newExtraction.imagePath = extraction.imagePath;
      newExtraction.createdAt = extraction.createdAt;
      newExtraction.updatedAt = DateTime.now();
      newExtraction.version = extraction.version + 1;

      await _isarService.writeTransaction(() async {
        await _isarService.isar.receiptExtractionIsars.put(newExtraction);
      });
    } catch (e) {
      // Mark as failed again
      extraction.status = ExtractionStatus.failed;
      extraction.rawText = 'Retry failed: ${e.toString()}';
      extraction.updatedAt = DateTime.now();
      extraction.version++;
      
      await _isarService.writeTransaction(() async {
        await _isarService.isar.receiptExtractionIsars.put(extraction);
      });
    }
  }

  Future<List<ReceiptExtractionIsar>> searchExtractions(String query) async {
    if (query.isEmpty) return await getRecentExtractions();

    final lowerQuery = query.toLowerCase();
    final allExtractions = await getRecentExtractions();

    return allExtractions.where((extraction) {
      return (extraction.merchantName?.toLowerCase().contains(lowerQuery) ?? false) ||
             (extraction.rawText?.toLowerCase().contains(lowerQuery) ?? false) ||
             (extraction.category?.toLowerCase().contains(lowerQuery) ?? false) ||
             extraction.items.any((item) => 
                 item.itemName?.toLowerCase().contains(lowerQuery) ?? false);
    }).toList();
  }

  Future<Map<String, int>> getExtractionStatistics() async {
    final allExtractions = await getRecentExtractions();
    
    final stats = <String, int>{
      'total': allExtractions.length,
      'completed': 0,
      'failed': 0,
      'processing': 0,
      'pending': 0,
      'needsReview': 0,
    };

    for (final extraction in allExtractions) {
      final statusName = extraction.status.name;
      stats[statusName] = (stats[statusName] ?? 0) + 1;
    }

    return stats;
  }

  Future<List<String>> getPopularMerchants({int limit = 10}) async {
    final allExtractions = await getRecentExtractions();
    
    final merchantCounts = <String, int>{};
    
    for (final extraction in allExtractions) {
      if (extraction.merchantName != null && extraction.merchantName!.isNotEmpty) {
        merchantCounts[extraction.merchantName!] = 
            (merchantCounts[extraction.merchantName!] ?? 0) + 1;
      }
    }

    final sortedMerchants = merchantCounts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return sortedMerchants
        .take(limit)
        .map((entry) => entry.key)
        .toList();
  }

  Future<double> getTotalAmountForPeriod(DateTime start, DateTime end) async {
    final extractions = (await _allExtractions())
        .where(
          (item) =>
              item.status == ExtractionStatus.completed &&
              item.purchaseDate != null &&
              !item.purchaseDate!.isBefore(start) &&
              !item.purchaseDate!.isAfter(end),
        )
        .toList();

    return extractions
        .where((e) => e.totalAmount != null)
        .fold<double>(0.0, (sum, e) => sum + e.totalAmount!);
  }
}
