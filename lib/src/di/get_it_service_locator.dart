import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:mulki_zerin/src/bloc/blocs/category/categories_list_bloc.dart';
import 'package:mulki_zerin/src/bloc/blocs/login/login_bloc.dart';
import 'package:mulki_zerin/src/bloc/blocs/place/places_list_bloc.dart';
import 'package:mulki_zerin/src/bloc/blocs/property/create_property_bloc.dart';
import 'package:mulki_zerin/src/bloc/blocs/property/property_list_bloc.dart';
import 'package:mulki_zerin/src/bloc/blocs/user/user_profile_data_bloc.dart';
import 'package:mulki_zerin/src/resources/api_provider/category_api_provider.dart';
import 'package:mulki_zerin/src/resources/api_provider/login_api_provider.dart';
import 'package:mulki_zerin/src/resources/api_provider/place_api_provider.dart';
import 'package:mulki_zerin/src/resources/api_provider/property_api_provider.dart';
import 'package:mulki_zerin/src/resources/api_provider/user_api_provider.dart';
import 'package:mulki_zerin/src/resources/repository/category_repository.dart';
import 'package:mulki_zerin/src/resources/repository/login_repository.dart';
import 'package:mulki_zerin/src/resources/repository/place_repository.dart';
import 'package:mulki_zerin/src/resources/repository/property_repository.dart';
import 'package:mulki_zerin/src/resources/repository/user_repository.dart';


GetIt getIt = GetIt.I;

void setupLocator() {
  // Singleton
  getIt.registerSingleton(http.Client());
  getIt.registerSingleton(LoginApiProvider());
  getIt.registerSingleton(LoginRepository());

  getIt.registerSingleton(UserApiProvider());
  getIt.registerSingleton(UserRepository());

  getIt.registerSingleton(PropertyApiProvider());
  getIt.registerSingleton(PropertyRepository());

  getIt.registerSingleton(PlaceApiProvider());
  getIt.registerSingleton(PlaceRepository());

  getIt.registerSingleton(CategoryApiProvider());
  getIt.registerSingleton(CategoryRepository());

  // Factory
  getIt.registerFactory<LoginBloc>(() => LoginBloc());
  getIt.registerFactory<UserProfileDataBloc>(() => UserProfileDataBloc());
  getIt.registerFactory<CreatePropertyBloc>(() => CreatePropertyBloc());
  getIt.registerFactory<PlacesListBloc>(() => PlacesListBloc());
  getIt.registerFactory<CategoriesListBloc>(() => CategoriesListBloc());
  getIt.registerFactory<PropertyListBloc>(() => PropertyListBloc());
}