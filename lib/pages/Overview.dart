import 'package:flutter/material.dart';

class Overview extends StatefulWidget {
const Overview({Key? key, required this.title}) : super(key: key);
final String title;
@override
_OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
int age = 10;
@override
Widget build(BuildContext context) {
	return Scaffold(
	backgroundColor: Color(0xFF333A47),
	body: Column(
		mainAxisAlignment: MainAxisAlignment.center,
    
		children: [
      Text(
			 age.toString() ,
			style: const TextStyle(
			fontSize: 32.0,
      color: Color.fromARGB(255, 130, 207, 200),
      // color: Colors.teal,
			),
		),
    Text(
			 "days until next period",
			style: const TextStyle(
			fontSize: 18.0,
      color: Color.fromARGB(255, 130, 207, 200),

      // color: Colors.teal,
      ),
		),
		Slider(
			label: "",
      thumbColor: Colors.red[200],
      activeColor: Color.fromARGB(255, 223, 58, 47),
      inactiveColor: Color.fromARGB(255, 235, 187, 187),
			value: 28 - age.toDouble(),
			onChanged: (value) {
			setState(() {
				age = value.toInt();
			});
			},
			min: 0,
			max: 29,
		),
		],
	),
	);
}
}
