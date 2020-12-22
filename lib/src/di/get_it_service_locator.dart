import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:mulki_zerin/src/bloc/blocs/login/login_bloc.dart';
import 'package:mulki_zerin/src/resources/api_provider/login_api_provider.dart';
import 'package:mulki_zerin/src/resources/repository/login_repository.dart';


GetIt getIt = GetIt.I;

void setupLocator() {
  // Singleton
  getIt.registerSingleton(http.Client());
  getIt.registerSingleton(LoginApiProvider());
  getIt.registerSingleton(LoginRepository());

  // Factory
  getIt.registerFactory<LoginBloc>(() => LoginBloc());
}