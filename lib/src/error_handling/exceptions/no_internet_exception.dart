class NoInternetException implements Exception {
  String message;
  final int statusCode;

  NoInternetException({this.message, this.statusCode}) {
    if (message == null || message.isEmpty) {
      message = "Your device is not connected to internet";
    }
  }

  @override
  String toString() => message;
}