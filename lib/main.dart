import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secondapp/screens/CalendarOneScreen.dart';
import 'package:secondapp/screens/calendar_screen.dart';
import 'package:secondapp/screens/backendloginscreen.dart';
import 'package:secondapp/screens/theme.dart';

import 'Services/theme_services.dart';

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

      home: LoginScreen(),
//test
    );
  }
}
