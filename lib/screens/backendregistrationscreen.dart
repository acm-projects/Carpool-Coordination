import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:secondapp/model/child_model.dart';
import 'package:secondapp/model/parent_model.dart';
import 'package:secondapp/model/user_model.dart';
import 'package:secondapp/screens/ScreenNavigator.dart';
import 'package:secondapp/screens/backendhomescreen.dart';
import 'package:secondapp/screens/create_event.dart';

import 'package:secondapp/screens/registration_screen_info.dart';
import 'package:secondapp/screens/theme.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  // form key
  final _formKey = GlobalKey<FormState>();

  //editing controller
  final firstNameEditingController = new TextEditingController();
  final lastNameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();
  final addressEditingController = new TextEditingController();

  String parentOrChild = "";

  @override
  Widget build(BuildContext context) {
    bool parentPressed = false;
    bool childPressed = false;
    bool pressAttention1 = false;
    bool pressAttention2 = false;

    Color _buttonColor1 = primaryClr; //Color.fromRGBO(144, 173, 198, 1);
    Color _buttonColor2 = Colors.green;
    //first name field
    final firstNameField = TextFormField(
      textAlign: TextAlign.center,
      autofocus: false,
      controller: firstNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{1,}$');
        if (value!.isEmpty) {
          return ("First Name Cannot Be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter Valid name (Min. 1 Characters)");
        }
        return null;
      },
      onSaved: (value) {
        firstNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        fillColor: Colors.white, //Color.fromRGBO(239, 242, 249, 1),
        filled: true,
        //prefixIcon: Icon(Icons.account_circle),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );

    final addressField = TextFormField(
      textAlign: TextAlign.center,
      autofocus: false,
      controller: addressEditingController,
      keyboardType: TextInputType.streetAddress,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{1,}$');
        if (value!.isEmpty) {
          return ("Address Cannot Be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter Valid Address");
        }
        return null;
      },
      onSaved: (value) {
        addressEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        fillColor: Colors.white, //Color.fromRGBO(239, 242, 249, 1),
        filled: true,
        //prefixIcon: Icon(Icons.account_circle),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Street Address",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );

    final appBar = PreferredSize(
      preferredSize: Size.fromHeight(45),
      child: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
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

    final parentChildQuestion = Text(
      'Who is this account for?',
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.left,
    );

    final secondNameField = TextFormField(
      textAlign: TextAlign.center,
      autofocus: false,
      controller: lastNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{1,}$');
        if (value!.isEmpty) {
          return ("Last Name Cannot Be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter Valid name (Min. 1 Characters)");
        }
      },
      onSaved: (value) {
        lastNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        fillColor: Colors.white, //Color.fromRGBO(239, 242, 249, 1),
        filled: true,
        //prefixIcon: Icon(Icons.account_circle),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Last Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );

    final emailField = TextFormField(
      textAlign: TextAlign.center,
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        //reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter A Valid Email");
        }
        return null;
      },
      onSaved: (value) {
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        fillColor: Colors.white, //Color.fromRGBO(239, 242, 249, 1),
        filled: true,
        //prefixIcon: Icon(Icons.mail_outline_rounded),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );

    final passwordField = TextFormField(
      textAlign: TextAlign.center,
      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password Required");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter Valid Password (Min. 6 Characters)");
        }
      },
      onSaved: (value) {
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        fillColor: Colors.white, //Color.fromRGBO(239, 242, 249, 1),
        filled: true,
        //prefixIcon: Icon(Icons.key_rounded),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );

    final confirmPasswordField = TextFormField(
      textAlign: TextAlign.center,
      autofocus: false,
      controller: confirmPasswordEditingController,
      obscureText: true,
      validator: (value) {
        if (passwordEditingController.text !=
            confirmPasswordEditingController.text) {
          return "Password Doesn't Match";
        }
        return null;
      },
      onSaved: (value) {
        confirmPasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        fillColor: Colors.white, //Color.fromRGBO(239, 242, 249, 1),
        filled: true,
        //prefixIcon: Icon(Icons.key_rounded),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Confirm Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );

    //signup button
    final signUpButton = Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(20),
      color: Color.fromRGBO(51, 54, 82, 1),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: 38,
        onPressed: () {
          signUp(emailEditingController.text, passwordEditingController.text);
        },
        child: Text(
          "Continue",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(51, 54, 82, 1),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10,top: 10, bottom: 10),
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 120,
                          child: Image.asset(
                            "Purple-Carpool-Coordination.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        firstNameField,
                        SizedBox(
                          height: 15,
                        ),
                        secondNameField,
                        SizedBox(
                          height: 15,
                        ),
                        emailField,
                        SizedBox(
                          height: 15,
                        ),
                        addressField,
                        SizedBox(
                          height: 15,
                        ),
                        passwordField,
                        SizedBox(
                          height: 15,
                        ),
                        confirmPasswordField,
                        SizedBox(
                          height: 15,
                        ),
                        parentChildQuestion,
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: new Row(
                            children: <Widget>[
                              //const Spacer(),
                              Expanded(
                                child: Center(
                                  child: ButtonTheme(
                                    minWidth: 120,
                                    height: 90,
                                    child: RaisedButton(
                                      color: pressAttention1
                                          ? _buttonColor2
                                          : _buttonColor1,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)),
                                      onPressed: () {
                                        setState(() {
                                          parentOrChild = "parents";
                                        });
                                      },
                                      child: Text(
                                        'Parent',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: ButtonTheme(
                                    minWidth: 120,
                                    height: 90,
                                    child: RaisedButton(
                                      child: Text(
                                        'Child',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)),
                                      color: _buttonColor1,
                                      onPressed: () {
                                        setState(() {
                                          parentOrChild = "children";
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height:35,
                        ),
                        signUpButton,

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postParentToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postParentToFirestore() async {
    //Calling our firestore
    //Calling our user model
    //sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();

    //writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.secondName = lastNameEditingController.text;
    userModel.userType = parentOrChild;
    userModel.address = addressEditingController.text;

    //firebase firestore
    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "User Account created successfully");

    if(parentOrChild == 'parents'){
      Navigator.pushAndRemoveUntil(
          (context),
          MaterialPageRoute(builder: (context) => RegistrationScreenInfo()),
              (route) => false);
    }
    else if(parentOrChild == 'children'){
      Navigator.pushAndRemoveUntil(
          (context),
          MaterialPageRoute(builder: (context) => ScreenNavigator()),
              (route) => false);
    }

  }
}
