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
      backgroundColor: Color.fromRGBO(245, 244, 249, 1),
      appBar: _appBar(),

      body: Container(
        padding: EdgeInsets.only( top: 10, bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10),

              //padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(
                "\tRide History",
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
            Expanded(
              child: Container(
                child: _showTasks(),
              ),
            )
          ],
        ),
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
                      child: Row(children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "${data['date']}                 ",
                                    style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Icon(
                                    Icons.access_time_rounded,
                                    color: Colors.grey[200],
                                    size: 18,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    "${data['startTime']} - ${data['endTime']}",
                                    style: GoogleFonts.lato(
                                      textStyle:
                                      TextStyle(fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[100]),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Parent: ${data['parent']}",
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(fontSize: 15, color: Colors.grey[100]),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Carpoolers: ${data['carpooler']}",
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


