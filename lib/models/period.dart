import 'package:flutter/material.dart';

class Period {

  Period({
    required this.startDate,
    required this.endDate,
    this.symptoms = const []
  });

  DateTime startDate;
  DateTime endDate;
  List symptoms;

  factory Period.fromMap(Map<String, dynamic> map) => Period(
    startDate: DateTime.parse(map['startDate'].toDate().toString()),
    endDate: DateTime.parse(map['endDate'].toDate().toString()),
    symptoms: map['symptoms'] ?? []
  );
}

List<Period> testPeriodList = [



];