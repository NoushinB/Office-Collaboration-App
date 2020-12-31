import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:mulki_zerin/src/bloc/blocs/login/login_bloc.dart';
import 'package:mulki_zerin/src/bloc/blocs/user/user_profile_data_bloc.dart';
import 'package:mulki_zerin/src/resources/api_provider/login_api_provider.dart';
import 'package:mulki_zerin/src/resources/api_provider/user_api_provider.dart';
import 'package:mulki_zerin/src/resources/repository/login_repository.dart';
import 'package:mulki_zerin/src/resources/repository/user_repository.dart';


GetIt getIt = GetIt.I;

void setupLocator() {
  // Singleton
  getIt.registerSingleton(http.Client());
  getIt.registerSingleton(LoginApiProvider());
  getIt.registerSingleton(LoginRepository());

  getIt.registerSingleton(UserApiProvider());
  getIt.registerSingleton(UserRepository());

  // Factory
  getIt.registerFactory<LoginBloc>(() => LoginBloc());
  getIt.registerFactory<UserProfileDataBloc>(() => UserProfileDataBloc());
}