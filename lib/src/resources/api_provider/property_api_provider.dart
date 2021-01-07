import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mulki_zerin/core/app_config.dart';
import 'package:mulki_zerin/src/di/get_it_service_locator.dart';
import 'package:mulki_zerin/src/error_handling/error_handling_helper.dart';
import 'package:mulki_zerin/src/models/property/create_property_model.dart';
import 'package:mulki_zerin/src/models/property/properties_list_result.dart';
import 'package:mulki_zerin/src/models/property/property_filter_model.dart';
import 'package:path/path.dart';

class PropertyApiProvider {
  http.Client client;

  PropertyApiProvider({http.Client client}) {
    this.client = client ?? getIt.get<http.Client>();
  }

  Future createNewPropertyAsync(String accessToken, CreatePropertyModel bodyModel, List<File> files) async {
    var url = "${AppConfig.baseUrl}/api/mulkizerin/property/add";

    var uri = Uri.parse(url);

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    for (var image in files) {
      // get file length
      var length = await image.length();

      // open a byte stream
      var stream = new http.ByteStream(image.openRead());
      stream.cast();

      // multipart that takes file
      var multipartFile = new http.MultipartFile('files', stream, length, filename: basename(image.path));

      // add file to multipart
      request.files.add(multipartFile);
    }

    request.fields.addAll({"data": json.encode(bodyModel)});

    request.headers.addAll({
      HttpHeaders.authorizationHeader: "Bearer $accessToken",
      HttpHeaders.acceptHeader: "application/json",
    });

    // send
    var response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      var responseString = await response.stream.bytesToString();
      return;
    } else {
      throw Exception('Failed To Create New Order');
    }
  }

  Future<PropertiesListResult> fetchPropertiesListAsync(String accessToken, PropertyFilterModel filterModel, int page) async {
    var  url = "${AppConfig.baseUrl}/api/mulkizerin/property/list?page=$page";
    var filterBody = json.encode(filterModel.toJson());
    http.Response response = await client.post(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: "Bearer $accessToken",
      },
      body: filterBody
    );
    ErrorHandlingHelper.ensureSuccessResponse(response, defaultMsg: 'Failed to load orders');
    return PropertiesListResult.fromJson(json.decode(response.body));
  }
}


