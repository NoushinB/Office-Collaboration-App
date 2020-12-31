import 'package:mulki_zerin/src/di/get_it_service_locator.dart';
import 'package:mulki_zerin/src/models/user/user_profile_data.dart';
import 'package:mulki_zerin/src/resources/api_provider/user_api_provider.dart';

class UserRepository{
  UserApiProvider userApiProvider;

  UserRepository({UserApiProvider apiProvider}){
    this.userApiProvider = apiProvider ?? getIt.get<UserApiProvider>();
  }

  Future<UserProfileDataModel> getUserProfileData(String accessToken) => userApiProvider.getUserProfileData(accessToken);
}