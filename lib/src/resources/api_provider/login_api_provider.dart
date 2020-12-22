import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mulki_zerin/core/app_config.dart';
import 'package:mulki_zerin/src/di/get_it_service_locator.dart';
import 'package:mulki_zerin/src/error_handling/error_handling_helper.dart';
import 'package:mulki_zerin/src/models/login/access_token_result.dart';

class LoginApiProvider {
  http.Client client;

  LoginApiProvider({http.Client client}) {
    this.client = client ?? getIt.get<http.Client>();
  }

  Future<AccessTokenResult> loginAsync(String username, String password) async {
    var url = "${AppConfig.identityBaseUrl}/connect/token";
    Map<String, dynamic> body = {
      'grant_type': AppConfig.grantType,
      'client_id': AppConfig.clientId,
      'client_secret': AppConfig.clientSecret,
      'scope': AppConfig.scope,
      'username': username,
      'password': password,
    };
    final response = await client.post(
      url,
      body: body,
      headers: {HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded"},
    );
    ErrorHandlingHelper.ensureSuccessResponse(response, defaultMsg: 'Failed To get access token');
    return AccessTokenResult.fromJson(json.decode(response.body));
  }
}