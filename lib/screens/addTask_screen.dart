import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:secondapp/Services/LocalNotifyManager.dart';
import 'package:secondapp/Services/theme_services.dart';
import 'package:secondapp/model/ride.dart';
import 'package:secondapp/screens/ScreenNavigator.dart';
import 'package:secondapp/screens/calendar_screen.dart';
import 'package:secondapp/screens/theme.dart';
import 'package:secondapp/ui/widgets/button.dart';
import '../globalvariable.dart';
import '../model/user_model.dart';
import '../ui/widgets/input_field.dart';



class AddRidePage extends StatefulWidget {
  const AddRidePage({Key? key}) : super(key: key);

  @override
  _AddRidePageState createState() => _AddRidePageState();
}

class _AddRidePageState extends State<AddRidePage> {

  User? user = FirebaseAuth.instance.currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  UserModel loggedInUser = UserModel();

  MyService _myService = MyService();

  final TextEditingController _parentController = TextEditingController();
  final TextEditingController _carpoolerEdititngController =
      TextEditingController();
  final TextEditingController _addressEdititngController =
      TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _endTime = "9:30 PM";
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  int _selectedRemind = 15;
  int h = 0;
  int m = 0;
  List<int> remindList = [
    30,
    45,
    60,
  ];
  int _selectedColor = 0;
  String _selectedRepeat = "None";
  List<String> repeatList = ["Daily", "Weekly", "Monthly"];

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Coordinate Your Carpool",
                  style: headingStyle,
                ),
              ),
              MyInputField(
                title: "Parent Name",
                hint: "Enter Parent Name",
                controller: _parentController,
              ),
              MyInputField(
                title: "Carpoolers",
                hint: "Enter Carpoolers Name's",
                controller: _carpoolerEdititngController,
              ),
              MyInputField(
                  title: "Date",
                  hint: DateFormat.yMd().format(_selectedDate),
                  widget: IconButton(
                    icon: Icon(
                      Icons.calendar_today_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      _getDateFromUser();
                    },
                  )),
              Row(
                children: [
                  Expanded(
                      child: MyInputField(
                    title: "Start Time",
                    hint: _startTime,
                    widget: IconButton(
                      onPressed: () {
                        _getTimeFromUser(isStartTime: true);
                      },
                      icon: Icon(
                        Icons.access_time_filled_rounded,
                        color: Colors.grey,
                      ),
                    ),
                  )),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                      child: MyInputField(
                    title: "End time",
                    hint: _endTime,
                    widget: IconButton(
                      onPressed: () {
                        _getTimeFromUser(isStartTime: false);
                      },
                      icon: Icon(
                        Icons.access_time_filled_rounded,
                        color: Colors.grey,
                      ),
                    ),
                  )),
                ],
              ),
              MyInputField(
                title: "Drop-Off Address",
                hint: "Enter Location Address",
                controller: _addressEdititngController,
              ),
              MyInputField(
                title: "Reminder",
                hint: "$_selectedRemind Minutes Early",
                widget: DropdownButton(
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  iconSize: 32,
                  elevation: 4,
                  style: subTitleStyle,
                  underline: Container(
                    height: 0,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedRemind = int.parse(newValue!);
                    });
                  },
                  items: remindList.map<DropdownMenuItem<String>>((int value) {
                    return DropdownMenuItem<String>(
                      value: value.toString(),
                      child: Text(value.toString()),
                    );
                  }).toList(),
                ),
              ),
              MyInputField(
                title: "Repeat",
                hint: "$_selectedRepeat",
                widget: DropdownButton(
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  iconSize: 32,
                  elevation: 4,
                  style: subTitleStyle,
                  underline: Container(
                    height: 0,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedRepeat = newValue!;
                    });
                  },
                  items:
                      repeatList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: TextStyle(color: Colors.grey)),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _colorPallete(),
                  MyButton(
                      label: "Schedule Ride", onTap: () async {
                        _validateDate();
                        h = int.parse(_startTime.split(":")[0]) + 12;
                        m = int.parse(_startTime.split(":")[1].split(" ")[0]);
                        print(h);
                        print(m);
                        await localNotifyManager.showDailyAtTimeNotification(h, m,_parentController.text, _selectedRemind);
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _validateDate() {
    if (_parentController.text.isNotEmpty &&
        _carpoolerEdititngController.text.isNotEmpty &&
        _addressEdititngController.text.isNotEmpty) {
      //add to datebase
      postRideToFirestore();
      Get.back();
    } else if (_parentController.text.isEmpty ||
        _carpoolerEdititngController.text.isEmpty ||
        _addressEdititngController.text.isEmpty) {
      Get.snackbar("Required", "All fields are required!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          colorText: Colors.red,
          icon: Icon(
            Icons.warning_amber_rounded,
            color: Colors.red,
          ));
    }
  }

  _colorPallete() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Color",
          style: titleStyle,
        ),
        SizedBox(
          height: 8,
        ),
        Wrap(
          children: List<Widget>.generate(3, (int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedColor = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: index == 0
                      ? primaryClr
                      : index == 1
                          ? pinkClir
                          : yellowClr,
                  child: _selectedColor == index
                      ? Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 16,
                        )
                      : Container(),
                ),
              ),
            );
          }),
        )
      ],
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Icon(Icons.arrow_back_ios_new,
            size: 20, color: Get.isDarkMode ? Colors.white : Colors.black),
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

  _getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime(2023));

    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
      });
    } else {}
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    String _formattedTime = pickedTime.format(context);
    if (pickedTime == null) {
      print("time cancelled");
    } else if (isStartTime == true) {
      setState(() {
        _startTime = _formattedTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        _endTime = _formattedTime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
          hour: int.parse(_startTime.split(":")[0]),
          minute: int.parse(_startTime.split(":")[1].split(" ")[0]),
        ));
  }

  postRideToFirestore() {
    //Calling our firestore
    //Calling our user model
    //sending these values

    CollectionReference rides = FirebaseFirestore.instance.collection('rides');

    rideModel ridemodel = rideModel();

    //writing all the values
    ridemodel.uid = rides.id;
    ridemodel.parent = _parentController.text;
    ridemodel.carpooler = _carpoolerEdititngController.text;
    ridemodel.origin = loggedInUser.address;
    ridemodel.destination = _addressEdititngController.text;
    ridemodel.date = DateFormat.yMd().format(_selectedDate);
    ridemodel.startTime = _startTime;
    ridemodel.endTime = _endTime;
    ridemodel.color = _selectedColor;
    ridemodel.remind = _selectedRemind;
    ridemodel.repeat = _selectedRepeat;



    /*'uid' : uid,
    'parent' : parent,
    'carpooler': carpooler,
    'destination' : destination,
    'date' : date,
    'startTime' : startTime,
    'endTime' : endTime,
    'color' : color,
    'remind' : remind,
    'repeat' : repeat,*/

    //firebase firestore
    //firebaseFirestore.collection('rides').add(ridemodel.toMap());
    rides
        .add(ridemodel.toMap())
        .then((value) => print("Ride added"))
        .catchError((onError) => print('Fialed to add ride'));

    Fluttertoast.showToast(msg: "Ride created successfully");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => ScreenNavigator()),
        (route) => false);
  }
}
