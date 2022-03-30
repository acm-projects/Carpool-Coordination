import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:secondapp/screens/current_ride_kid.dart';
import 'package:secondapp/screens/current_ride_parent.dart';
import 'package:secondapp/screens/login_screen.dart';
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
    return MaterialApp(
      title: 'Email And Password Login',
      theme: ThemeData(

        primarySwatch: Colors.blueGrey,
      ),
      home: ProfileApp(), // if u want to run one screen on its own, assign ur class to home: ,, default is LoginScreen()
//test

    );
  }
}
