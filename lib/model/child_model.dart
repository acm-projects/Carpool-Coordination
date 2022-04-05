import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChildModel {
  String? uid;
  String? email;
  String? firstName;
  String? secondName;
  String? childClass;


  ChildModel({this.uid, this.email, this.firstName, this.secondName, this.childClass});

  //retrieve data from server

  factory ChildModel.fromMap(map) {
    return ChildModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      secondName: map['secondName'],
      childClass: map['childClass'],
    );
  }

  //sending data to the server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
      'childClass': childClass,

    };
  }
}
