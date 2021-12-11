import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const Has_LoggedIn_key = "has_user_logged_in";

  //To set the value of the user has logged in in the app
  static setUserHasLoggedIn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(Has_LoggedIn_key, value);
  }

  static Future<bool> getUserHasLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    bool? value = prefs.getBool(Has_LoggedIn_key);

    if (value != null && value == true) {
      return true;
    } else {
      return false;
    }
  }
}
