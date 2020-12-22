

import 'app_exception.dart';

class NoNetworkException implements AppException {
  String message;

  NoNetworkException({this.message}) {
    if (message == null || message.isEmpty) {
      message = "Your device does not have any network connection.";
    }
  }

  @override
  String toString() => message;
}
