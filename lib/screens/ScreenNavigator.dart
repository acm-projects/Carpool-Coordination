import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:secondapp/screens/calendar_screen.dart';
import 'package:secondapp/screens/create_event.dart';
import 'package:secondapp/screens/current_ride_parent.dart';
import 'package:secondapp/screens/drive_history.dart';
import 'package:secondapp/screens/my_profile_screen.dart';

class ScreenNavigator extends StatefulWidget {
  const ScreenNavigator({Key? key}) : super(key: key);

  @override
  _ScreenNavigatorState createState() => _ScreenNavigatorState();
}

class _ScreenNavigatorState extends State<ScreenNavigator> {

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    Widget child = Container();

    switch(_index){
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
        child =  DriveHistory();
        break;
      case 4:
        child = ProfileApp();
        break;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (int index) => setState(() => _index = index),

        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
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
              Icons.home_rounded,
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
      body: Center(
        child: SizedBox.expand(child: child,),
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
