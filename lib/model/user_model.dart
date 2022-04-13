import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? secondName;
  String? userType;
  String? model;
  String? licensePlate;
  String? address;



  UserModel({this.uid, this.email, this.firstName, this.secondName, this.userType, this.model, this.licensePlate, this.address});

  //retrieve data from server

  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      secondName: map['secondName'],
      userType: map['userType'],
      model: map['model'],
      licensePlate: map['licensePlate'],
      address: map["address"],
    );
  }

  //sending data to the server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
      'userType': userType,
      'model': model,
      'licensePlate': licensePlate,
      'address': address,
    };
  }
}
