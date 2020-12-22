class MyHttpResponseModel {
  String _message;

  MyHttpResponseModel.fromJson(Map<String, dynamic> parsedJson) {
    _message = parsedJson['message'];
  }

  String get message => _message;
}
