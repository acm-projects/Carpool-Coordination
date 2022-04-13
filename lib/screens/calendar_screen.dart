import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:secondapp/Services/notification_services.dart';
import 'package:secondapp/Services/theme_services.dart';
import 'package:secondapp/screens/addTask_screen.dart';
import 'package:secondapp/screens/theme.dart';
import 'package:secondapp/ui/widgets/button.dart';
import 'package:secondapp/ui/widgets/task_tile.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _selectedDate = DateTime.now();
  String formattedDate = DateFormat('M/d/yyyy').format(DateTime.now());

  var notifyHelper;



  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 244, 249, 1),
      appBar: _appBar(),
      body: Column(
        children: [
          _addTaskBar(),
          _addDateBar(),
          _showTasks(),

        ],
      ),
    );
  }

  _showTasks() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('rides').snapshots(),
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
                if(data['date'] == formattedDate){
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
                              Text(
                                "Parent: ${data['parent']}",
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
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
                                      TextStyle(fontSize: 13, color: Colors.grey[100]),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12),
                              Text(
                                "Carpoolers: ${data['carpooler']}",
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(fontSize: 15, color: Colors.grey[100]),
                                ),
                              ),
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

                );/*Container(
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
                            Text(
                              "Parent: ${data['parent']}",
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
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
                                    TextStyle(fontSize: 13, color: Colors.grey[100]),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Text(
                              "Carpoolers: ${data['carpooler']}",
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(fontSize: 15, color: Colors.grey[100]),
                              ),
                            ),
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
                );*/

                /*Card(
                  margin: EdgeInsets.only(bottom: 10, top: 10),
                  child: ListTile(
                    title: Text(data['parent']),
                    subtitle: Text(data['carpooler']),
                  ),
                );*/
              }).toList(),
            ),
          );
  });
  }

  /*_showTasks() {
    return Expanded(
      child: Obx(() {
        return ListView.builder(
          itemCount: 1,
          itemBuilder: (_, index) {
            print(1);
            return AnimationConfiguration.staggeredList(position: 1,
                child: SlideAnimation(child: FadeInAnimation(child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){

                      },
                      child: TaskTile(),
                    )
                  ],
                ),),));
          },
        );
      }),
    );
  }*/

  _addDateBar() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 10),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: primaryClr,
        selectedTextColor: Colors.white,
        dateTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
        dayTextStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
        monthTextStyle: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
        onDateChange: (date) {
          _selectedDate = date;
          setState(() {
            formattedDate = DateFormat('M/d/yyyy').format(_selectedDate);
          });
          print(formattedDate);
        },
      ),
    );
  }

  _addTaskBar() {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 15, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.yMMMMd().format(DateTime.now()),
                  style: subHeadingStyle,
                ),
                Text(
                  "Today",
                  style: headingStyle,
                ),
              ],
            ),
          ),
          MyButton(label: "+ Plan Trip", onTap: () => Get.to(AddRidePage()))
        ],
      ),
    );
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
            size: 20,
            color: Get.isDarkMode ? Colors.white : Colors.black),
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
