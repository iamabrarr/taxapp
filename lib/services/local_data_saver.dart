import 'package:shared_preferences/shared_preferences.dart';

class AppLocalDataSaver {
  static String accesstoken = "ACCESSTOKEN";
  static String idtoken = "IDTOKEN";
  static String refreshToken = "REFRESHTOKEN";
  static String userLogin = "USERLOGIN";

  static setString(String value, String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static Future<String?> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static setBool(bool val, String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, val);
  }

  static Future<bool?> getBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  static setInt(int val, String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, val);
  }

  static Future<int?> getInt(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  static Future removeSession(String key) async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.remove(key);
  }
}
