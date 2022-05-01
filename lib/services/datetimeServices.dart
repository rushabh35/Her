import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String getFormattedDate(DateTime dateTime){
  String date = DateFormat.yMMMd('en_US').format(dateTime);
  return date;
}

String getFullFormattedDate(DateTime dateTime){
  String date = DateFormat.yMMMMd('en_US').format(dateTime);
  return date;
}

String getFormattedTime(DateTime dateTime){
  String time = DateFormat.jm().format(dateTime);
  return time;
}

String getFormattedDateAndTime(DateTime dateTime){
  String date = DateFormat.yMMMd('en_US').format(dateTime);
  String time = DateFormat.jm().format(dateTime);
  String formattedDateTime = "$date at $time";
  return formattedDateTime;
}

String getFormattedDateRange({required DateTime dateFrom, required DateTime dateTo}){
  String formattedDateFrom = DateFormat.yMMMd('en_US').format(dateFrom).split(',')[0];
  String formattedDateTo = DateFormat.yMMMd('en_US').format(dateTo).split(',')[0];
  String formattedDateRange = "$formattedDateFrom - $formattedDateTo";
  return formattedDateRange;
}

String getFullFormattedDateRange({required DateTime dateFrom, required DateTime dateTo}){
  String formattedDateFrom = DateFormat.yMMMMd('en_US').format(dateFrom);
  String formattedDateTo = DateFormat.yMMMMd('en_US').format(dateTo);
  String formattedDateRange = "$formattedDateFrom - $formattedDateTo";
  return formattedDateRange;
}

String getFormattedTimeRange({required DateTime dateFrom, required DateTime dateTo}){
  String formattedTimeFrom = DateFormat.jm().format(dateFrom).split(',')[0];
  String formattedTimeTo = DateFormat.jm().format(dateTo).split(',')[0];
  String formattedDateRange = "";
  if(formattedTimeFrom==formattedTimeTo){
    formattedDateRange = "$formattedTimeFrom";
  }
  else{
    formattedDateRange = "$formattedTimeFrom - $formattedTimeTo";
  }
  return formattedDateRange;
}

int daysBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (to.difference(from).inHours / 24).round();
}