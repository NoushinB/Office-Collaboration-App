import 'package:equatable/equatable.dart';
import 'package:mulki_zerin/src/models/place/place_list_item_model.dart';

abstract class PlacesListState extends Equatable {
  const PlacesListState();

  @override
  List<Object> get props => [];
}

class PlacesListUninitialized extends PlacesListState {
  @override
  String toString() => 'Places List Uninitialized';
}

class PlacesListError extends PlacesListState {
  final Exception exception;

  const PlacesListError(this.exception);

  @override
  List<Object> get props => [exception];

  @override
  String toString() => 'Places List Error';
}

class PlacesListListLoaded extends PlacesListState {
  final List<PlaceListItemModel> result;

  const PlacesListListLoaded({this.result});

  @override
  List<Object> get props => [result];

  @override
  String toString() => 'Places List Loaded { count: ${result.length} }';
}
