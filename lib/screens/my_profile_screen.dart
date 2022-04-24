import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secondapp/model/parent_model.dart';
import 'package:secondapp/model/user_model.dart';
import 'package:secondapp/screens/theme.dart';

class ProfileApp extends StatefulWidget {
  const ProfileApp({Key? key}) : super(key: key);

  @override
  State<ProfileApp> createState() => _ProfileAppState();
}

class _ProfileAppState extends State<ProfileApp> {
  final _auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  UserModel loggedInUser = UserModel();

  bool editMode = true;

  final modelEditingController = new TextEditingController();
  final licensePlateEditingController = new TextEditingController();
  final addressEditingController = new TextEditingController();

  String userType = "";

  void clearText() {
    modelEditingController.clear();
    licensePlateEditingController.clear();
  }

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

  String getUserType() {
    if (loggedInUser.userType == "parents") {
      userType = "Parent Account";
    } else if (loggedInUser.userType == "children") {
      userType = "Child Account";
    }
    return userType;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 244, 249, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color:  primaryClr,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                width: double.infinity,
                height: 325.0,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        " ",
                        style: TextStyle(
                          fontSize: 50.0,
                          color: Colors.white,
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                       /* backgroundImage: NetworkImage(
                            'https://www.pngall.com/wp-content/uploads/5/Profile-PNG-Images.png'),*/
                        backgroundImage: AssetImage("Navy-Carpool-Coordination-No-Text.png"),
                        radius: 60.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        " ",
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "${loggedInUser.firstName} ${loggedInUser.secondName}",
                        style:  GoogleFonts.lato(
                         // TextStyle(
                          fontSize: 28.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                      //  ),
                        ),
                      ),
                      Text(
                        " ",
                        style: TextStyle(
                          fontSize: 5.0,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        getUserType(),
                        style:  GoogleFonts.lato(
                          // TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          //  ),
                        ),

                        /*style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                          fontWeight: FontWeight.bold,
                        ),*/
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                        clipBehavior: Clip.antiAlias,
                        color: Colors.white,
                        elevation: 5.0,
                      )
                    ],
                  ),
                ),
              ),
            ),
            _profileTabs(),
            SizedBox(
              height: 15.0,
            ),
            Container(
              width: 300.00,
              child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      editMode = !editMode;
                    });
                    updateUser();
                    clearText();
                    updateModel();
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  //elevation: 5.0,
                  padding: EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            primaryClr,
                           primaryClr,
                           // Color.fromRGBO(144, 173, 198, 1),
                           // Color.fromRGBO(144, 173, 198, 1)
                          ]),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      constraints:
                          BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                      alignment: Alignment.center,
                      child: Text(
                        editMode ? 'Edit' : 'Confirm',

                        style:  GoogleFonts.lato(
                          // TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          //  ),
                        ),

                        /*style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold),*/
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  _profileTabs() {
    if (loggedInUser.userType == "parents") {
      return Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 20.0, left: 16.0, right: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Car Model: ",

                style:  GoogleFonts.lato(
                  // TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  //  ),
                ),

              ),
              TextFormField(
                readOnly: editMode,
                textAlign: TextAlign.center,
                autofocus: false,
                obscureText: false,
                controller: modelEditingController,
                onSaved: (value) {
                  modelEditingController.text = value!;
                },
                decoration: InputDecoration(
                  fillColor: Color.fromRGBO(239, 242, 249, 1),
                  filled: true,
                  //prefixIcon: Icon(Icons.key_rounded),
                  contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  hintText: "${loggedInUser.model}",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "License Plate:",

                style:  GoogleFonts.lato(
                  // TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  //  ),
                ),
                /*style: TextStyle(
                    color: Color.fromRGBO(51, 54, 82, 1),
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),*/
              ),
              TextFormField(
                readOnly: editMode,
                textAlign: TextAlign.center,
                autofocus: false,
                obscureText: false,
                controller: licensePlateEditingController,
                onSaved: (value) {
                  licensePlateEditingController.text = value!;
                },
                decoration: InputDecoration(
                  fillColor: Color.fromRGBO(239, 242, 249, 1),
                  filled: true,
                  //prefixIcon: Icon(Icons.key_rounded),
                  contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  hintText: "${loggedInUser.licensePlate}",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Address: ",
                style: TextStyle(
                    color: Color.fromRGBO(51, 54, 82, 1),
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
              TextFormField(
                readOnly: editMode,
                textAlign: TextAlign.center,
                autofocus: false,
                obscureText: false,
                controller: addressEditingController,
                onSaved: (value) {
                  addressEditingController.text = value!;
                },
                decoration: InputDecoration(
                  fillColor: Color.fromRGBO(239, 242, 249, 1),
                  filled: true,
                  //prefixIcon: Icon(Icons.key_rounded),
                  contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  hintText: "${loggedInUser.address}",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Email:",
                style: TextStyle(
                  color: Color.fromRGBO(51, 54, 82, 1),
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                readOnly: true,
                textAlign: TextAlign.center,
                autofocus: false,
                obscureText: false,
                decoration: InputDecoration(
                  fillColor: Color.fromRGBO(239, 242, 249, 1),
                  filled: true,
                  //prefixIcon: Icon(Icons.key_rounded),
                  contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  hintText: "${loggedInUser.email}",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Phone Number:",
                style: TextStyle(
                    color: Color.fromRGBO(51, 54, 82, 1),
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
              TextFormField(
                readOnly: editMode,
                textAlign: TextAlign.center,
                autofocus: false,
                obscureText: false,
                controller: licensePlateEditingController,
                onSaved: (value) {
                  licensePlateEditingController.text = value!;
                },
                decoration: InputDecoration(
                  fillColor: Color.fromRGBO(239, 242, 249, 1),
                  filled: true,
                  //prefixIcon: Icon(Icons.key_rounded),
                  contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  hintText: "${loggedInUser.licensePlate}",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Address: ",
                style: TextStyle(
                    color: Color.fromRGBO(51, 54, 82, 1),
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
              TextFormField(
                readOnly: editMode,
                textAlign: TextAlign.center,
                autofocus: false,
                obscureText: false,
                controller: addressEditingController,
                onSaved: (value) {
                  addressEditingController.text = value!;
                },
                decoration: InputDecoration(
                  fillColor: Color.fromRGBO(239, 242, 249, 1),
                  filled: true,
                  //prefixIcon: Icon(Icons.key_rounded),
                  contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  hintText: "${loggedInUser.address}",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      );
    }
  }

  Future<void> updateUser() {
    User? user = _auth.currentUser;
    String model = modelEditingController.text;
    String licensePlateNum = licensePlateEditingController.text;

    return users
        .doc(user?.uid)
        .update({
          'model': model,
          'licensePlate': licensePlateNum,
        })
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  void updateModel() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }
}
