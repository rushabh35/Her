import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
    print("auth uid userdata: ${jsonEncode(userdata.data()).runtimeType}");
    print("auth uid userblah: ${jsonDecode(jsonEncode(userdata.data())).runtimeType}");
    Map<String, dynamic> userdataMap = jsonDecode(jsonEncode(userdata.data())) as Map<String, dynamic>;
    print("userdata map: ${userdataMap.runtimeType}");
    user.User currentUser = user.User.fromMap(userdataMap as Map<String, dynamic>);
    debugPrint("Current user: $currentUser");
    debugPrint("Current user period: ${currentUser.periodList}");
    return currentUser;
  }

}