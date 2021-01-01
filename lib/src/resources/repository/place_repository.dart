import 'package:mulki_zerin/src/di/get_it_service_locator.dart';
import 'package:mulki_zerin/src/models/place/place_list_item_model.dart';
import 'package:mulki_zerin/src/resources/api_provider/place_api_provider.dart';

class PlaceRepository{
  PlaceApiProvider placeApiProvider;

  PlaceRepository({PlaceApiProvider apiProvider}){
    this.placeApiProvider = apiProvider ?? getIt.get<PlaceApiProvider>();
  }

  Future<List<PlaceListItemModel>> fetchPlacesListAsync() => placeApiProvider.fetchPlacesListAsync();
}