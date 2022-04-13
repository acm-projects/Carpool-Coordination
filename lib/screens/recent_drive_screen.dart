import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:secondapp/main.dart';
import 'package:flutter/src/material/icons.dart';

class RecentDrive extends StatefulWidget {
  const RecentDrive({Key? key}) : super(key: key);

  @override
  _RecentDriveState createState() => _RecentDriveState();
} //please work plz

class _RecentDriveState extends State<RecentDrive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drive History'),
      ),
      body: Center(
        child: Container(
          child: Text('02/29/22'),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people_rounded,
              color: Color.fromRGBO(33, 36, 52, 1),
            ),
            label: 'My Groups',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month_rounded,
              color: Color.fromRGBO(33, 36, 52, 1),
            ),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.directions_car_rounded,
              color: Color.fromRGBO(33, 36, 52, 1),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history_rounded,
              color: Color.fromRGBO(33, 36, 52, 1),
            ),
            label: 'history',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_rounded,
              color: Color.fromRGBO(33, 36, 52, 1),
            ),
            label: 'profile',
          ),
        ],
      ),
    );
  }
}
