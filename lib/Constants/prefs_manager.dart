import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static bool check_log_in = false;
  static String check_auth_token = "";
  static String check_name = "";
  static String check_doctor_image = "";
  static String check_email = "";
  static String check_mobile = "";

  static late SharedPreferences _prefs;

  static void loadData()
  {
    check_log_in = getBool('is_logged_in_new');
    check_auth_token = getString("user_auth_token");
    check_name = getString('user_name');
    check_email = getString('user_email');
    check_mobile = getString('mobile');
    check_doctor_image = getString('user_image');
  }


  static Future<SharedPreferences> load() async {
    return _prefs = await SharedPreferences.getInstance();
  }

  //sets
  static Future<bool> setBool(String key, bool value) async =>
      _prefs.setBool(key, value);

  static Future<bool> setDouble(String key, double value) async =>
      _prefs.setDouble(key, value);

  static Future<bool> setInt(String key, int value) async =>
      _prefs.setInt(key, value);

  static Future<bool> setString(String key, String value) async =>
      _prefs.setString(key, value);

  static Future<bool> setStringList(String key, List<String> value) async =>
      _prefs.setStringList(key, value);

  //gets
  static bool getBool(String key, {bool def = false}) =>
      _prefs.getBool(key) ?? def;

  static double getDouble(String key, {double def = -1}) =>
      _prefs.getDouble(key) ?? def;

  static int getInt(String key, {int def = -1}) => _prefs.getInt(key) ?? def;

  static String getString(String key, {String def = ''}) =>
      _prefs.getString(key) ?? def;

  static void clear() {
    _prefs.clear();
  }
}
