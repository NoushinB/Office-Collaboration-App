

import 'app_exception.dart';

class InternalServerException implements AppException {
  String message;

  InternalServerException({this.message}) {
    if (message == null || message.isEmpty) {
      message = "Unknown error occurred in server";
    }
  }

  @override
  String toString() => message;
}
