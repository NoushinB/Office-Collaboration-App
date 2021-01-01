import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mulki_zerin/core/app_config.dart';
import 'package:mulki_zerin/src/di/get_it_service_locator.dart';
import 'package:mulki_zerin/src/error_handling/error_handling_helper.dart';
import 'package:mulki_zerin/src/models/place/place_list_item_model.dart';

class PlaceApiProvider {
  http.Client client;

  PlaceApiProvider({http.Client client}) {
    this.client = client ?? getIt.get<http.Client>();
  }

  Future<List<PlaceListItemModel>> fetchPlacesListAsync() async {
    var url = "${AppConfig.baseUrl}/api/mulkizerin/place/list";
    Response response = await client.get(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    ErrorHandlingHelper.ensureSuccessResponse(response, defaultMsg: 'Failed to load notifications');
    var resultJson = json.decode(response.body);
    return resultJson != null ? (resultJson as List).map((i) => PlaceListItemModel.fromJson(i)).toList() : null;
  }
}