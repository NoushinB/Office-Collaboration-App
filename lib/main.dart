import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mulki_zerin/src/delegates/simple_bloc_delegate.dart';
import 'package:mulki_zerin/src/di/get_it_service_locator.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  setupLocator();
  //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
  runApp(MyApp());
}
