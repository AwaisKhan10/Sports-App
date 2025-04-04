import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sports_app/core/model/app_user.dart';

class LocalStorageService {
  static const String _userIdKey = 'user_id';
  static const String _userKey = 'user';
  static const String _accessTokenKey = 'access_token';
  static const String _isClientKey = 'isClient';
  static const String _emailKey = 'email';

  late final SharedPreferences _prefs;

  LocalStorageService() {
    init();
  }

  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // User ID
  String? get userId => _prefs.getString(_userIdKey);
  Future<void> setUserId(String value) => _prefs.setString(_userIdKey, value);

  // User object
  AppUser? get user {
    final userStr = _prefs.getString(_userKey);
    if (userStr == null) return null;
    return AppUser.fromJson(json.decode(userStr));
  }

  Future<void> setUser(AppUser user) =>
      _prefs.setString(_userKey, json.encode(user.toJson()));

  // Access token
  String? get accessToken => _prefs.getString(_accessTokenKey);
  Future<void> setAccessToken(String value) =>
      _prefs.setString(_accessTokenKey, value);

  // Client flag
  bool get isClient => _prefs.getBool(_isClientKey) ?? false;
  Future<void> setIsClient(bool value) => _prefs.setBool(_isClientKey, value);

  // Email
  String? get email => _prefs.getString(_emailKey);
  Future<void> setEmail(String value) => _prefs.setString(_emailKey, value);

  // Clear all data
  Future<void> clearAll() => _prefs.clear();
}
