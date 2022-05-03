import 'dart:math';

User userFromMap(Map<String, dynamic> data) => User.fromMap(data);

Map userToJson(User data) => data.toJson();

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    this.onPeriod = false,
    this.autoLength = true,
    this.cycleLength = 28,
    this.periodLength = 6,
    this.periodList = const []
  });

  String id;
  String name;
  String email;
  bool onPeriod;
  bool autoLength;
  int cycleLength;
  int periodLength;
  List periodList;

  factory User.fromMap(Map<String, dynamic> map) {
    print("in user factory");
    print("factory map: ${map['name']}");
    print("factory map rtt: ${map.runtimeType}");
    return User(
        id: map['id'],
        name: map['name'] ?? "",
        email: map['email'] ?? "",
        onPeriod: map['onPeriod'] ?? false,
        autoLength: map['autoLength'] ?? true,
        cycleLength: int.parse(map['cycleLength'].toString()),
        periodLength: int.parse(map['periodLength'].toString()),
        periodList: map['periodList'] ?? []
      );}

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'name': name,
        'email': email,
        'onPeriod': onPeriod,
        'cycleLength': cycleLength,
        'periodLength': periodLength
      };
}
