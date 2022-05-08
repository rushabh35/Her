
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

import 'package:her2/widgets/errorWidget.dart';
import 'package:her2/widgets/loadingWidget.dart';
import 'package:uuid/uuid.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:her2/models/period.dart';
import 'package:her2/models/user.dart';
import 'package:her2/services/database.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';



class AddInfo extends StatefulWidget {

  @override
  _AddInfoState createState() => _AddInfoState();
}

class _AddInfoState extends State<AddInfo> {

  late DateTime? _selectedStartDate;
  List? _myActivities;
  late String _myActivitiesResult;
  final formKey = new GlobalKey<FormState>();

  User? currentUser;

  DatabaseServices _databaseServices = DatabaseServices();

  @override
  void initState() {
    super.initState();
    _myActivities = [];
    _myActivitiesResult = '';
    _selectedStartDate = DateTime.now();
  }

  _saveForm() async {
    var uuid = Uuid();
    var form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      setState(() {
        _myActivitiesResult = _myActivities.toString();
      });
     await  _databaseServices.addPeriod(
          period: Period(
            id: uuid.v1(),
              userId: currentUser!.id,
              startDate: _selectedStartDate!,
              endDate: _selectedStartDate!.add(Duration(days: currentUser!.periodLength)),
            symptoms: _myActivities ?? []
          )
      );
    }
  }

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Adding Period'),
            content: Text(
              "Are you sure you want to do this?"
            ),
            actions: <Widget>[
              FlatButton(
                child: new Text('Yes'),
                onPressed: () async {
                  await _saveForm();
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: new Text('No'),
                onPressed: () async {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  // void _resetSelectedDate() {
  //   _selectedDate = DateTime.now().add(Duration(days: 5));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF333A47),
      body: FutureBuilder(
        future: _databaseServices.getCurrentUser(),
        builder: (context, AsyncSnapshot<User> snapshot) {
          if(snapshot.hasData){
            currentUser = snapshot.data;
            return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Add a new period',
                      style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.tealAccent[100]),
                    ),
                  ),
                  CalendarTimeline(
                    showYears: true,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2001, 5, 5),
                    lastDate: DateTime.now(),
                    onDateSelected: (date) {
                      _selectedStartDate = date;
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
                              onPressed: (){
                                _displayDialog(context);
                              },
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
            );
          } else if(snapshot.hasError){
            debugPrint("add info snapshot error: ${snapshot.error}");
            return CustomErrorWidget();
          } else{
            return LoadingWidget();
          }
        }
      ),
    );
  }
}
