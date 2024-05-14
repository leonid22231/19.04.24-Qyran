import 'package:shared_preferences/shared_preferences.dart';

class StorageController {
  static final instance = StorageController();
  String welcome = "welcome";
  String phone = "phone";
  String logIn = "logIn";

  Future<void> setPhone(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(phone, value);
  }

  Future<String?> getPhone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(phone);
  }

  Future<void> removePhone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(phone);
  }

  Future<bool> getLogIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(logIn) ?? false;
  }

  Future<void> setLogIn(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(logIn, value);
  }

  Future<bool> getWelcome() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(welcome) ?? true;
  }

  Future<void> setWelcome(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(welcome, value);
  }
}
