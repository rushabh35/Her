// import 'package:flutter/material.dart';

//     String? codeDialog;
//    String? valueText;

// class Settings extends StatefulWidget {
//   const Settings({Key? key, required this.title}) : super(key: key);
//   final String title;

//   @override
//   _SettingsState createState() => _SettingsState();
// }

// class _SettingsState extends State<Settings> {
//   TextEditingController _textFieldController = TextEditingController();

//   Future<void> _displayTextInputDialog(BuildContext context) async {
//     return showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text('TextField in Dialog'),
//             content: TextField(
//               onChanged: (value) {
//                 setState(() {
//                   valueText = value;
//                 });
//               },
//               controller: _textFieldController,
//               decoration: InputDecoration(hintText: "Text Field in Dialog"),
//             ),
//             actions: <Widget>[
//               FlatButton(
//                 color: Colors.red,
//                 textColor: Colors.white,
//                 child: Text('CANCEL'),
//                 onPressed: () {
//                   setState(() {
//                     Navigator.pop(context);
//                   });
//                 },
//               ),
//               FlatButton(
//                 color: Colors.green,
//                 textColor: Colors.white,
//                 child: Text('OK'),
//                 onPressed: () {
//                   setState(() {
//                     codeDialog = valueText;
//                     Navigator.pop(context);
//                   });
//                 },
//               ),

//             ],
//           );
//         });
//   }



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: (codeDialog == "123456") ? Colors.green : Colors.white,
//       appBar: AppBar(
//         elevation: 20,
//         backgroundColor: Colors.black,
//         title: const Text('HER'),
//       ),
//       body: Container(
//         child: FlatButton(
//           color: Colors.teal,
//           textColor: Colors.white,
//           onPressed: () {
//             _displayTextInputDialog(context);
//           },
//           child: Text('Cycle Lenght'),
//         ),
//       ),  
//     );
//   }
// }



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'lib.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:her2/models/user.dart';
import 'package:her2/services/database.dart';
bool status = false;


class Settings extends StatefulWidget {

  User? currentUser;
  Settings({this.currentUser});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  TextEditingController _cycleLengthTextEditingController = TextEditingController();
  TextEditingController _periodLengthTextEditingController = TextEditingController();

  DatabaseServices _databaseServices = DatabaseServices();

  _displayDialog(BuildContext context) async {
    return showDialog(

        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Cycle Length'),
            content: TextField(
              controller: _cycleLengthTextEditingController,
              textInputAction: TextInputAction.go,
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(hintText: "Enter your cycle length"),
            ),
            actions: <Widget>[
              FlatButton(
                child: new Text('Submit'),
                onPressed: () async {
                  await _databaseServices.updateCycleLength(userId: widget.currentUser!.id, cycleLength: int.parse(_cycleLengthTextEditingController.text));
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });

  }

    _displayDialogperiod(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Period Length'),
            content: TextField(
              controller: _periodLengthTextEditingController,
              textInputAction: TextInputAction.go,
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(hintText: "Enter your period length"),
            ),
            actions: <Widget>[
              FlatButton(
                child: new Text('Submit'),
                onPressed: () async {
                  await _databaseServices.updatePeriodLength(userId: widget.currentUser!.id, periodLength: int.parse(_periodLengthTextEditingController.text));
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF333A47),
      appBar: AppBar(
        elevation: 20,
        backgroundColor: Colors.black,
        title: const Text('HER'),
        actions: <Widget>[

  ],
      ),
      body: Column(

        children: [
          Text(
            widget.currentUser!.cycleLength.toString(),
            style: TextStyle(
                color: Colors.white,
              fontSize: 64
            ),
          ),
          Center(
            child: RaisedButton(
              // materialTapTargetSize:CupertinoIcons.square_split_1x2_fill
              child: Text(
                'Cycle Length',
                style: TextStyle(
                  color: Colors.white
                  ),
                ),
              color: Colors.pink,
              onPressed: () => _displayDialog(context),
            ),
          ),
          SizedBox(height: 40,),
          Text(
            widget.currentUser!.periodLength.toString(),
            style: TextStyle(
                color: Colors.white,
              fontSize: 64
            ),
          ),
          Center(
            child: RaisedButton(
              child: Text(
                'Period Length',
                style: TextStyle(
                  color: Colors.white
                  ),
                ),
              color: Colors.pink,
              onPressed: () => _displayDialogperiod(context),
            ),
          ),

        ],
      ),

    );
  }
}