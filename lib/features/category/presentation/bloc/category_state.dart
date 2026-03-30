import 'package:equatable/equatable.dart';
import '../../domain/entities/category.dart';

abstract class CategoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<TransactionCategory> categories;
  CategoryLoaded(this.categories);
  @override
  List<Object?> get props => [categories];
}

class CategoryError extends CategoryState {
  final String message;
  CategoryError(this.message);
  @override
  List<Object?> get props => [message];
}
