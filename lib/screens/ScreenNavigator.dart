import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:secondapp/screens/calendar_screen.dart';
import 'package:secondapp/screens/create_event.dart';
import 'package:secondapp/screens/current_ride_kid.dart';
import 'package:secondapp/screens/current_ride_parent.dart';
import 'package:secondapp/screens/drive_history.dart';
import 'package:secondapp/screens/my_profile_screen.dart';

import '../model/user_model.dart';

class ScreenNavigator extends StatefulWidget {
  const ScreenNavigator({Key? key}) : super(key: key);

  @override
  _ScreenNavigatorState createState() => _ScreenNavigatorState();
}

class _ScreenNavigatorState extends State<ScreenNavigator> {
  int _index = 0;
  Widget child = Container();

  Widget build(BuildContext context) {
    switch (_index) {
      case 0:
        child = CreateEvent();
        break;
      case 1:
        child = CalendarScreen();
        break;
      case 2:
        child = CRParent();
        break;
      case 3:
        child = DriveHistory();
        break;
      case 4:
        child = ProfileApp();
        break;
    }

    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 244, 249, 1), // Color.fromRGBO(0, 53, 102, 1),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
      child: BottomNavigationBar(
        currentIndex: _index,
        onTap: (int index) => setState(() => _index = index),
        backgroundColor: Color.fromRGBO(32, 33, 60, 1),
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 30.0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people_rounded,
              color: Colors.white,
            ),
            label: 'My Groups',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month_rounded,
              color: Colors.white,
            ),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
              color: Colors.white,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history_rounded,
              color: Colors.white,
            ),
            label: 'history',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_rounded,
              color: Colors.white,
            ),
            label: 'profile',
          ),
        ],
      ),
      ),
      body: Center(
        child: SizedBox.expand(
          child: child,
        ),
        /*child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '03/01/22',
                  style: TextStyle(
                    fontSize: 29,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                driverName,
                SizedBox(
                  height: 15,
                ),
                passengerNames,
                SizedBox(
                  height: 15,
                ),
                pickUpTime,
                SizedBox(
                  height: 15,
                ),
                pickUpAddress,
                SizedBox(
                  height: 15,
                ),
                dropOffAddress,
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 20,
                ),
                createEventButton,
                SizedBox(
                  height: 15,
                ),

              ],
            ),
          ),
        ),*/
      ),
    );
  }
}
