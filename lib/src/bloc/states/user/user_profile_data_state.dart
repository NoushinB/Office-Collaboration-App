import 'package:equatable/equatable.dart';
import 'package:mulki_zerin/src/models/user/user_profile_data.dart';

abstract class UserProfileDataState extends Equatable {
  const UserProfileDataState();

  @override
  List<Object> get props => [];
}

class UserProfileDataUninitialized extends UserProfileDataState {
  @override
  String toString() => 'User Profile Data Uninitialized';
}

class UserProfileDataLoading extends UserProfileDataState {
  @override
  String toString() => 'User Profile Data Loading';
}

class UserProfileDataError extends UserProfileDataState {
  final Exception exception;

  const UserProfileDataError(this.exception);

  @override
  List<Object> get props => [exception];

  @override
  String toString() => 'UserProfileData Error';
}

class UserProfileDataSuccess extends UserProfileDataState {
  final UserProfileDataModel result;

  const UserProfileDataSuccess({this.result});

  UserProfileDataSuccess copyWith({UserProfileDataModel result}) {
    return UserProfileDataSuccess(result: result ?? this.result);
  }

  @override
  List<Object> get props => [result];

  @override
  String toString() => 'UserProfileData Success';
}
