import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({Key? key}) : super(key: key);

  @override
  _CreateEventState createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {

  int _currentIndex = 0;
  final List<Widget> _children = [];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex: index;
    });
  }

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
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
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
        child: Padding(
          padding: const EdgeInsets.all(30.0),
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
    );
  }
}
