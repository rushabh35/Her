import 'dart:math';

User userFromMap(Map<String, dynamic> data, String id) => User.fromMap(data);

Map userToJson(User data) => data.toJson();

class User {
  User({
    required this.uid,
    required this.name,
    required this.email,
    this.onPeriod = false,
    this.cycleLength = 28,
    this.periodLength = 6
  });

  String uid;
  String name;
  String email;
  bool onPeriod;
  int cycleLength;
  int periodLength;
  dynamic periodList;

  factory User.fromMap(Map<String, dynamic> map) =>
      User(
        uid: map['uid'],
        name: map['name'],
        email: map['email'],
        onPeriod: map['onPeriod'],
        cycleLength: map['cycleLength'],
        periodLength: map['periodLength']
      );

  Map<String, dynamic> toJson() =>
      {
        'id': uid,
        'name': name,
        'email': email,
        'onPeriod': onPeriod,
        'cycleLength': cycleLength,
        'periodLength': periodLength
      };
}
