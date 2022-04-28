
// import 'package:flutter/material.dart';
// import 'package:her4/pages/InfoCalendar.dart';
// import 'package:her4/pages/InfoDropDown.dart';

// class AddInfo {
//   runApp( MaterialApp(
//     debugShowCheckedModeBanner: false,
//     initialRoute: 'addinfo-calendar',
//     routes:{
//       'addinfo-calendar' : (context) => InfoCalendar(),
//       'dropdown' : (context) => InfoDropDown(),
//     },
//   ));
// }

// import 'dart:html';


import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';



class AddInfo extends StatefulWidget {
  @override
  _AddInfoState createState() => _AddInfoState();
}

class _AddInfoState extends State<AddInfo> {
  late DateTime? _selectedDate;
  List? _myActivities;
  late String _myActivitiesResult;
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _myActivities = [];
    _myActivitiesResult = '';
    _resetSelectedDate();
  }

  _saveForm() {
    var form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      setState(() {
        _myActivitiesResult = _myActivities.toString();
      });
    }
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(Duration(days: 5));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF333A47),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Calendar Timeline',
                style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.tealAccent[100]),
              ),
            ),
            CalendarTimeline(
              showYears: true,
              initialDate: DateTime.now(),
              firstDate: DateTime(2021, 1, 15),
              lastDate: DateTime.now(),
              onDateSelected: (date) {
                  _selectedDate = date;
              },
              
              leftMargin: 20,
              monthColor: Colors.white70,
              dayColor: Colors.teal[200],
              dayNameColor: Color(0xFF333A47),
              activeDayColor: Colors.white,
              activeBackgroundDayColor: Colors.redAccent[100],
              dotsColor: Color(0xFF333A47),
              // selectableDayPredicate: (date) => date.day != 23,
              locale: 'en',
            ),

            Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(30),
                child: MultiSelectFormField(
                  autovalidate: AutovalidateMode.disabled,
                  fillColor: Color.fromARGB(255, 175, 175, 175),
                  chipBackGroundColor: Color.fromARGB(255, 0, 0, 0),
                  chipLabelStyle: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 252, 252, 252)),
                  dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
                  checkBoxActiveColor: Color(0xFF333A47),
                  checkBoxCheckColor: Colors.white,
                  dialogShapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                  title: Text(
                    "Symptoms",
                    style: TextStyle(fontSize: 16),
                  ),
                  validator: (value) {
                    if (value == null || value.length == 0) {
                      return 'Please select one or more options';
                    }
                    return null;
                  },
                  dataSource: [
                    {
                      "display": "Cramping",
                      "value": "Cramping",
                    },
                    {
                      "display": "Spotting",
                      "value": "Spotting",
                    },
                    {
                      "display": "HeadAche",
                      "value": "HeadAche",
                    },
                    {
                      "display": "Bleeding",
                      "value": "Bleeding",
                    },
                    {
                      "display": "MoodSwings",
                      "value": "MoodSwings",
                    },{
                      "display": "Tired",
                      "value": "Tired",
                    },{
                      "display": "Low Appetite",
                      "value": "Low Appetite",
                    },
                    {
                      "display": "High Appetite",
                      "value": "High Appetite",
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                  okButtonLabel: 'OK',
                  cancelButtonLabel: 'CANCEL',
                  hintWidget: Text('Please choose one or more'),
                  initialValue: _myActivities,
                  onSaved: (value) {
                    if (value == null) return;
                    setState(() {
                      _myActivities = value;
                    });
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: ElevatedButton(
                  child: Text(
                    'Save',
                    ),
                  onPressed: _saveForm,
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                // child: Text(_myActivitiesResult),
              )
            ],
          ),
        ),
      ),
          ],
        ),
      ),
    );
  }
}
