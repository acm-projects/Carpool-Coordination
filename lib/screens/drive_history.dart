import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DriveHistory extends StatefulWidget {
  const DriveHistory({Key? key}) : super(key: key);

  @override
  _DriveHistoryState createState() => _DriveHistoryState();
}

class _DriveHistoryState extends State<DriveHistory> {
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
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Container(
              height: 150,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(144, 173, 198, 1),
                  border: Border.all(
                    color: Color.fromRGBO(144, 173, 198, 1),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Column(
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
                          Container(
                            child: Row(
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
                          ),
                          Container(
                            child: Row(
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
                          ),
                          Container(
                            child: Row(
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
                          ),
                          Container(
                            child: Row(
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
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Column(
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
                          Container(
                            child: Row(
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
                          ),
                          Container(
                            child: Row(
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
                          ),
                          Container(
                            child: Row(
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
                          ),
                          Container(
                            child: Row(
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
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Column(
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
                          Container(
                            child: Row(
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
                          ),
                          Container(
                            child: Row(
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
                          ),
                          Container(
                            child: Row(
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
                          ),
                          Container(
                            child: Row(
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
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Column(
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
                          Container(
                            child: Row(
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
                          ),
                          Container(
                            child: Row(
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
                          ),
                          Container(
                            child: Row(
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
                          ),
                          Container(
                            child: Row(
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
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DriveHistoryList {}
