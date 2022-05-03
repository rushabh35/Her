import 'package:flutter/material.dart';
import 'package:her2/services/database.dart';
import 'package:her2/services/datetimeServices.dart';
import 'package:her2/widgets/errorWidget.dart';
import 'package:her2/widgets/loadingWidget.dart';

import '../../models/period.dart';
import '../../models/user.dart';

class Overview extends StatefulWidget {
	Overview({Key? key, required this.title, this.currentUser}) : super(key: key);
	final String title;
	User? currentUser;
	@override
	_OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {

	//int age = 10;
	Period? latestPeriod;

	DatabaseServices _databaseServices = DatabaseServices();

	Map getDisplayDays(){
		int displayDays;
		String message = "";
		double indicatorValue;
		if(widget.currentUser!.onPeriod){
			DateTime estimatedEndDay = latestPeriod!.startDate.add(Duration(days: widget.currentUser!.periodLength));
			displayDays = daysBetween(latestPeriod!.startDate, DateTime.now());
			//displayDays = daysBetween(DateTime.now(), estimatedEndDay);
			message = " day of Period.";
			indicatorValue = displayDays/widget.currentUser!.periodLength;
		}
		else{
			DateTime nextEstimatedDay = latestPeriod!.endDate.add(Duration(days: widget.currentUser!.cycleLength));
			if(DateTime.now().isAfter(nextEstimatedDay)){
				displayDays = daysBetween(nextEstimatedDay, DateTime.now());
				message = " days late. Please refer a doctor if you experience any abnormal symptoms";
				indicatorValue = 1;
			}
			else{
				displayDays = daysBetween(DateTime.now(), nextEstimatedDay);
				message = " days until next period";
				indicatorValue = 1-displayDays/widget.currentUser!.cycleLength;
			}
		}
		return {
			"days": displayDays,
			"message": message,
			"indicator": indicatorValue
		};
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
		backgroundColor: Color(0xFF333A47),
		body: FutureBuilder(
			future: _databaseServices.getLatestPeriodData(currentUser: widget.currentUser!),
			builder: (context, AsyncSnapshot snapshot) {

				if(snapshot.hasData){
					latestPeriod = snapshot.data;
					Map displayMap = getDisplayDays();
					return Column(
						mainAxisAlignment: MainAxisAlignment.center,

						children: [
							Text(
								displayMap['days'].toString(),
								style: const TextStyle(
									fontSize: 64.0,
									color: Color.fromARGB(255, 130, 207, 200),
									// color: Colors.teal,
								),
							),
							Text(
								displayMap['message'],
								textAlign: TextAlign.center,
								style: const TextStyle(
									fontSize: 18.0,
									color: Color.fromARGB(255, 130, 207, 200),

									// color: Colors.teal,
								),
							),
							Container(
								width: 400,
							  margin: EdgeInsets.only(top: 10),
							  child: LinearProgressIndicator(
							  	minHeight: 20,
							  	value: displayMap['indicator'],
							  	backgroundColor: Color.fromARGB(255, 235, 187, 187),
							  	color: Color.fromARGB(255, 223, 58, 47),
							  ),
							),
							// Slider(
							// 	label: "",
							// 	thumbColor: Colors.red[200],
							// 	activeColor: Color.fromARGB(255, 223, 58, 47),
							// 	inactiveColor: Color.fromARGB(255, 235, 187, 187),
							// 	value: 28 - age.toDouble(),
							// 	onChanged: (value) {
							// 		setState(() {
							// 			age = value.toInt();
							// 		});
							// 	},
							// 	min: 0,
							// 	max: 29,
							// ),
							widget.currentUser!.onPeriod ?
									ElevatedButton(
											onPressed: (){},
											child: Text(
												"End Period"
											)
									) : Container()
						],
					);
				} else if(snapshot.hasError){
					debugPrint("overview error: ${snapshot.error}");
					return CustomErrorWidget();
				} else {
					return LoadingWidget();
				}
			}
		),
		);
	}
}
