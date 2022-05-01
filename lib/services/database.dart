import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:her2/models/period.dart';
import 'package:her2/models/user.dart' as user;

class DatabaseServices {

  final FirebaseAuth auth = FirebaseAuth.instance;

  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

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

  Future<List<Period>> getPeriodData(String id) async {
    var querySnapshot = await userCollection.doc(id).collection('periodList').get();
    List<Period> periodList = querySnapshot.docs.map((doc) => Period.fromMap(doc.data() as Map<String, dynamic>)).toList();
    periodList.sort((Period a, Period b) => a.startDate.compareTo(b.startDate));
    debugPrint("Period list from db: $periodList");
    return periodList;
  }

  Future<Period> getLatestPeriodData(String id) async {
    debugPrint("string id: $id");
    var querySnapshot = await userCollection.doc(id).collection('periodList').get();
    debugPrint("qsdocs: ${querySnapshot.docs}");
    List<Period> periodList = querySnapshot.docs.map((doc) {
      print("Period data: ${doc.data()}");
      return Period.fromMap(doc.data() as Map<String, dynamic>);
    }).toList();
    periodList.sort((Period a, Period b) => a.startDate.compareTo(b.startDate));
    debugPrint("Latest Period list from db: $periodList");
    return periodList.last;
  }

  addPeriod({required String id, required Period period}) async {
    await userCollection.doc(id).collection('periodList').add({
      "startDate": period.startDate,
      "endDate": period.endDate,
      "symptoms": period.symptoms
    });
  }

  editPeriod({required String id, required Period period, required String periodId}) async {
    await userCollection.doc(id).collection('periodList').doc(periodId).update({
      "startDate": period.startDate,
      "endDate": period.endDate,
      "symptoms": period.symptoms
    });
  }

  deletePeriod({required String id, required String periodId}) async {
    await userCollection.doc(id).collection('periodList').doc(periodId).delete();
  }

}