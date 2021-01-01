import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mulki_zerin/src/bloc/events/category_event.dart';
import 'package:mulki_zerin/src/bloc/states/category/categories_list_state.dart';
import 'package:mulki_zerin/src/di/get_it_service_locator.dart';
import 'package:mulki_zerin/src/resources/repository/category_repository.dart';

class CategoriesListBloc extends Bloc<CategoryEvent, CategoriesListState> {
  CategoryRepository _repository;

  CategoriesListBloc({CategoryRepository repository}) : super(CategoriesListUninitialized()) {
    this._repository = repository ?? getIt.get<CategoryRepository>();
  }

  @override
  Stream<CategoriesListState> mapEventToState(CategoryEvent event) async* {
    final currentState = state;
    if (event is FetchCategoriesList) {
      try {
        if (currentState is CategoriesListUninitialized) {
          final result = await _repository.fetchCategoriesListAsync();
          yield CategoriesListLoaded(result: result);
          return;
        }
      } on Exception catch (ex) {
        yield CategoriesListError(ex);
      }
    }
  }
}
