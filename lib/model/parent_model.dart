import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ParentModel {
  String? uid;
  String? email;
  String? firstName;
  String? secondName;
  String? parentClass;
  String? model;
  String? licensePlate;

  ParentModel({this.uid, this.email, this.firstName, this.secondName, this.parentClass, this.model, this.licensePlate});

  //retrieve data from server

  factory ParentModel.fromMap(map) {
    return ParentModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      secondName: map['secondName'],
      parentClass: map['parentClass'],
      model: map['model'],
      licensePlate: map['licensePlate'],

    );
  }

  //sending data to the server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
      'parentClass': parentClass,
      'model': model,
      'licensePlate': licensePlate,

    };
  }
}
