import 'package:shared_preferences/shared_preferences.dart';

class StorageKey {
  static const prefsKeyLang = "PREFS_KEY_LANG";
}

class AppShared {
  static SharedPreferences? share;

  static Future<SharedPreferences?> init() async {
    share ??= await SharedPreferences.getInstance();
    return share;
  }
}

class AppPreferences {
  static AppPreferences? _instance;

  AppPreferences._();

  static AppPreferences get instance => _instance ??= AppPreferences._();
}
