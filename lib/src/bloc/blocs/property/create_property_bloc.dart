import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mulki_zerin/src/bloc/events/property_event.dart';
import 'package:mulki_zerin/src/bloc/states/property/create_property_state.dart';
import 'package:mulki_zerin/src/di/get_it_service_locator.dart';
import 'package:mulki_zerin/src/resources/repository/property_repository.dart';

class CreatePropertyBloc extends Bloc<PropertyEvent, CreatePropertyState> {
  PropertyRepository _repository;

  CreatePropertyBloc({PropertyRepository repository}) : super(CreatePropertyUninitialized()) {
    this._repository = repository ?? getIt.get<PropertyRepository>();
  }

  @override
  Stream<CreatePropertyState> mapEventToState(PropertyEvent event) async* {
    if (event is CreateNewProperty) {
      try {
        yield CreatePropertyBusy();
        await _repository.createNewPropertyAsync(event.accessToken, event.model, event.files);
        yield CreatePropertySuccess();
      } catch (ex) {
        yield CreatePropertyError(ex);
      }
    }
  }
}
