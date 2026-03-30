part of 'document_vault_bloc.dart';

abstract class DocumentVaultEvent extends Equatable {
  const DocumentVaultEvent();

  @override
  List<Object> get props => [];
}

class LoadDocuments extends DocumentVaultEvent {
  const LoadDocuments();
}

class AddDocument extends DocumentVaultEvent {
  final DocumentIsar document;

  const AddDocument(this.document);

  @override
  List<Object> get props => [document];
}

class UpdateDocument extends DocumentVaultEvent {
  final DocumentIsar document;

  const UpdateDocument(this.document);

  @override
  List<Object> get props => [document];
}

class DeleteDocument extends DocumentVaultEvent {
  final String documentId;

  const DeleteDocument(this.documentId);

  @override
  List<Object> get props => [documentId];
}

class FilterByType extends DocumentVaultEvent {
  final DocumentType type;

  const FilterByType(this.type);

  @override
  List<Object> get props => [type];
}

class FilterByCategory extends DocumentVaultEvent {
  final String category;

  const FilterByCategory(this.category);

  @override
  List<Object> get props => [category];
}

class FilterByTag extends DocumentVaultEvent {
  final String tag;

  const FilterByTag(this.tag);

  @override
  List<Object> get props => [tag];
}

class SearchDocuments extends DocumentVaultEvent {
  final String query;

  const SearchDocuments(this.query);

  @override
  List<Object> get props => [query];
}

class SelectDocument extends DocumentVaultEvent {
  final String documentId;

  const SelectDocument(this.documentId);

  @override
  List<Object> get props => [documentId];
}

class AddTagToDocument extends DocumentVaultEvent {
  final String documentId;
  final String tag;

  const AddTagToDocument(this.documentId, this.tag);

  @override
  List<Object> get props => [documentId, tag];
}

class RemoveTagFromDocument extends DocumentVaultEvent {
  final String documentId;
  final String tag;

  const RemoveTagFromDocument(this.documentId, this.tag);

  @override
  List<Object> get props => [documentId, tag];
}

class RefreshDocuments extends DocumentVaultEvent {
  const RefreshDocuments();
}

class UploadFile extends DocumentVaultEvent {
  const UploadFile();
}

class UploadImage extends DocumentVaultEvent {
  final ImageSource source;

  const UploadImage(this.source);

  @override
  List<Object> get props => [source];
}

class EncryptDocument extends DocumentVaultEvent {
  final String documentId;

  const EncryptDocument(this.documentId);

  @override
  List<Object> get props => [documentId];
}

class DecryptDocument extends DocumentVaultEvent {
  final String documentId;

  const DecryptDocument(this.documentId);

  @override
  List<Object> get props => [documentId];
}
