import 'dart:io';
import 'package:image/image.dart' as img;
import '../models/receipt_extraction_isar.dart';

abstract class OcrService {
  Future<ReceiptExtractionIsar> extractReceiptData(
    String imagePath, {
    Map<String, dynamic>? options,
  });
  
  Future<List<String>> detectTextRegions(String imagePath);
  
  Future<bool> isReceipt(String imagePath);
}

class MockOcrService implements OcrService {
  @override
  Future<ReceiptExtractionIsar> extractReceiptData(
    String imagePath, {
    Map<String, dynamic>? options,
  }) async {
    // Simulate processing time
    await Future.delayed(const Duration(seconds: 2));
    
    // Mock extraction results based on common receipt patterns
    final mockData = _getMockReceiptData();
    
    return ReceiptExtractionIsar()
      ..extractionId = DateTime.now().millisecondsSinceEpoch.toString()
      ..documentId = DateTime.now().millisecondsSinceEpoch.toString()
      ..imagePath = imagePath
      ..extractionDate = DateTime.now()
      ..status = ExtractionStatus.completed
      ..totalAmount = mockData['totalAmount']
      ..currency = mockData['currency']
      ..merchantName = mockData['merchantName']
      ..merchantAddress = mockData['merchantAddress']
      ..transactionDate = mockData['transactionDate']
      ..purchaseDate = mockData['purchaseDate']
      ..purchaseTime = null
      ..receiptNumber = mockData['receiptNumber']
      ..paymentMethod = mockData['paymentMethod']
      ..cardLastFour = mockData['cardLastFour']
      ..category = mockData['category']
      ..items = mockData['items']
      ..taxAmount = mockData['taxAmount']
      ..tipAmount = mockData['tipAmount']
      ..discountAmount = mockData['discountAmount']
      ..subtotal = mockData['subtotal']
      ..confidence = mockData['confidence']
      ..rawText = mockData['rawText']
      ..metadata = mockData['metadata']
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..version = 1
      ..isDeleted = false;
  }

  @override
  Future<List<String>> detectTextRegions(String imagePath) async {
    // Mock text region detection
    await Future.delayed(const Duration(milliseconds: 500));
    
    return [
      'Merchant Name Region',
      'Date Region',
      'Items List Region',
      'Total Amount Region',
      'Tax Amount Region',
    ];
  }

  @override
  Future<bool> isReceipt(String imagePath) async {
    // Mock receipt detection - in real implementation, this would use ML
    await Future.delayed(const Duration(milliseconds: 300));
    
    // For demo purposes, assume most images are receipts
    return true;
  }

  Map<String, dynamic> _getMockReceiptData() {
    final merchants = [
      'Starbucks Coffee',
      'Whole Foods Market',
      'Target Store',
      'Amazon Fresh',
      'Local Restaurant',
    ];
    
    final categories = ['Food & Dining', 'Groceries', 'Shopping', 'Entertainment'];
    
    final mockItems = [
      ExtractedItem()
        ..itemName = 'Cappuccino'
        ..description = 'Freshly brewed coffee beverage'
        ..quantity = 2.0
        ..unitPrice = 4.50
        ..totalPrice = 9.00
        ..category = 'Beverages'
        ..sku = null
        ..discount = null
        ..tax = null
        ..confidence = '0.95',
      ExtractedItem()
        ..itemName = 'Croissant'
        ..description = 'Buttery French pastry'
        ..quantity = 1.0
        ..unitPrice = 3.25
        ..totalPrice = 3.25
        ..category = 'Bakery'
        ..sku = null
        ..discount = null
        ..tax = null
        ..confidence = '0.92',
    ];

    final selectedMerchant = merchants[(DateTime.now().millisecondsSinceEpoch % merchants.length)];
    final totalAmount = mockItems.fold<double>(0.0, (sum, item) => sum + (item.totalPrice ?? 0.0));
    final taxAmount = totalAmount * 0.08; // 8% tax

    return {
      'totalAmount': totalAmount + taxAmount,
      'currency': 'USD',
      'merchantName': selectedMerchant,
      'merchantAddress': '123 Main St, City, State 12345',
      'transactionDate': DateTime.now(),
      'purchaseDate': DateTime.now(),
      'receiptNumber': 'RCP${DateTime.now().millisecondsSinceEpoch}',
      'paymentMethod': 'Credit Card',
      'cardLastFour': '1234',
      'category': categories[(DateTime.now().millisecondsSinceEpoch % categories.length)],
      'items': mockItems,
      'taxAmount': taxAmount.toStringAsFixed(2),
      'tipAmount': '2.00',
      'discountAmount': '0.00',
      'subtotal': totalAmount.toStringAsFixed(2),
      'confidence': '0.89',
      'rawText': '''
$selectedMerchant
123 Main St, City, State 12345
----------------------------------------
Cappuccino x2 @ \$4.50      \$9.00
Croissant x1 @ \$3.25       \$3.25
----------------------------------------
Subtotal:                  \$12.25
Tax (8%):                   \$0.98
Tip:                        \$2.00
Total:                     \$15.23
Payment: Credit Card ****1234
Thank you for your purchase!
      ''',
      'metadata': {
        'processingTime': '2.1s',
        'modelVersion': '1.0.0',
        'imageQuality': 'high',
        'textDensity': 'medium',
      },
    };
  }
}

class GoogleVisionOcrService implements OcrService {
  final String apiKey;
  final String baseUrl = 'https://vision.googleapis.com/v1';

  GoogleVisionOcrService({required this.apiKey});

  @override
  Future<ReceiptExtractionIsar> extractReceiptData(
    String imagePath, {
    Map<String, dynamic>? options,
  }) async {
    try {
      // 1. Detect text in image
      final textAnnotations = await _detectText(imagePath);
      
      // 2. Parse receipt-specific information
      final extractedData = await _parseReceiptData(textAnnotations);
      
      return ReceiptExtractionIsar()
        ..extractionId = DateTime.now().millisecondsSinceEpoch.toString()
        ..documentId = DateTime.now().millisecondsSinceEpoch.toString()
        ..imagePath = imagePath
        ..extractionDate = DateTime.now()
        ..status = ExtractionStatus.completed
        ..totalAmount = extractedData['totalAmount']
        ..currency = extractedData['currency']
        ..merchantName = extractedData['merchantName']
        ..merchantAddress = extractedData['merchantAddress']
        ..transactionDate = extractedData['transactionDate']
        ..purchaseDate = extractedData['purchaseDate']
        ..receiptNumber = extractedData['receiptNumber']
        ..paymentMethod = extractedData['paymentMethod']
        ..cardLastFour = extractedData['cardLastFour']
        ..category = extractedData['category']
        ..items = extractedData['items']
        ..taxAmount = extractedData['taxAmount']
        ..tipAmount = extractedData['tipAmount']
        ..discountAmount = extractedData['discountAmount']
        ..subtotal = extractedData['subtotal']
        ..confidence = extractedData['confidence']
        ..rawText = extractedData['rawText']
        ..metadata = extractedData['metadata']
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now()
        ..version = 1
        ..isDeleted = false;
    } catch (e) {
      return ReceiptExtractionIsar()
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
        ..metadata = {'error': e.toString()}
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now()
        ..version = 1
        ..isDeleted = false;
    }
  }

  @override
  Future<List<String>> detectTextRegions(String imagePath) async {
    // Implementation for Google Vision text region detection
    final textAnnotations = await _detectText(imagePath);
    return textAnnotations.map((annotation) => annotation['description'] as String).toList();
  }

  @override
  Future<bool> isReceipt(String imagePath) async {
    try {
      final textAnnotations = await _detectText(imagePath);
      final fullText = textAnnotations.map((a) => a['description'] as String).join(' ');
      
      // Simple heuristics to determine if it's a receipt
      final receiptIndicators = [
        'total', 'subtotal', 'tax', 'receipt', 'thank you',
        'payment', 'cash', 'credit', 'debit', 'change',
      ];
      
      final textLower = fullText.toLowerCase();
      final indicatorCount = receiptIndicators
          .where((indicator) => textLower.contains(indicator))
          .length;
      
      return indicatorCount >= 2; // At least 2 receipt indicators
    } catch (e) {
      return false;
    }
  }

  Future<List<Map<String, dynamic>>> _detectText(String imagePath) async {
    // This would implement actual Google Vision API call
    // For now, return mock data
    return [
      {
        'description': 'Mock detected text',
        'boundingPoly': {
          'vertices': [
            {'x': 10, 'y': 10},
            {'x': 100, 'y': 10},
            {'x': 100, 'y': 30},
            {'x': 10, 'y': 30},
          ]
        }
      }
    ];
  }

  Future<Map<String, dynamic>> _parseReceiptData(
    List<Map<String, dynamic>> textAnnotations,
  ) async {
    // This would implement sophisticated receipt parsing logic
    // For now, return mock parsed data
    return {
      'totalAmount': 15.23,
      'currency': 'USD',
      'merchantName': 'Mock Merchant',
      'items': <ExtractedItem>[],
      'confidence': '0.85',
      'rawText': 'Mock raw text',
      'metadata': {'source': 'google_vision'},
    };
  }
}

class ReceiptImageProcessor {
  static Future<String> preprocessImage(String imagePath) async {
    try {
      final originalImage = File(imagePath);
      final imageBytes = await originalImage.readAsBytes();
      final image = img.decodeImage(imageBytes);
      
      if (image == null) throw Exception('Could not decode image');
      
      // Convert to grayscale for better OCR
      final grayscale = img.grayscale(image);
      
      // Enhance contrast
      final contrast = img.adjustColor(
        grayscale,
        contrast: 1.2,
        brightness: 0.1,
      );
      
      // Resize if too large (max 2000px width/height)
      final maxDimension = 2000;
      final width = contrast.width;
      final height = contrast.height;
      
      img.Image processed;
      if (width > maxDimension || height > maxDimension) {
        final aspectRatio = width / height;
        if (width > height) {
          processed = img.copyResize(
            contrast,
            width: maxDimension,
            height: (maxDimension / aspectRatio).round(),
          );
        } else {
          processed = img.copyResize(
            contrast,
            width: (maxDimension * aspectRatio).round(),
            height: maxDimension,
          );
        }
      } else {
        processed = contrast;
      }
      
      // Save processed image
      final processedPath = '${imagePath}_processed.jpg';
      final processedFile = File(processedPath);
      await processedFile.writeAsBytes(img.encodeJpg(processed, quality: 90));
      
      return processedPath;
    } catch (e) {
      throw Exception('Image preprocessing failed: $e');
    }
  }

  static Future<bool> validateImageQuality(String imagePath) async {
    try {
      final imageFile = File(imagePath);
      final imageBytes = await imageFile.readAsBytes();
      final image = img.decodeImage(imageBytes);
      
      if (image == null) return false;
      
      // Check minimum dimensions
      if (image.width < 300 || image.height < 300) return false;
      
      // Check file size (should be reasonable)
      final fileSize = await imageFile.length();
      if (fileSize < 10 * 1024) return false; // Less than 10KB
      if (fileSize > 10 * 1024 * 1024) return false; // More than 10MB
      
      return true;
    } catch (e) {
      return false;
    }
  }
}
