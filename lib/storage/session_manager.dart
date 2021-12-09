// ignore_for_file: non_constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static SharedPreferences prefs;
  static String KEY_AUTH = "insure-auth";
  static String KEY_IS_LOGGEDIN = "insure-isLoggedIn";

  // static String KEY_DEVICE_ID = 'device-id';
  // static String KEY_OTP_SENT = 'otp-sent';

  static Future initSharedPrefrence() async {
    prefs = await SharedPreferences.getInstance();
  }

  static String getAuth() {
    return SessionManager.prefs.getString(KEY_AUTH) ?? "";
  }

  static void setAuth(value) {
    SessionManager.prefs.setString(KEY_AUTH, value);
  }

  // static bool getOtpSent() {
  //   return SessionManager.prefs!.getBool(KEY_OTP_SENT) ?? false;
  // }

  // static void setOtpSent(value) {
  //   SessionManager.prefs!.setBool(KEY_OTP_SENT, value);
  // }

  // static String getDeviceId() {
  //   return SessionManager.prefs!.getString(KEY_DEVICE_ID) ?? "";
  // }

  // static void setDeviceId(value) {
  //   SessionManager.prefs!.setString(KEY_DEVICE_ID, value);
  // }

  static bool isLoggedIn() {
    return SessionManager.prefs.getBool(KEY_IS_LOGGEDIN) ?? false;
  }

  static void setLoggedIn(value) {
    SessionManager.prefs.setBool(KEY_IS_LOGGEDIN, value);
  }

  static void clearCache() {
    SessionManager.prefs.clear();
  }
}
