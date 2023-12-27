import 'package:doggo_pedia/app/constants/constants.dart';

class RemoteSettingHelpers<T> {
  static int getInt(dynamic rawValue, int defaultValue) {
    if (rawValue is String) {
      return int.tryParse(rawValue) ?? defaultValue;
    }
    return defaultValue;
  }

  static bool getBool(dynamic rawValue, bool defaultValue) {
    if (rawValue is String) {
      return rawValue != Constant.offSetting;
    }
    return defaultValue;
  }

  static String getString(dynamic rawValue, String defaultValue) {
    if (rawValue is String) {
      return rawValue;
    }
    return defaultValue;
  }
}
