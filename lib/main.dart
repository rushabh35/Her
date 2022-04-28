import 'package:flutter/material.dart';
import 'package:her2/Home.dart';
import 'package:her2/Home_drawer.dart';
import 'package:her2/Login.dart';
import 'package:her2/Onboarding.dart';
import 'package:her2/Splash.dart';
import 'package:her2/register.dart';
import 'Home.dart';

  void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'splash',
    routes:{
      'splash' : (context) => SplashScreen(),
        
      'login' : (context) =>MyLogin(),
      'home_drawer' : (context) => HomePage(),
      'register' : (context) => MyRegister(),
      'calendar' : (context) => CalendarPage(),
      'home' : (context) => Example(),



    },
  ));
}
