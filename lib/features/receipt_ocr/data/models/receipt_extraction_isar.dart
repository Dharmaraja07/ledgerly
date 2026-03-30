import 'dart:convert';
import 'dart:ui';

import 'package:isar/isar.dart';

part 'receipt_extraction_isar.g.dart';

@collection
class ReceiptExtractionIsar {
  Id id = Isar.autoIncrement;

  late String extractionId;
  late String documentId;
  late String imagePath;
  late DateTime extractionDate;
  @enumerated
  late ExtractionStatus status;
  late double? totalAmount;
  late String? currency;
  late String? merchantName;
  late String? merchantAddress;
  late DateTime? transactionDate;
  late DateTime? purchaseDate;
  late DateTime? purchaseTime;
  late String? receiptNumber;
  late String? paymentMethod;
  late String? cardLastFour;
  late String? category;
  late List<ExtractedItem> items;
  late String? taxAmount;
  late String? tipAmount;
  late String? discountAmount;
  late String? subtotal;
  late String? confidence;
  late String? rawText;
  String? metadataJson;
  late DateTime createdAt;
  late DateTime updatedAt;
  late int version;
  late bool isDeleted;

  bool get hasValidAmount => totalAmount != null && totalAmount! > 0;
  
  bool get hasMerchant => merchantName != null && merchantName!.isNotEmpty;
  
  bool get hasItems => items.isNotEmpty;
  
  bool get isCompleted => status == ExtractionStatus.completed;
  
  bool get hasErrors => status == ExtractionStatus.failed;
  
  double? get calculatedTaxAmount {
    if (taxAmount != null) {
      return double.tryParse(taxAmount!);
    }
    
    // Try to calculate from items if available
    if (items.isNotEmpty && totalAmount != null) {
      final itemsSubtotal = items.fold<double>(
        0.0,
        (sum, item) => sum + (item.totalPrice ?? 0.0),
      );
      return totalAmount! - itemsSubtotal;
    }
    
    return null;
  }

  @ignore
  Map<String, dynamic>? get metadata {
    if (metadataJson == null || metadataJson!.isEmpty) {
      return null;
    }

    final decoded = jsonDecode(metadataJson!);
    return decoded is Map<String, dynamic>
        ? decoded
        : Map<String, dynamic>.from(decoded as Map);
  }

  set metadata(Map<String, dynamic>? value) {
    metadataJson = value == null ? null : jsonEncode(value);
  }
}

@embedded
class ExtractedItem {
  late String? itemName;
  late String? description;
  late double? quantity;
  late double? unitPrice;
  late double? totalPrice;
  late String? category;
  late String? sku;
  late String? discount;
  late String? tax;
  late String? confidence;

  bool get isValid => itemName != null && itemName!.isNotEmpty && totalPrice != null;
}

enum ExtractionStatus {
  pending,
  processing,
  completed,
  failed,
  needsReview,
}

extension ExtractionStatusExtension on ExtractionStatus {
  String get displayName {
    switch (this) {
      case ExtractionStatus.pending:
        return 'Pending';
      case ExtractionStatus.processing:
        return 'Processing';
      case ExtractionStatus.completed:
        return 'Completed';
      case ExtractionStatus.failed:
        return 'Failed';
      case ExtractionStatus.needsReview:
        return 'Needs Review';
    }
  }

  String get icon {
    switch (this) {
      case ExtractionStatus.pending:
        return '⏳';
      case ExtractionStatus.processing:
        return '🔄';
      case ExtractionStatus.completed:
        return '✅';
      case ExtractionStatus.failed:
        return '❌';
      case ExtractionStatus.needsReview:
        return '⚠️';
    }
  }

  Color get color {
    switch (this) {
      case ExtractionStatus.pending:
        return const Color(0xFFFFA726); // Orange
      case ExtractionStatus.processing:
        return const Color(0xFF42A5F5); // Blue
      case ExtractionStatus.completed:
        return const Color(0xFF66BB6A); // Green
      case ExtractionStatus.failed:
        return const Color(0xFFEF5350); // Red
      case ExtractionStatus.needsReview:
        return const Color(0xFFFFCA28); // Amber
    }
  }
}
