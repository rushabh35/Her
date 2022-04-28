import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:her2/pages/auth/login.dart';
import 'package:her2/widgets/Home_drawer.dart';
import 'package:provider/provider.dart';
import 'package:her2/models/user.dart' as user;
import 'package:firebase_auth/firebase_auth.dart';
import '../services/database.dart';
import '../widgets/errorWidget.dart';
import '../widgets/loadingWidget.dart';
import 'package:her2/services/sharedPrefServices.dart' as sh;

class AuthenticationWrapper extends StatefulWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  _AuthenticationWrapperState createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {
  DatabaseServices databaseServices = DatabaseServices();

  Future<void> returnVoid() async {
    return;
  }

  Future<void> getUser(User firebaseUser) async {
    try {
      user.User currentUser = await databaseServices.getUser(firebaseUser.uid);
      await sh.setUserFromPrefs(currentUser);
    } catch (e, s) {
      // print(e.message);
      // print(s);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return Scaffold(
        body: FutureBuilder<List>(
            future: Future.wait([
              getUser(firebaseUser),
            ]),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              //print(snapshot.error);
              if (snapshot.hasData) {
                return HomePage();
              } else if (snapshot.hasError) {
                //print("auth wrapper: ${snapshot.error}");
                return CustomErrorWidget();
              } else {
                return Center(child: LoadingWidget());
              }
            }),
      );
    }
    return MyLogin();
  }
}
