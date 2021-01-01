import 'package:mulki_zerin/src/di/get_it_service_locator.dart';
import 'package:mulki_zerin/src/models/category/category_list_item_model.dart';
import 'package:mulki_zerin/src/resources/api_provider/category_api_provider.dart';

class CategoryRepository {
  CategoryApiProvider categoryApiProvider;

  CategoryRepository({CategoryApiProvider apiProvider}) {
    this.categoryApiProvider = apiProvider ?? getIt.get<CategoryApiProvider>();
  }

  Future<List<CategoryListItemModel>> fetchCategoriesListAsync() => categoryApiProvider.fetchCategoriesListAsync();
}
