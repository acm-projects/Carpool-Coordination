import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secondapp/screens/ScreenNavigator.dart';
import 'package:secondapp/screens/calendar_screen.dart';
import 'package:secondapp/screens/backendhomescreen.dart';
import 'package:secondapp/screens/backendregistrationscreen.dart';
import 'package:secondapp/screens/theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // form key
  final _formKey = GlobalKey<FormState>();

  //editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    //email feed

    final emailField = TextFormField(
      textAlign: TextAlign.center,
      autofocus: false,
      controller: emailController,
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
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        //prefixIcon: Icon(Icons.mail_outline_rounded),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        fillColor: Colors.white,//Color.fromRGBO(239, 242, 249, 1),
        filled: true,
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );

    final passwordField = TextFormField(
      textAlign: TextAlign.center,
      autofocus: false,
      controller: passwordController,
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
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        //prefixIcon: Icon(Icons.key_rounded),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        fillColor: Colors.white, //Color.fromRGBO(239, 242, 249, 1),
        filled: true,
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );

    final loginButton = Material(
     // elevation: 2,
      borderRadius: BorderRadius.circular(20),
      color: Color.fromRGBO(51, 54, 82, 1),//primaryClr, //Color.fromRGBO(144, 173, 198, 1),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: 225,
        height: 10,
        onPressed: () {
          signIn(emailController.text, passwordController.text);

        },
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            textStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20),
      ),
        ),
      ),
    );

    final appBar = Text("Carpool Coordination");
    /*PreferredSize(
      preferredSize: Size.fromHeight(45),
      child:
      AppBar(
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
    );*/

    //Sign up button
    final signUpButton = Material(
      //elevation: 5,
      borderRadius: BorderRadius.circular(20),
      color: primaryClr,//Color.fromRGBO(51, 54, 82, 1),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: 500,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => RegistrationScreen()));
          //signUp(emailEditingController.text, passwordEditingController.text);
        },
        child: Text(
          "Sign Up",
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            textStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ),
      ),
    );

    // Don't have an account text
    final noAcc = Text(
      'Dont have an account?',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(51, 54, 82, 1),
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
      ),*/

      body: Center(
        child: Container(
          padding: EdgeInsets.only(left: 10,top: 40,right: 10,bottom: 0),
        child: SingleChildScrollView(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 170,
                        child: Image.asset(
                          "assets/Purple-Carpool-Coordination.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      emailField,
                      SizedBox(
                        height: 10,
                      ),
                      passwordField,
                      SizedBox(
                        height: 35,
                      ),
                      loginButton,
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 90,
                      ),
                      noAcc,
                      SizedBox(
                        height: 15,
                      ),
                      signUpButton,
                      SizedBox(
                        height: 15,
                      ),
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

  // login function
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) =>
      {
        Fluttertoast.showToast(msg: "Login Successful"),
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => ScreenNavigator()))
      })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}
