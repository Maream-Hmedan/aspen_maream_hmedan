import 'package:shared_preferences/shared_preferences.dart';
class Shared {
  static savePrefBoll(String key, bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(key, value);
  }
  static Future<bool> getPrefBool(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return  preferences.getBool(key)??false ;
  }
}
