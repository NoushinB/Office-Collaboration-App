import 'dart:convert';
import 'package:mulki_zerin/src/models/user/user_profile_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String AccessToken = "access_token";
  static const String RefreshToken = "refresh_token";
  static const String CurrentUserData = "current_user";
  static const String AppLanguageKey = 'current_language';
  static const String FirebaseInstanceId = "fcm_token";
  static const String NotificationsCount = "notifications_count";
  static const String OnBoardScreenSeen = 'onboard_seen';

  static LocalStorageService _instance;
  static SharedPreferences _preferences;

  static Future<LocalStorageService> getInstance() async {
    if (_instance == null) {
      _instance = LocalStorageService();
    }
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }
    return _instance;
  }

  // Access Token
  String get accessToken => _getFromDisk(AccessToken);

  set accessToken(String value) => _saveToDisk(AccessToken, value);

  // Refresh Token
  String get refreshToken => _getFromDisk(RefreshToken);

  set refreshToken(String value) => _saveToDisk(RefreshToken, value);

  UserProfileDataModel get currentUser {
    String dataString = _getFromDisk(CurrentUserData);
    try {
      return UserProfileDataModel.fromJson(json.decode(dataString));
    } catch (e) {
      return null;
    }
  }

  set currentUser(UserProfileDataModel user) {
    if (user == null) {
      _saveToDisk(CurrentUserData, "");
    } else {
      var dataJson = json.encode(user.toJson());
      _saveToDisk(CurrentUserData, dataJson);
    }
  }

  // Language Code
  String get languageCode => _getFromDisk(AppLanguageKey);

  set languageCode(String value) => _saveToDisk(AppLanguageKey, value);

  // Fcm Token
  String get firebaseInstanceId => _getFromDisk(FirebaseInstanceId);

  set firebaseInstanceId(String value) => _saveToDisk(FirebaseInstanceId, value);

  // Notifications
  String get unreadNotifications {
    var data = _getFromDisk(NotificationsCount);
    return data ?? "0";
  }
  set unreadNotifications(String count) {
    var currentCount = int.tryParse(unreadNotifications);
    currentCount += int.parse(count);
    _saveToDisk(NotificationsCount, currentCount.toString());
  }
  void clearUnreadNotifications(){
    _saveToDisk(NotificationsCount, "0");
  }

  bool get onBoardScreenSeen {
    return _getFromDisk(OnBoardScreenSeen) ?? false;
  }

  set onBoardScreenSeen(bool value) {
    _saveToDisk(OnBoardScreenSeen, value);
  }

  dynamic _getFromDisk(String key) {
    var value = _preferences.get(key);
    print('(TRACE) LocalStorageService:_getFromDisk. key: $key value: $value');
    return value;
  }

  void _saveToDisk<T>(String key, T content) {
    if (content is String) {
      _preferences.setString(key, content);
    }
    if (content is bool) {
      _preferences.setBool(key, content);
    }
    if (content is int) {
      _preferences.setInt(key, content);
    }
    if (content is double) {
      _preferences.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences.setStringList(key, content);
    }
  }
}
