import 'package:equatable/equatable.dart';
import 'package:mulki_zerin/src/models/category/category_list_item_model.dart';

abstract class CategoriesListState extends Equatable {
  const CategoriesListState();

  @override
  List<Object> get props => [];
}

class CategoriesListUninitialized extends CategoriesListState {
  @override
  String toString() => 'Categories List Uninitialized';
}

class CategoriesListError extends CategoriesListState {
  final Exception exception;

  const CategoriesListError(this.exception);

  @override
  List<Object> get props => [exception];

  @override
  String toString() => 'Categories List Error';
}

class CategoriesListLoaded extends CategoriesListState {
  final List<CategoryListItemModel> result;

  const CategoriesListLoaded({this.result});

  @override
  List<Object> get props => [result];

  @override
  String toString() => 'Categories List Loaded { count: ${result.length} }';
}
