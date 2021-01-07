import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mulki_zerin/src/bloc/events/property_event.dart';
import 'package:mulki_zerin/src/bloc/states/property/property_list_state.dart';
import 'package:mulki_zerin/src/di/get_it_service_locator.dart';
import 'package:mulki_zerin/src/models/property/properties_list_result.dart';
import 'package:mulki_zerin/src/models/property/property_filter_model.dart';
import 'package:mulki_zerin/src/resources/repository/property_repository.dart';

class PropertyListBloc extends Bloc<PropertyEvent, PropertyListState> {
  PropertyRepository _repository;

  PropertyListBloc({PropertyRepository repository}) : super(PropertyListUninitialized()) {
    this._repository = repository ?? getIt.get<PropertyRepository>();
  }

  @override
  Stream<PropertyListState> mapEventToState(PropertyEvent event) async* {
    final currentState = state;
    if (event is FetchPropertiesList && !_hasReachedMax(currentState)) {
      try {
        if (currentState is PropertyListUninitialized) {
          final data = await _fetchPropertiesListData(event.accessToken, event.filterModel, 0);
          var hasReachedMax = data.totalCount == data.properties.length;
          yield PropertyListLoaded(properties: data.properties, hasReachedMax: hasReachedMax, lastPage: 0);
          return;
        }
        if (currentState is PropertyListLoaded) {
          var newPage = currentState.lastPage + 1;
          final data = await _fetchPropertiesListData(event.accessToken, event.filterModel, newPage);
          if (data.properties.isEmpty) {
            yield currentState.copyWith(hasReachedMax: true);
          } else {
            yield PropertyListLoaded(properties: currentState.properties + data.properties, hasReachedMax: false, lastPage: newPage);
          }
        }
      } catch (_) {
        yield PropertyListError(_);
      }
    }
  }

  bool _hasReachedMax(PropertyListState state) => state is PropertyListLoaded && state.hasReachedMax;

  Future<PropertiesListResult> _fetchPropertiesListData(String accessToken, PropertyFilterModel filterModel, int page) async {
    var data = await _repository.fetchPropertiesListAsync(accessToken, filterModel, page);
    return data;
  }
}
