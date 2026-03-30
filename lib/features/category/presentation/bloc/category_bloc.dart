import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/category.dart';
import 'category_event.dart';
import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _repository;

  CategoryBloc(this._repository) : super(CategoryInitial()) {
    on<LoadCategories>(_onLoadCategories);
    on<AddCategoryEvent>(_onAddCategory);
    on<DeleteCategoryEvent>(_onDeleteCategory);
    on<UpdateCategoryEvent>(_onUpdateCategory);
  }

  Future<void> _onLoadCategories(LoadCategories event, Emitter<CategoryState> emit) async {
    emit(CategoryLoading());
    try {
      final categories = await _repository.getCategories();
      emit(CategoryLoaded(categories));
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }

  Future<void> _onAddCategory(AddCategoryEvent event, Emitter<CategoryState> emit) async {
    try {
      await _repository.addCategory(event.category);
      add(LoadCategories());
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }

  Future<void> _onDeleteCategory(DeleteCategoryEvent event, Emitter<CategoryState> emit) async {
    try {
      await _repository.deleteCategory(event.id);
      add(LoadCategories());
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }

  Future<void> _onUpdateCategory(UpdateCategoryEvent event, Emitter<CategoryState> emit) async {
    try {
      await _repository.updateCategory(event.category);
      add(LoadCategories());
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }
}
