import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:her2/models/period.dart';
import 'package:her2/models/user.dart' as user;
import 'package:her2/services/datetimeServices.dart';

class DatabaseServices {

  final FirebaseAuth auth = FirebaseAuth.instance;

  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  final CollectionReference periodCollection = FirebaseFirestore.instance.collection('periods');

  Future<user.User> getUser(String id) async {
    var userdata = await userCollection.doc(id).get();
    user.User currentUser = user.userFromMap(userdata.data() as Map<String, dynamic>);
    debugPrint("Current user: $currentUser");
    debugPrint("Current user period: ${currentUser.periodList}");
    return currentUser;
  }

  Future<user.User> getCurrentUser() async {
    DocumentSnapshot userdata = await userCollection.doc(auth.currentUser!.uid).get();
    //print("auth uid userdata: ${jsonEncode(userdata.data()).runtimeType}");
    //print("auth uid userblah: ${jsonDecode(jsonEncode(userdata.data())).runtimeType}");
    Map<String, dynamic> userdataMap = jsonDecode(jsonEncode(userdata.data())) as Map<String, dynamic>;
    //print("userdata map: ${userdataMap.runtimeType}");
    user.User currentUser = user.User.fromMap(userdataMap as Map<String, dynamic>);
    debugPrint("Current user: $currentUser");
    debugPrint("Current user period: ${currentUser.periodList}");
    return currentUser;
  }

  updateCycleLength({required String userId, required int cycleLength}) async {
    await userCollection.doc(userId).update({
      "cycleLength": cycleLength
    });
  }

  updatePeriodLength({required String userId, required int periodLength}) async {
    await userCollection.doc(userId).update({
      "periodLength": periodLength
    });
  }

  updateAutoLength({required String userId, required bool autoLength}) async {
    await userCollection.doc(userId).update({
      "autoLength": autoLength
    });
  }

  automateLengths({required user.User currentUser, required List<Period> periodList}) async {
    int newCycleLength = 0;
    int newPeriodLength = 0;
    int len = periodList.length<10 ? periodList.length : 10;
    for(int i=0;i<len;i++){
      if(i!=len-1){
        newCycleLength += daysBetween(periodList[i+1].endDate, periodList[i].startDate);
      }
      if(i!=0){
        newPeriodLength += daysBetween(periodList[i].startDate, periodList[i].endDate);
      }
      debugPrint("$i cycle: ${newCycleLength} period: ${newPeriodLength}");
    }
    newCycleLength = (newCycleLength/(len-1)).round();
    if(currentUser.onPeriod){
      newPeriodLength = (newPeriodLength/(len-1)).round();
    } else{
      newPeriodLength += daysBetween(periodList[0].startDate, periodList[0].endDate);
      newPeriodLength = (newPeriodLength/len).round();
    }

    await updateCycleLength(userId: currentUser.id, cycleLength: newCycleLength.abs());
    await updatePeriodLength(userId: currentUser.id, periodLength: newPeriodLength.abs());
  }

  Future<List<Period>> getPeriodData({required user.User currentUser}) async {
    debugPrint("Current user rainbows: ${currentUser.periodList}");
    List<Period> periodList = [];

    for(int i=0;i<currentUser.periodList.length;i++){
      var doc = await periodCollection.doc(currentUser.periodList[i]).get();
      Period period = Period.fromMap(doc.data() as Map<String, dynamic>);
      periodList.add(period);
    }
    //List<Period> periodList = docSnapshot.map((doc) => Period.fromMap(doc.data() as Map<String, dynamic>)).toList();
    periodList.sort((Period b, Period a) => a.startDate.compareTo(b.startDate));
    debugPrint("Period list from db: $periodList");
    return periodList;
  }

  Future<Period> getLatestPeriodData({required user.User currentUser}) async {
    List<Period> periodList = await getPeriodData(currentUser: currentUser);
    debugPrint("Latest Period list from db: $periodList");
    return periodList[0];
  }

  addPeriod({required Period period}) async {
    await periodCollection.doc(period.id).set({
      "id": period.id,
      "userId": period.userId.trim(),
      "startDate": period.startDate,
      "endDate": period.endDate,
      "symptoms": period.symptoms
    });

    await userCollection.doc(period.userId.trim()).update({
      "periodList": FieldValue.arrayUnion([period.id])
    });

    if(DateTime.now().isBefore(period.endDate)){
      await userCollection.doc(period.userId.trim()).update({
        "onPeriod": true
      });
    }
  }

  endPeriod({required Period period}) async {
    await periodCollection.doc(period.id.trim()).update({
      "endDate": period.endDate,
    });

    await userCollection.doc(period.userId.trim()).update({
      "onPeriod": false
    });

    user.User thisUser = await getUser(period.userId.trim());
    if(thisUser.autoLength){
      List<Period> periodList = await getPeriodData(currentUser: thisUser);
      automateLengths(currentUser: thisUser, periodList: periodList);
    }
  }

  editPeriod({required Period period}) async {
    await periodCollection.doc(period.id.trim()).update({
      "startDate": period.startDate,
      "endDate": period.endDate,
      "symptoms": period.symptoms
    });

    user.User thisUser = await getUser(period.userId.trim());
    if(thisUser.onPeriod && DateTime.now().isAfter(period.endDate)){
      await userCollection.doc(period.userId.trim()).update({
        "onPeriod": false
      });
    } else if(!thisUser.onPeriod && DateTime.now().isBefore(period.endDate) && DateTime.now().isAfter(period.startDate)){
      await userCollection.doc(period.userId.trim()).update({
        "onPeriod": true
      });
    }

    if(thisUser.autoLength){
      List<Period> periodList = await getPeriodData(currentUser: thisUser);
      await automateLengths(currentUser: thisUser, periodList: periodList);
    }
  }

  deletePeriod({required Period period}) async {
    await periodCollection.doc(period.id).delete();

    await userCollection.doc(period.userId).update({
      "periodList": FieldValue.arrayRemove([period.id])
    });

    user.User thisUser = await getUser(period.userId.trim());
    if(thisUser.onPeriod && DateTime.now().isBefore(period.endDate) && DateTime.now().isAfter(period.startDate)){
      await userCollection.doc(period.userId.trim()).update({
        "onPeriod": false
      });
    }

    if(thisUser.autoLength){
      List<Period> periodList = await getPeriodData(currentUser: thisUser);
      await automateLengths(currentUser: thisUser, periodList: periodList);
    }
  }

  // editPeriod({required String id, required Period period, required String periodId}) async {
  //   await userCollection.doc(id).collection('periodList').doc(periodId).update({
  //     "startDate": period.startDate,
  //     "endDate": period.endDate,
  //     "symptoms": period.symptoms
  //   });
  // }

}