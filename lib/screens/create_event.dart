import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:secondapp/screens/calendar_screen.dart';
import 'package:secondapp/screens/current_ride_parent.dart';
import 'package:secondapp/screens/drive_history.dart';
import 'package:secondapp/screens/my_profile_screen.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({Key? key}) : super(key: key);

  @override
  _CreateEventState createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {

  int _index = 0;

  @override
  Widget build(BuildContext context) {

    final driverName = TextFormField(
      textAlign: TextAlign.center,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        fillColor: Color.fromRGBO(239, 242, 249, 1),
        filled: true,
        //prefixIcon: Icon(Icons.account_circle),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Driver",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final appBar = PreferredSize(
      preferredSize: Size.fromHeight(45),
      child: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        title: Text(
          'Carpool Coordination',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
    );

    final passengerNames = TextFormField(
      textAlign: TextAlign.center,
      autofocus: false,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        fillColor: Color.fromRGBO(239, 242, 249, 1),
        filled: true,
        //prefixIcon: Icon(Icons.account_circle),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Passengers",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final pickUpTime = TextFormField(
      textAlign: TextAlign.center,
      autofocus: false,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        fillColor: Color.fromRGBO(239, 242, 249, 1),
        filled: true,
        //prefixIcon: Icon(Icons.mail_outline_rounded),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Pick Up Time",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final pickUpAddress = TextFormField(
      textAlign: TextAlign.center,
      autofocus: false,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        fillColor: Color.fromRGBO(239, 242, 249, 1),
        filled: true,
        //prefixIcon: Icon(Icons.key_rounded),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Pick Up Address",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final dropOffAddress = TextFormField(
      textAlign: TextAlign.center,
      autofocus: false,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        fillColor: Color.fromRGBO(239, 242, 249, 1),
        filled: true,
        //prefixIcon: Icon(Icons.key_rounded),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Drop Off Address",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //Complete BUtton
    final createEventButton = Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(10),
      color: Color.fromRGBO(51, 54, 82, 1),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: 38,
        onPressed: null,
        child: Text(
          "Create Event",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
     //body: _children[_currentIndex],
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(51, 54, 82, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        title: Text(
          'Carpool Coordination',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon:
              Icon(Icons.arrow_back, color: Color.fromRGBO(250, 208, 44, 1)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
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
        ),
      ),
    );
  }
}
