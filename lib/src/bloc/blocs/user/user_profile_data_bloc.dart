import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mulki_zerin/src/bloc/events/user_event.dart';
import 'package:mulki_zerin/src/bloc/states/user/user_profile_data_state.dart';
import 'package:mulki_zerin/src/di/get_it_service_locator.dart';
import 'package:mulki_zerin/src/resources/repository/user_repository.dart';

class UserProfileDataBloc extends Bloc<UserEvent, UserProfileDataState> {
  UserRepository _repository;

  UserProfileDataBloc({UserRepository repository}) : super(UserProfileDataUninitialized()) {
    this._repository = repository ?? getIt.get<UserRepository>();
  }

  @override
  Stream<UserProfileDataState> mapEventToState(UserEvent event) async* {
    if (event is GetUserProfileData) {
      try {
        yield UserProfileDataLoading();
        var result = await _repository.getUserProfileData(event.accessToken);
        yield UserProfileDataSuccess(result: result);
      } catch (ex) {
        yield UserProfileDataError(ex);
      }
    }
  }
}
