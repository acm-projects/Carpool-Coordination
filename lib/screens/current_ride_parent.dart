import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:secondapp/main.dart';
import 'package:flutter/src/material/icons.dart';

class CRParent extends StatefulWidget {
  const CRParent({Key? key}) : super(key: key);

  @override
  _CRParentState createState() => _CRParentState();
} //please work plz

class _CRParentState extends State<CRParent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
        title: const Text('Current Ride'),
        backgroundColor: Color.fromRGBO(51, 54, 82, 1),
      ),
      body: Center(

        child: Card( // the white rectangle background
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                15), // rounded the edges of the blue card
          ),
          color: Color.fromRGBO(144, 173, 198, 1),

          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[

              ExpansionTile( // the expandy thing
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
              ),
            ],
          ),
        ),

      ),
    );
  }
}
