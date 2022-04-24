import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:secondapp/globalvariable.dart';
import 'package:secondapp/model/ride.dart';
import 'package:secondapp/screens/map_screen.dart';
import 'package:secondapp/screens/theme.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:secondapp/main.dart';
import 'package:flutter/src/material/icons.dart';

import '../Services/notification_services.dart';
import '../Services/theme_services.dart';
import '../model/user_model.dart';

class CRParent extends StatefulWidget {
  const CRParent({Key? key}) : super(key: key);

  @override
  _CRParentState createState() => _CRParentState();
} //please work plz

class _CRParentState extends State<CRParent> {
  DateTime _selectedDate = DateTime.now();
  String formattedDate = DateFormat('M/d/yyyy').format(DateTime.now());
  String formattedTime = DateFormat('hh:mm').format(DateTime.now());
  var notifyHelper;

  MyService _myService = MyService();

  final _auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  String buttonText() {
    if (loggedInUser.userType == "parents") {
      return "Start Ride";
    } else {
      return "Pick Me Up!";
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Color.fromRGBO(245, 244, 249, 1),
      /*appBar: AppBar(

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
        title: const Text('Current Ride'),
        backgroundColor: Color.fromRGBO(51, 54, 82, 1),
      ),*/

      body: Container(
        padding: EdgeInsets.only( top: 10, bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10),

              //padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(
                "\tUpcoming Ride",
                textAlign: TextAlign.left,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Card(
              // the white rectangle background
              //elevation: 5.0,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    15), // rounded the edges of the blue card
              ),
              color: primaryClr, //Color.fromRGBO(144, 173, 198, 1),

              margin: EdgeInsets.fromLTRB(10, 30, 10, 10),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Flexible(child: _showCurrentRide()),
                  /*ExpansionTile( // the expandy thing
            tilePadding: const EdgeInsets.only(
                left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
              // text is further in

              leading: Icon(
                Icons.directions_car_rounded,
                color: Color.fromRGBO(51, 54, 82, 1),
              ),
              title: Text(
                '03/22/22',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
              subtitle: Text('Driver: Spongebob',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
              children: <Widget>[
                ClipRRect( // rounded the corners
                  borderRadius: BorderRadius.circular(15),


                  child: Container(
                    child: ListTile( // drop down
                      contentPadding: EdgeInsets.only(
                          left: 25.0, right: 30.0, bottom: 15.0),
                      title: Text(
                        '\tPick-Up Address: \n\tDrop-Off Address: '
                            '\n\tPassengers: ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      trailing: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RaisedButton(onPressed: () {},
                            color: Color.fromRGBO(51, 54, 82, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Container(
                              // put the text in here
                              alignment: Alignment.center,
                              child: Text(
                                "Start Ride",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                )
              ]
      ),*/
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showCurrentRide() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('rides').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return SizedBox(
            child: ListView(
              shrinkWrap: true,
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

                if(data['date'] == formattedDate){
                  return ExpansionTile( // the expandy thing
                      tilePadding: const EdgeInsets.only(
                          left: 30.0, right: 30.0, top: 5.0, bottom: 5.0),
                      // text is further in

                      leading: Icon(
                        Icons.directions_car_rounded,
                        color: Color.fromRGBO(51, 54, 82, 1),
                      ),
                      title: Text(
                        "${data['date']}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Text(
                        'Driver: ${data['parent']}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                      children: <Widget>[
                        ClipRRect(
                          // rounded the corners
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            child: ListTile(
                              // drop down
                              contentPadding: EdgeInsets.only(
                                  left: 25.0, right: 30.0, bottom: 15.0),
                              title: Column(
                                children: [
                                  Text(
                                    'Pick-Up Time: ${data['startTime']}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    'Drop-Off Address: ${data['destination']}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    'Drop-Off Time:  ${data['endTime']}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              trailing: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ElevatedButton(onPressed: () {
                                    _myService.destinationAddress = data['destination'];
                                    _myService.OriginAddress = data['origin'];

                                    print(_myService.OriginAddress);
                                    print(_myService.destinationAddress);

                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => MapScreen()));
                                  },
                                    style: ElevatedButton.styleFrom(
                                        primary: Color.fromRGBO(51, 54, 82, 1),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15))),
                                    child: Container(
                                      // put the text in here
                                      alignment: Alignment.center,
                                      child: Text(
                                        buttonText(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ]);
                }
                return SizedBox();
              }).toList(),
            ),
          );
        });
  }
  _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Color.fromRGBO(245, 244, 249, 1),//context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          ThemeServices().switchTheme();
          notifyHelper.displayNotification(
            title: "Theme Changed",
            body: Get.isDarkMode
                ? "Activated Light Theme"
                : "Activated Dark Theme",
          );

          notifyHelper.scheduledNotification();
        },
        child: Icon(
            Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
            size: 24,
            color: Get.isDarkMode ? Colors.white : Colors.black),
      ),
      actions: [
        CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage("Navy-Carpool-Coordination-No-Text.png"),
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
