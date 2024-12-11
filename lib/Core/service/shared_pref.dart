import 'package:shared_preferences/shared_preferences.dart';
import '../constant/app_shared_pref_keys.dart';

class SharedPref {
  Future<String?> get(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<void> set(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(AppSharedPrefrencesKeys.tokenKey);
  }

  Future<List<String>> setList(String key, List<String> value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key, value);
    return prefs.getStringList(key)!;
  }

  Future<List<String>> getList(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.getStringList(key);
    return prefs.getStringList(key)!;
  }

  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
