class AccessTokenResult {
  String _accessToken;
  int _expiresIn;
  String _tokenType;

  AccessTokenResult.fromJson(Map<String, dynamic> parsedJson) {
    _accessToken = parsedJson['access_token'];
    _expiresIn = parsedJson['expires_in'];
    _tokenType = parsedJson['token_type'];
  }

  String get accessToken => _accessToken;

  int get expiresIn => _expiresIn;

  String get tokenType => _tokenType;
}
