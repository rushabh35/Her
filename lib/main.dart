import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:her2/services/auth.dart';
import 'pages/home/Home.dart';
import 'widgets/Home_drawer.dart';
import 'pages/Onboarding.dart';
import 'pages/Splash.dart';
import 'package:her2/pages/auth/login.dart';
import 'package:her2/constants/routes.dart';
import 'pages/auth/register.dart';
import 'pages/home/Home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

  Future<void> main() async {

    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    initializeDateFormatting();

  runApp( 
      MultiProvider(
        providers: [
          Provider<AuthenticationServices>(
            create: (context) => AuthenticationServices(FirebaseAuth.instance),
          ),
          StreamProvider(
            create: (context) =>
            context.read<AuthenticationServices>().authStateChanged,
            initialData: null,
          ),
        ],
        child: MaterialApp(
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
  ),
      ));
}
