import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:her2/models/user.dart' as user;

class DatabaseServices {

  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  Future<user.User> getUser(String id) async {
    var userdata = await userCollection.doc(id).get();
    user.User currentUser = user.userFromMap(userdata.data() as Map<String, dynamic>, userdata.id);
    debugPrint("Current user: $currentUser");
    debugPrint("Current user period: ${currentUser.periodList}");
    return currentUser;
  }

}