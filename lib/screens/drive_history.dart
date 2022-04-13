import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:secondapp/screens/theme.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secondapp/screens/theme.dart';

import '../Services/theme_services.dart';

class DriveHistory extends StatefulWidget {
  const DriveHistory({Key? key}) : super(key: key);

  @override
  _DriveHistoryState createState() => _DriveHistoryState();
}

class _DriveHistoryState extends State<DriveHistory> {
  String formattedDate = DateFormat('M/d/yyyy').format(DateTime.now());

  get notifyHelper => null; //lmao this like doesnt work

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: _showTasks(),
            ),
          )
        ],
      ),
    );
  }
  _showTasks() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('rides').orderBy('date').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
              height: MediaQuery.of(context).size.height/2.4,
              width: MediaQuery.of(context).size.width,

              child: ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            if(data['date'] != formattedDate){
              return Container(
                padding:
                EdgeInsets.symmetric(horizontal: 10,),
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(bottom: 8, top: 8),
                child: Container(
                  padding: EdgeInsets.all(16),
                  //  width: SizeConfig.screenWidth * 0.78,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: primaryClr,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        alignment: const Alignment(-1, 1),
                        margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Text("  03/29/22",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0)),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Driver: Spongebob",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0)),
                          Text(
                              "                         Departure Time: ",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0)),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Passengers: Aaron Arkansas,",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0)),
                          Text("                    06:20 PM   ",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0)),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Farhan MyTiresGone,",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0)),
                          Text(
                              "                       Arrival Time:",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0)),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0)),
                          Text(
                              "                                                                                06:40 PM",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            /*Container(
              height: 150,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(144, 173, 198, 1),
                  border: Border.all(
                    color: Color.fromRGBO(144, 173, 198, 1),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        alignment: const Alignment(-1, 1),
                        margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Text("  03/28/22",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0)),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Driver: Spongebob",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0)),
                          Text(
                              "                                       Departure Time: ",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0)),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Passengers: Aaron Arkansas,",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0)),
                          Text("                             06:20 PM   ",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0)),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Farhan MyTiresGone,",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0)),
                          Text(
                            "Parent: ${data['parent']}              Carpoolers: ${data['carpooler']}",
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(fontSize: 15, color: Colors.grey[100]),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                              "Destination: ${data['destination']}",
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(fontSize: 15, color: Colors.grey[100]),
                              ),

                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 60,
                      width: 0.5,
                      color: Colors.grey[200]!.withOpacity(0.7),
                    ),
                    RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        "Ride",
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ]),
                ),
              );
            }
            return SizedBox(

            );
          }).toList(),
          ),
          );
          });
  }
  _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Color.fromRGBO(245, 244, 249, 1), //context.theme.backgroundColor,
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
            size: 20,
            color: Get.isDarkMode ? Colors.white : Colors.black
        ),

      ),
      actions: [
        CircleAvatar(
          backgroundImage: AssetImage("Stray-Kids-Logo.png"),
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}

class DriveHistoryList {}
