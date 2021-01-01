
import 'package:equatable/equatable.dart';

abstract class PlaceEvent extends Equatable {
  const PlaceEvent();

  @override
  List<Object> get props => [];
}

class FetchPlacesList extends PlaceEvent {

  @override
  String toString() => "Fetch Places List";
}