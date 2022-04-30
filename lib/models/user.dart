import 'dart:math';

User userFromMap(Map<String, dynamic> data) => User.fromMap(data);

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

  factory User.fromMap(Map<String, dynamic> map) {
    print("in user factory");
    print("factory map: ${map['name']}");
    print("factory map rtt: ${map.runtimeType}");
    return User(
        uid: map['id'],
        name: map['name'],
        email: map['email'],
        onPeriod: map['onPeriod'],
        cycleLength: int.parse(map['cycleLength'].toString()),
        periodLength: int.parse(map['periodLength'].toString())
      );}

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
