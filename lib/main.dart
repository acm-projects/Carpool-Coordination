import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secondapp/screens/CalendarOneScreen.dart';
import 'package:secondapp/screens/backendhomescreen.dart';
import 'package:secondapp/screens/calendar_screen.dart';
import 'package:secondapp/screens/backendloginscreen.dart';
import 'package:secondapp/screens/drive_history.dart';
import 'package:secondapp/screens/theme.dart';

import 'Services/theme_services.dart';
import 'package:secondapp/screens/current_ride_kid.dart';
import 'package:secondapp/screens/current_ride_parent.dart';
import 'package:secondapp/screens/my_profile_screen.dart';
import 'package:secondapp/screens/recent_drive_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Email And Password Login',
      debugShowCheckedModeBanner: false,

      theme:Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeServices().theme,

      home: LoginScreen(), // if u want to run one screen on its own, assign ur class to home: ,, default is LoginScreen()
//test

    );
  }
}

class TestRouting extends StatefulWidget {
  const TestRouting({Key? key}) : super(key: key);

  @override
  State<TestRouting> createState() => _TestRoutingState();
}

class _TestRoutingState extends State<TestRouting> {

  PageController pageController=PageController();
  List<Widget>pages=[CalendarScreen(),ProfileApp(),CRParent(),CRKid(),DriveHistory()];
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
