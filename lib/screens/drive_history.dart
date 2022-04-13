import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
  get notifyHelper => null; //lmao this like doesnt work

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 244, 249, 1),
      appBar: _appBar(),
      /* appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            backgroundColor: Color.fromRGBO(51, 54, 82, 1),
        title: Text("Drive History",
        style: GoogleFonts.lato(
        textStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 25,
    ),
    ),
        ),
        ), ),*/
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 0, bottom: 30),
              child: Text(
                "\tDrive History",
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Container(
              height: 150,
              decoration: BoxDecoration(
                  color: primaryClr, //Color.fromRGBO(144, 173, 198, 1),
                  border: Border.all(
                    color: primaryClr, //Color.fromRGBO(144, 173, 198, 1),
                  ),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        alignment: const Alignment(-1, 1),
                        margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Text("  03/29/22",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0)),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Text("Driver: Spongebob",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0)),
                          ),
                          Expanded(
                            child: Text("Departure Time: ",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0)),
                          ),
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
                          Text("                       Arrival Time:",
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
                              "                                     Arrival Time:    ",
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
            Container(
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
                        child: Text("  03/27/22",
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
                              "                                     Arrival Time:    ",
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
            Container(
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
                        child: Text("  03/26/22",
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
                              "                                     Arrival Time:    ",
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
            ),*/
          ],
        ),
      ),
    );
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
