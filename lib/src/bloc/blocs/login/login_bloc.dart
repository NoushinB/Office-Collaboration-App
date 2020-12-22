import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mulki_zerin/src/bloc/events/login_event.dart';
import 'package:mulki_zerin/src/bloc/states/login/login_state.dart';
import 'package:mulki_zerin/src/di/get_it_service_locator.dart';
import 'package:mulki_zerin/src/resources/repository/login_repository.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository _repository;

  LoginBloc({LoginRepository repository}) : super(LoginUninitialized()) {
    this._repository = repository ?? getIt.get<LoginRepository>();
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is Login) {
      try {
        yield LoginLoading();
        var result = await _repository.loginAsync(event.username, event.password);
        yield LoginSuccess(result: result);
      } catch (ex) {
        yield LoginError(ex);
      }
    }
  }
}
