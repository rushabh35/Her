import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/keys.dart';
import '../models/user.dart';

Future<void> setUserFromPrefs(User user) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  Map data = user.toJson();
  String str = jsonEncode(data);
  _prefs.setString(USER_KEY, str);
}