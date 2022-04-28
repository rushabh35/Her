import 'package:flutter/material.dart';

class Period {

  Period({
    required this.startDate,
    required this.endDate,
    this.symptoms = const []
  });

  DateTime startDate;
  DateTime endDate;
  List<Map> symptoms;

  factory Period.fromMap(Map<String, dynamic> map) => Period(
    startDate: map['start_date'],
    endDate: map['end_date'],
    symptoms: map['symptoms']
  );
}