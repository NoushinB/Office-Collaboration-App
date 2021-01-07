import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:mulki_zerin/src/models/property/create_property_model.dart';
import 'package:mulki_zerin/src/models/property/property_filter_model.dart';

abstract class PropertyEvent extends Equatable {
  const PropertyEvent();

  @override
  List<Object> get props => [];
}

class CreateNewProperty extends PropertyEvent {
  final String accessToken;
  final CreatePropertyModel model;
  final List<File> files;

  const CreateNewProperty(this.accessToken, this.model, this.files);

  @override
  List<Object> get props => [accessToken, model, files];
}

class FetchPropertiesList extends PropertyEvent {
  final String accessToken;
  final PropertyFilterModel filterModel;

  const FetchPropertiesList(this.accessToken, this.filterModel);

  @override
  List<Object> get props => [accessToken, filterModel];
}
