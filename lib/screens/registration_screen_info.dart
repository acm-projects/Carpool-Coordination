import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:secondapp/model/parent_model.dart';
import 'package:secondapp/screens/ScreenNavigator.dart';
import 'package:secondapp/screens/theme.dart';
import 'create_event.dart';
import 'drive_history.dart';

class RegistrationScreenInfo extends StatefulWidget {
  const RegistrationScreenInfo({Key? key}) : super(key: key);

  @override
  _RegistrationScreenInfoState createState() => _RegistrationScreenInfoState();
}

class _RegistrationScreenInfoState extends State<RegistrationScreenInfo> {
  final _auth = FirebaseAuth.instance;
  CollectionReference users =
  FirebaseFirestore.instance.collection('users');

  final modelEditingController = new TextEditingController();
  final licensePlateEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Car Model Question
    final carModelQuestion = Text(
      'What is the model of your car?',
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.left,
    );

    // Car Model Field
    final carModelField = TextFormField(
      textAlign: TextAlign.center,
      autofocus: false,
      controller: modelEditingController,
      onSaved: (value) {
        modelEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        fillColor: Colors.white, //Color.fromRGBO(239, 242, 249, 1),
        filled: true,
        //prefixIcon: Icon(Icons.account_circle),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Model",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );

    // Plate Num Question
    final plateNumQuestion = Text(
      'What is your license plate number?',
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.left,
    );

    // Plate Num Field
    final plateNumField = TextFormField(
      textAlign: TextAlign.center,
      autofocus: false,
      controller: licensePlateEditingController,
      onSaved: (value) {
        licensePlateEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        fillColor: Colors.white, //Color.fromRGBO(239, 242, 249, 1),
        filled: true,
        //prefixIcon: Icon(Icons.account_circle),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Plate Number",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );

    // Complete Button
    final completeButton = Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(20),
      color: primaryClr, // Color.fromRGBO(51, 54, 82, 1),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: 38,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ScreenNavigator()));
          updateUser();
        },
        child: Text(
          "Complete",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 244, 249, 1),

      /*appBar: AppBar(
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
          icon: Icon(Icons.arrow_back, color: Color.fromRGBO(250, 208, 44, 1)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),*/
      body: Center(
    child: SingleChildScrollView(
    child: Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          //key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 0,
              ),
              SizedBox(
                height: 91,
                child: Image.asset(
                  "assets/Stray-Kids-Logo.png",
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              carModelQuestion,
              SizedBox(
                height: 05,
              ),
              carModelField,
              SizedBox(
                height: 15,
              ),
              plateNumQuestion,
              SizedBox(
                height: 05,
              ),
              plateNumField,
              SizedBox(
                height: 15,
              ),
              completeButton,
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    ),)
    ,
    )
    ,
    );
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
}
