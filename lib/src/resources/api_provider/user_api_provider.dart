import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mulki_zerin/core/app_config.dart';
import 'package:mulki_zerin/src/di/get_it_service_locator.dart';
import 'package:mulki_zerin/src/error_handling/error_handling_helper.dart';
import 'package:mulki_zerin/src/models/user/user_profile_data.dart';

class UserApiProvider {
  http.Client client;

  UserApiProvider({http.Client client}) {
    this.client = client ?? getIt.get<http.Client>();
  }

  Future<UserProfileDataModel> getUserProfileData(String accessToken) async {
    var url = "${AppConfig.baseUrl}/api/mulkizerin/user/profile/data";
    final response = await client.get(
      url,
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $accessToken",
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    ErrorHandlingHelper.ensureSuccessResponse(response, defaultMsg: 'Failed To get user profile data');
    return UserProfileDataModel.fromJson(json.decode(response.body));
  }
}
