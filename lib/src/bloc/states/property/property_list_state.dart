import 'package:equatable/equatable.dart';
import 'package:mulki_zerin/src/models/property/properties_list_result.dart';

abstract class PropertyListState extends Equatable {
  const PropertyListState();

  @override
  List<Object> get props => [];
}

class PropertyListUninitialized extends PropertyListState {
  @override
  String toString() => 'PropertyListUninitialized';
}

class PropertyListError extends PropertyListState {
  final Exception exception;

  const PropertyListError(this.exception);

  @override
  List<Object> get props => [exception];

  @override
  String toString() => 'PropertyFilterError';
}

class PropertyListLoaded extends PropertyListState {
  final List<Property> properties;
  final bool hasReachedMax;
  final int lastPage;

  const PropertyListLoaded({this.properties, this.hasReachedMax, this.lastPage});

  PropertyListLoaded copyWith({List<Property> result, bool hasReachedMax, int lastPage}) {
    return PropertyListLoaded( properties: result ?? this.properties, hasReachedMax: hasReachedMax ?? this.hasReachedMax, lastPage: lastPage ?? this.lastPage);
  }

  @override
  List<Object> get props => [ properties, hasReachedMax, lastPage];

  @override
  String toString() => 'PropertyFilterLoaded { properties: ${properties.length}, hasReachedMax: $hasReachedMax }';
}
