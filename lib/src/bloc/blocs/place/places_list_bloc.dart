import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:mulki_zerin/src/bloc/events/place_event.dart';
import 'package:mulki_zerin/src/bloc/states/place/places_list_state.dart';
import 'package:mulki_zerin/src/di/get_it_service_locator.dart';
import 'package:mulki_zerin/src/resources/repository/place_repository.dart';

class PlacesListBloc extends Bloc<PlaceEvent, PlacesListState> {
  PlaceRepository _repository;

  PlacesListBloc({PlaceRepository repository}) : super(PlacesListUninitialized()) {
    this._repository = repository ?? getIt.get<PlaceRepository>();
  }

  @override
  Stream<PlacesListState> mapEventToState(PlaceEvent event) async* {
    final currentState = state;
    if (event is FetchPlacesList) {
      try {
        if (currentState is PlacesListUninitialized) {
          final result = await _repository.fetchPlacesListAsync();
          yield PlacesListListLoaded(result: result);
          return;
        }
      } on Exception catch (ex) {
        yield PlacesListError(ex);
      }
    }
  }
}
