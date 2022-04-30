import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/keys.dart';
import '../models/user.dart';

Future<void> clearPrefs() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  _prefs.setString(USER_KEY, "");
}

Future<void> setUserFromPrefs(User user) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  Map data = user.toJson();
  String str = jsonEncode(data);
  _prefs.setString(USER_KEY, str);
}

Future<User> getUserFromPrefs() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  debugPrint("User from prefs: ${_prefs.getString(USER_KEY)}");
  Map<String, dynamic> data = jsonDecode(_prefs.getString(USER_KEY)!);
  User user = User.fromMap(data);
  return user;
}