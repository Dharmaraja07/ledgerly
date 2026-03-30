import 'package:equatable/equatable.dart';
import '../../domain/entities/category.dart';

abstract class CategoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadCategories extends CategoryEvent {}

class AddCategoryEvent extends CategoryEvent {
  final TransactionCategory category;
  AddCategoryEvent(this.category);
  @override
  List<Object?> get props => [category];
}

class DeleteCategoryEvent extends CategoryEvent {
  final String id;
  DeleteCategoryEvent(this.id);
  @override
  List<Object?> get props => [id];
}

class UpdateCategoryEvent extends CategoryEvent {
  final TransactionCategory category;
  UpdateCategoryEvent(this.category);

  @override
  List<Object?> get props => [category];
}
