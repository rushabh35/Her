import 'package:flutter/material.dart';
import 'package:her2/services/database.dart';
import 'package:her2/services/datetimeServices.dart';
import 'package:her2/widgets/errorWidget.dart';
import 'package:her2/widgets/loadingWidget.dart';
import 'package:her2/widgets/noContentWidget.dart';

import '../../models/period.dart';
import '../../models/user.dart';

class Overview extends StatefulWidget {
	Overview({Key? key, required this.title}) : super(key: key);
	final String title;
	@override
	_OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {

	//int age = 10;
	Period? latestPeriod;
	User? currentUser;

	DatabaseServices _databaseServices = DatabaseServices();

	_endPeriodDialog(BuildContext context) async {
		return showDialog(

				context: context,
				builder: (context) {
					return AlertDialog(
						title: Text('Warning'),
						content: Text('Are you sure you want to do this?'),
						actions: <Widget>[
							TextButton(
								child: new Text('No'),
								onPressed: () async {
									Navigator.of(context).pop();
								},
							),
							TextButton(
								child: new Text('Yes'),
								onPressed: () async {
									latestPeriod!.endDate = DateTime.now();
									await _databaseServices.endPeriod(period: latestPeriod!);
									Navigator.of(context).pop();
								},
							)
						],
					);
				});

	}

	Map getDisplayDays(){
		int displayDays;
		String message = "";
		double indicatorValue;
		if(currentUser!.onPeriod){
			DateTime estimatedEndDay = latestPeriod!.startDate.add(Duration(days: currentUser!.periodLength));
			displayDays = daysBetween(latestPeriod!.startDate, DateTime.now()) + 1;
			//displayDays = daysBetween(DateTime.now(), estimatedEndDay);
			message = " day of Period.";
			indicatorValue = displayDays/currentUser!.periodLength;
		}
		else{
			DateTime nextEstimatedDay = latestPeriod!.endDate.add(Duration(days: currentUser!.cycleLength));
			if(DateTime.now().isAfter(nextEstimatedDay)){
				displayDays = daysBetween(nextEstimatedDay, DateTime.now());
				message = " days late. Please refer a doctor if you experience any abnormal symptoms";
				indicatorValue = 1;
			}
			else{
				displayDays = daysBetween(DateTime.now(), nextEstimatedDay);
				message = " days until next period";
				indicatorValue = 1-displayDays/currentUser!.cycleLength;
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
			future: _databaseServices.getCurrentUser(),
		  builder: (context, AsyncSnapshot snap) {
		  	if(snap.hasData){
		  		currentUser = snap.data;
					return currentUser!.periodList.isEmpty ? NoContentWidget() : FutureBuilder(
							future: _databaseServices.getLatestPeriodData(currentUser: currentUser!),
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
											SizedBox(height: 40,),
											currentUser!.onPeriod ?
											ElevatedButton(
													onPressed: (){
														_endPeriodDialog(context);
													},
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
					);
				} else if(snap.hasError){
					debugPrint("snap overview error: ${snap.error}");
					return CustomErrorWidget();
				} else {
					return LoadingWidget();
				}
		  }
		),
		);
	}
}
