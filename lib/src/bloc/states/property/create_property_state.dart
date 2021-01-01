import 'package:equatable/equatable.dart';

abstract class CreatePropertyState extends Equatable {
  const CreatePropertyState();

  @override
  List<Object> get props => [];
}

class CreatePropertyUninitialized extends CreatePropertyState {
  @override
  String toString() => 'CreatePropertyUninitialized';
}

class CreatePropertyBusy extends CreatePropertyState {
  @override
  String toString() => 'CreatePropertyBusy';
}

class CreatePropertyError extends CreatePropertyState {
  final Exception exception;

  const CreatePropertyError(this.exception);

  @override
  List<Object> get props => [exception];

  @override
  String toString() => 'CreatePropertyError';
}

class CreatePropertySuccess extends CreatePropertyState {
  const CreatePropertySuccess();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'Create Property Success';
}
