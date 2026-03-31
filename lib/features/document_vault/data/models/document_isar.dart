import 'package:isar/isar.dart';

part 'document_isar.g.dart';

@collection
class DocumentIsar {
  Id id = Isar.autoIncrement;

  late String documentId;
  late String fileName;
  late String filePath;
  late String? thumbnailPath;
  @enumerated
  late DocumentType type;
  late String? category;
  late String? tags;
  late double fileSize;
  late DateTime uploadDate;
  late DateTime? expirationDate;
  late String? description;
  late bool isEncrypted;
  late DateTime createdAt;
  late DateTime updatedAt;
  late int version;
  late bool isDeleted;

  String get formattedFileSize {
    if (fileSize < 1024) return '${fileSize.toStringAsFixed(0)} B';
    if (fileSize < 1024 * 1024) return '${(fileSize / 1024).toStringAsFixed(1)} KB';
    if (fileSize < 1024 * 1024 * 1024) return '${(fileSize / (1024 * 1024)).toStringAsFixed(1)} MB';
    return '${(fileSize / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
  }

  bool get isExpired {
    if (expirationDate == null) return false;
    return DateTime.now().isAfter(expirationDate!);
  }

  List<String> get tagList {
    if (tags == null || tags!.isEmpty) return [];
    return tags!.split(',').map((tag) => tag.trim()).toList();
  }

  bool hasTag(String tag) {
    return tagList.contains(tag);
  }

  void addTag(String tag) {
    final currentTags = tagList;
    if (!currentTags.contains(tag)) {
      currentTags.add(tag);
      tags = currentTags.join(', ');
    }
  }

  void removeTag(String tag) {
    final currentTags = tagList;
    currentTags.remove(tag);
    tags = currentTags.join(', ');
  }
}

enum DocumentType {
  receipt,
  invoice,
  contract,
  statement,
  warranty,
  manual,
  photo,
  pdf,
  other,
}

extension DocumentTypeExtension on DocumentType {
  String get displayName {
    switch (this) {
      case DocumentType.receipt:
        return 'Receipt';
      case DocumentType.invoice:
        return 'Invoice';
      case DocumentType.contract:
        return 'Contract';
      case DocumentType.statement:
        return 'Statement';
      case DocumentType.warranty:
        return 'Warranty';
      case DocumentType.manual:
        return 'Manual';
      case DocumentType.photo:
        return 'Photo';
      case DocumentType.pdf:
        return 'PDF Document';
      case DocumentType.other:
        return 'Other';
    }
  }

  String get icon {
    switch (this) {
      case DocumentType.receipt:
        return '🧾';
      case DocumentType.invoice:
        return '📄';
      case DocumentType.contract:
        return '📋';
      case DocumentType.statement:
        return '📊';
      case DocumentType.warranty:
        return '🛡️';
      case DocumentType.manual:
        return '📖';
      case DocumentType.photo:
        return '🖼️';
      case DocumentType.pdf:
        return '📕';
      case DocumentType.other:
        return '📎';
    }
  }

  List<String> get allowedExtensions {
    switch (this) {
      case DocumentType.receipt:
      case DocumentType.invoice:
      case DocumentType.photo:
        return ['.jpg', '.jpeg', '.png', '.pdf'];
      case DocumentType.contract:
      case DocumentType.warranty:
      case DocumentType.manual:
        return ['.pdf', '.doc', '.docx'];
      case DocumentType.statement:
        return ['.pdf', '.csv', '.xlsx'];
      case DocumentType.pdf:
        return ['.pdf'];
      case DocumentType.other:
        return ['.jpg', '.jpeg', '.png', '.pdf', '.doc', '.docx', '.txt'];
    }
  }
}
