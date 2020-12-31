import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUserProfileData extends UserEvent {
  final String accessToken;

  const GetUserProfileData(this.accessToken);

  @override
  List<Object> get props => [accessToken];
}
