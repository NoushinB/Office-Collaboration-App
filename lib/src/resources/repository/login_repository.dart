

import 'package:mulki_zerin/src/di/get_it_service_locator.dart';
import 'package:mulki_zerin/src/models/login/access_token_result.dart';
import 'package:mulki_zerin/src/resources/api_provider/login_api_provider.dart';

class LoginRepository {
  LoginApiProvider loginApiProvider;

  LoginRepository({LoginApiProvider loginApiProvider}) {
    this.loginApiProvider = loginApiProvider ?? getIt.get<LoginApiProvider>();
  }

  Future<AccessTokenResult> loginAsync(String username, String password) => loginApiProvider.loginAsync(username, password);
}