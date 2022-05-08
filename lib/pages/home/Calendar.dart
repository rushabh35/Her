import 'package:flutter/material.dart';
import 'package:her2/services/database.dart';
import 'package:her2/widgets/loadingWidget.dart';
import 'package:intl/intl.dart';

import '../../models/period.dart';
import '../../models/user.dart';
import '../../widgets/errorWidget.dart';

class Calendar extends StatefulWidget {
   Calendar(
      {Key? key,
      this.initialStartDate,
      this.initialEndDate,
      this.startEndDateChange,
      this.minimumDate,
      this.maximumDate,
      this.currentUser})
      : super(key: key);

  final DateTime? minimumDate;
  final DateTime? maximumDate;
  final DateTime? initialStartDate;
  final DateTime? initialEndDate;
  User? currentUser;

  final Function(DateTime, DateTime)? startEndDateChange;

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  List<DateTime> dateList = <DateTime>[];
  DateTime currentMonthDate = DateTime.now();
  // DateTime? startDate;
  // DateTime? endDate;

  DatabaseServices _databaseServices = DatabaseServices();
  User? currentUser;
  List<Period> periodList = [];

  @override
  void initState() {
    setListOfDate(currentMonthDate);
    // if (widget.initialStartDate != null) {
    //   startDate = widget.initialStartDate;
    // }
    // if (widget.initialEndDate != null) {
    //   endDate = widget.initialEndDate;
    // }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void setListOfDate(DateTime monthDate) {
    dateList.clear();
    final DateTime newDate = DateTime(monthDate.year, monthDate.month, 0);
    int previousMothDay = 0;
    if (newDate.weekday < 7) {
      previousMothDay = newDate.weekday;
      for (int i = 1; i <= previousMothDay; i++) {
        dateList.add(newDate.subtract(Duration(days: previousMothDay - i)));
      }
    }
    for (int i = 0; i < (42 - previousMothDay); i++) {
      dateList.add(newDate.add(Duration(days: i + 1)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _databaseServices.getCurrentUser(),
      builder: (context, AsyncSnapshot<User> snapshot) {
        if(snapshot.hasData){
          currentUser = snapshot.data;
          return FutureBuilder(
            future: _databaseServices.getPeriodData(currentUser: currentUser!),
              builder: (context, AsyncSnapshot<List<Period>> snap) {
              if(snap.hasData){
                periodList = snap.data!;
                return Container(
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: Column(

                    children: <Widget>[
                      Padding(

                        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 4, bottom: 4),
                        child: Row(

                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 38,
                                width: 38,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                                  border: Border.all(
                                    color: Theme.of(context).dividerColor,
                                  ),
                                ),
                                child: Material(

                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                                    onTap: () {
                                      setState(() {
                                        currentMonthDate = DateTime(currentMonthDate.year, currentMonthDate.month, 0);
                                        setListOfDate(currentMonthDate);
                                      });
                                    },
                                    child: Icon(
                                      Icons.keyboard_arrow_left,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  DateFormat('MMMM, yyyy').format(currentMonthDate),
                                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Color.fromARGB(255, 136, 136, 136)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 38,
                                width: 38,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                                  border: Border.all(
                                    color: Theme.of(context).dividerColor,
                                  ),
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                                    onTap: () {
                                      setState(() {
                                        currentMonthDate = DateTime(currentMonthDate.year, currentMonthDate.month + 2, 0);
                                        setListOfDate(currentMonthDate);
                                      });
                                    },
                                    child: Icon(
                                      Icons.keyboard_arrow_right,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
                        child: Row(
                          children: getDaysNameUI(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8, left: 8),
                        child: Column(
                          children: getDaysNoUI(),

                        ),
                      ),
                    ],
                  ),
                );
              } else if(snap.hasError){
                debugPrint("period cal snap error: ${snap.error}");
                return CustomErrorWidget();
              } else {
                return LoadingWidget();
              }
              }
          );
        } else if(snapshot.hasError) {
          debugPrint("user cal snap error: ${snapshot.error}");
          return CustomErrorWidget();
        } else {
          return LoadingWidget();
        }
      }
    );
  }

  List<Widget> getDaysNameUI() {
    final List<Widget> listUI = <Widget>[];
    for (int i = 0; i < 7; i++) {
      listUI.add(
        Expanded(
          child: Center(
            child: Text(
              DateFormat('EEE').format(dateList[i]),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Theme.of(context).primaryColor),
            ),
          ),
        ),
      );
    }
    return listUI;
  }

  List<Widget> getDaysNoUI() {
    
    final List<Widget> noList = <Widget>[];
    int count = 0;
    for (int i = 0; i < dateList.length / 7; i++) {
      final List<Widget> listUI = <Widget>[];
      for (int i = 0; i < 7; i++) {
        final DateTime date = dateList[count];
        //debugPrint("Calendar dateList date: $date");
        listUI.add(
          Expanded(
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 3, bottom: 3),
                      child: Material(
                        color: Color.fromARGB(0, 0, 0, 0),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 2,
                              bottom: 2,
                              left: isStartDateRadius(date) ? 4 : 0,
                              right: isEndDateRadius(date) ? 4 : 0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: periodList.isNotEmpty
                                  ? getIsItStartAndEndDate(date) || getIsInRange(date)
                                      ? Theme.of(context).primaryColor.withOpacity(0.4)
                                      : Colors.transparent
                                  : Colors.transparent,
                              borderRadius: BorderRadius.only(
                                bottomLeft:
                                    isStartDateRadius(date) ? const Radius.circular(18.0) : const Radius.circular(0.0),
                                topLeft:
                                    isStartDateRadius(date) ? const Radius.circular(18.0) : const Radius.circular(0.0),
                                topRight:
                                    isEndDateRadius(date) ? const Radius.circular(18.0) : const Radius.circular(0.0),
                                bottomRight:
                                    isEndDateRadius(date) ? const Radius.circular(18.0) : const Radius.circular(0.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        // highlightColor: Colors.white,
                        // borderRadius: const BorderRadius.all(Radius.circular(32.0)),
                        // onTap: () {
                        //   if (currentMonthDate.month == date.month) {
                        //     if (widget.minimumDate != null && widget.maximumDate != null) {
                        //       final DateTime newminimumDate = DateTime(
                        //           widget.minimumDate!.year, widget.minimumDate!.month, widget.minimumDate!.day - 1);
                        //       final DateTime newmaximumDate = DateTime(
                        //           widget.maximumDate!.year, widget.maximumDate!.month, widget.maximumDate!.day + 1);
                        //       if (date.isAfter(newminimumDate) && date.isBefore(newmaximumDate)) {
                        //         onDateClick(date);
                        //       }
                        //     } else if (widget.minimumDate != null) {
                        //       final DateTime newminimumDate = DateTime(
                        //           widget.minimumDate!.year, widget.minimumDate!.month, widget.minimumDate!.day - 1);
                        //       if (date.isAfter(newminimumDate)) {
                        //         onDateClick(date);
                        //       }
                        //     } else if (widget.maximumDate != null) {
                        //       final DateTime newmaximumDate = DateTime(
                        //           widget.maximumDate!.year, widget.maximumDate!.month, widget.maximumDate!.day + 1);
                        //       if (date.isBefore(newmaximumDate)) {
                        //         onDateClick(date);
                        //       }
                        //     } else {
                        //       onDateClick(date);
                        //     }
                        //   }
                        // },
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Container(
                            decoration: BoxDecoration(
                              color: getIsItStartAndEndDate(date) ? Theme.of(context).primaryColor : Colors.transparent,
                              borderRadius: const BorderRadius.all(Radius.circular(32.0)),
                              border: Border.all(
                                color: getIsItStartAndEndDate(date) ? Colors.white : Colors.transparent,
                                width: 2,
                              ),
                              boxShadow: getIsItStartAndEndDate(date)
                                  ? <BoxShadow>[
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.6),
                                          blurRadius: 4,
                                          offset: const Offset(0, 0)),
                                    ]
                                  : null,
                            ),
                            child: Center(
                              child: Text(
                                '${date.day}',
                                style: TextStyle(
                                    color: getIsItStartAndEndDate(date)
                                        ? Colors.white
                                        : currentMonthDate.month == date.month
                                            ? Colors.black
                                            : Colors.grey.withOpacity(0.6),
                                    fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
                                    fontWeight: getIsItStartAndEndDate(date) ? FontWeight.bold : FontWeight.normal),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 9,
                      right: 0,
                      left: 0,
                      child: Container(
                        height: 6,
                        width: 6,
                        decoration: BoxDecoration(
                            color: DateTime.now().day == date.day &&
                                    DateTime.now().month == date.month &&
                                    DateTime.now().year == date.year
                                ? getIsInRange(date)
                                    ? Colors.white
                                    : Theme.of(context).primaryColor
                                : Color.fromARGB(0, 236, 9, 9),
                            shape: BoxShape.circle),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
        count += 1;
      }
      noList.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: listUI,
      ));
    }
    return noList;
  }

  bool getIsInRange(DateTime date) {
    for(int i=0;i<periodList.length;i++){
      if(date.isAfter(periodList[i]!.startDate) && date.isBefore(periodList[i].endDate)){
        return true;
      }
    }
    return false;
    // if (startDate != null && endDate != null) {
    //   if (date.isAfter(startDate!) && date.isBefore(endDate!)) {
    //     return true;
    //   } else {
    //     return false;
    //   }
    // } else {
    //   return false;
    // }
  }

  bool getIsItStartAndEndDate(DateTime date) {
    for(int i=0;i<periodList.length;i++){
      if(periodList[i]!.startDate.day == date.day && periodList[i]!.startDate.month == date.month && periodList[i]!.startDate.year == date.year ){
        return true;
      }
      else if(periodList[i]!.endDate.day == date.day && periodList[i]!.endDate.month == date.month && periodList[i]!.endDate.year == date.year) {
        return true;
      }
    }
    return false;
    // if (startDate != null &&
    //     startDate!.day == date.day &&
    //     startDate!.month == date.month &&
    //     startDate!.year == date.year) {
    //   return true;
    // } else if (endDate != null &&
    //     endDate!.day == date.day &&
    //     endDate!.month == date.month &&
    //     endDate!.year == date.year) {
    //   return true;
    // } else {
    //   return false;
    // }
  }

  bool isStartDateRadius(DateTime date) {
    for(int i=0;i<periodList.length;i++){
      if(periodList[i]!.startDate.day == date.day && periodList[i]!.startDate.month == date.month && periodList[i]!.startDate.year == date.year ){
        return true;
      } else if(date.weekday == 1) {
        return true;
      }
    }
    return false;
    // if (startDate != null && startDate!.day == date.day && startDate!.month == date.month) {
    //   return true;
    // } else if (date.weekday == 1) {
    //   return true;
    // } else {
    //   return false;
    // }
  }

  bool isEndDateRadius(DateTime date) {
    for(int i=0;i<periodList.length;i++){
      if(periodList[i]!.endDate.day == date.day && periodList[i]!.endDate.month == date.month && periodList[i]!.endDate.year == date.year) {
        return true;
      } else if(date.weekday == 7) {
        return true;
      }
    }
    return false;
    // if (endDate != null && endDate!.day == date.day && endDate!.month == date.month) {
    //   return true;
    // } else if (date.weekday == 7) {
    //   return true;
    // } else {
    //   return false;
    // }
  }

  // void onDateClick(DateTime date) {
  //   if (startDate == null) {
  //     startDate = date;
  //   } else if (startDate != date && endDate == null) {
  //     endDate = date;
  //   } else if (startDate!.day == date.day && startDate!.month == date.month) {
  //     startDate = null;
  //   } else if (endDate!.day == date.day && endDate!.month == date.month) {
  //     endDate = null;
  //   }
  //   if (startDate == null && endDate != null) {
  //     startDate = endDate;
  //     endDate = null;
  //   }
  //   if (startDate != null && endDate != null) {
  //     if (!endDate!.isAfter(startDate!)) {
  //       final DateTime d = startDate!;
  //       startDate = endDate;
  //       endDate = d;
  //     }
  //     if (date.isBefore(startDate!)) {
  //       startDate = date;
  //     }
  //     if (date.isAfter(endDate!)) {
  //       endDate = date;
  //     }
  //   }
  //   setState(() {
  //     try {
  //       widget.startEndDateChange!(startDate!, endDate!);
  //     } catch (_) {}
  //   });
  // }
}