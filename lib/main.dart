import 'package:flutter/material.dart';
import 'pages/home/Home.dart';
import 'widgets/Home_drawer.dart';
import 'pages/Onboarding.dart';
import 'pages/Splash.dart';
import 'package:her2/pages/auth/login.dart';
import 'package:her2/constants/routes.dart';
import 'pages/auth/register.dart';
import 'pages/home/Home.dart';

  Future<void> main() async {

    // WidgetsFlutterBinding.ensureInitialized();
    // await Firebase.initializeApp();
    // initializeDateFormatting();

  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,

    initialRoute: splashPage,
    routes:{
      splashPage : (context) => SplashScreen(),
      loginPage : (context) =>MyLogin(),
      homeDrawerPage : (context) => HomePage(),
      registerPage : (context) => MyRegister(),
      calendarPage : (context) => CalendarPage(),
      homePage : (context) => Example(),
    },
  ));
}
