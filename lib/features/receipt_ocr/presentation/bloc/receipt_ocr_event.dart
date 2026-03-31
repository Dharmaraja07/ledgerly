part of 'receipt_ocr_bloc.dart';

abstract class ReceiptOcrEvent extends Equatable {
  const ReceiptOcrEvent();

  @override
  List<Object> get props => [];
}

class CaptureReceipt extends ReceiptOcrEvent {
  const CaptureReceipt();
}

class PickReceiptFromGallery extends ReceiptOcrEvent {
  const PickReceiptFromGallery();
}

class ProcessReceipt extends ReceiptOcrEvent {
  const ProcessReceipt(this.imagePath);

  final String imagePath;

  @override
  List<Object> get props => [imagePath];
}

class LoadRecentExtractions extends ReceiptOcrEvent {
  const LoadRecentExtractions();
}

class LoadExtractionsByStatus extends ReceiptOcrEvent {
  const LoadExtractionsByStatus(this.status);

  final ExtractionStatus status;

  @override
  List<Object> get props => [status];
}

class SearchExtractions extends ReceiptOcrEvent {
  const SearchExtractions(this.query);

  final String query;

  @override
  List<Object> get props => [query];
}

class UpdateExtraction extends ReceiptOcrEvent {
  const UpdateExtraction(this.extraction);

  final ReceiptExtractionIsar extraction;

  @override
  List<Object> get props => [extraction];
}

class DeleteExtraction extends ReceiptOcrEvent {
  const DeleteExtraction(this.extractionId);

  final String extractionId;

  @override
  List<Object> get props => [extractionId];
}

class RetryExtraction extends ReceiptOcrEvent {
  const RetryExtraction(this.extractionId);

  final String extractionId;

  @override
  List<Object> get props => [extractionId];
}

class LoadStatistics extends ReceiptOcrEvent {
  const LoadStatistics();
}

class LoadPopularMerchants extends ReceiptOcrEvent {
  const LoadPopularMerchants();
}

class SelectExtraction extends ReceiptOcrEvent {
  const SelectExtraction(this.extraction);

  final ReceiptExtractionIsar? extraction;

  @override
  List<Object> get props => [extraction ?? ''];
}

class ClearSelection extends ReceiptOcrEvent {
  const ClearSelection();
}
