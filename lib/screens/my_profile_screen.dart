import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:secondapp/model/parent_model.dart';

class ProfileApp extends StatefulWidget {
  const ProfileApp({Key? key}) : super(key: key);

  @override
  State<ProfileApp> createState() => _ProfileAppState();
}

class _ProfileAppState extends State<ProfileApp> {
  final _auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;
  CollectionReference parents =
  FirebaseFirestore.instance.collection('parents');
  ParentModel loggedInUser = ParentModel();

  bool editMode = true;

  final modelEditingController = new TextEditingController();
  final licensePlateEditingController = new TextEditingController();

  void clearText(){
    modelEditingController.clear();
    licensePlateEditingController.clear();
  }

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("parents")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = ParentModel.fromMap(value.data());
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(51, 54, 82, 1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                width: double.infinity,
                height: 350.0,
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
                        radius: 70.0,
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
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
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
                        "Parent",
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        clipBehavior: Clip.antiAlias,
                        color: Colors.white,
                        elevation: 5.0,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 30.0, horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Car Model:",
                      style: TextStyle(
                        color: Color.fromRGBO(51, 54, 82, 1),
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextFormField(
                      readOnly: editMode,
                      textAlign: TextAlign.center,
                      autofocus: false,
                      obscureText: true,
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
                      obscureText: true,
                      controller: licensePlateEditingController,
                      onSaved: (value) {
                        licensePlateEditingController .text = value!;
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
                  ],
                ),
              ),
            ),
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
                  elevation: 5.0,
                  padding: EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            Color.fromRGBO(144, 173, 198, 1),
                            Color.fromRGBO(144, 173, 198, 1)
                          ]),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      constraints:
                          BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                      alignment: Alignment.center,
                      child: Text(
                        editMode ? 'Edit':'Confirm',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> updateUser(){
    User? user = _auth.currentUser;
    String model = modelEditingController.text;
    String licensePlateNum = licensePlateEditingController.text;

    return parents
        .doc(user?.uid)
        .update({
      'model': model,
      'licensePlate': licensePlateNum,
    })
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }
  void updateModel(){
    FirebaseFirestore.instance
        .collection("parents")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = ParentModel.fromMap(value.data());
      setState(() {});
    });
  }

}
