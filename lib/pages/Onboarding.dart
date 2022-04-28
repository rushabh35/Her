import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime(2021, 11, 5),
    end: DateTime(2022, 11, 10),
  );
  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;

    return Column(children: [
      const Text(
        'Date Range of your last period',
        style: TextStyle(fontSize: 16),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          Container(
            child: ElevatedButton(
              child: Text(
                '${start.year}/${start.month}/${start.day}',
              ),
              onPressed: pickDateRange,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: ElevatedButton(
              child: Text(
                '${end.year}/${end.month}/${end.day}',
              ),
              onPressed: pickDateRange,
            ),
          ),
        ],
      )
    ]);
  }
Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      initialDateRange: dateRange,
      firstDate: DateTime(2019),
      lastDate: DateTime(2023),
    );
    primaryColor: Color.fromARGB(255, 231, 66, 54);
    setState(() {
      dateRange = newDateRange ?? dateRange;

      if (newDateRange == null) return;
      setState(() => dateRange = newDateRange);
    });
  }
}