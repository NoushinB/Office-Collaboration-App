
import 'app_exception.dart';

class UnAuthorizedAccessException implements AppException {
  String message;

  UnAuthorizedAccessException({this.message}) {
    if (message == null || message.isEmpty) {
      message =
      "You don't have permission to access this content. please login first";
    }
  }

  @override
  String toString() => message;
}
