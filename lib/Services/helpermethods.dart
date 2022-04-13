
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:secondapp/Services/requesthelper.dart';

class HelperMethods{

  static Future<String> findCoordinateAddress(Position position) async{

    String placeAddress = '';

    /*Uri url = Uri(
      scheme: 'https',
      host: 'maps.googleapis.com',
      path: "/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=AIzaSyCnbekIXH6m8YiE1uam_D6qeh7ge5hZZQ8",
    );*/

    final Map<String, String> _queryParameters = <String, String>{
      'latlng': "${position.latitude}${position.longitude}key=AIzaSyCnbekIXH6m8YiE1uam_D6qeh7ge5hZZQ8",

    };
    Uri url = Uri.https("maps.googleapis.com", "/maps/api/geocode/json", _queryParameters );

    print(url);

    var response = await RequestHelper.getRequest(url);

    if(response != 'failed'){
      placeAddress = response['results'][0]['formatted_address'];
    }
    return placeAddress;
  }
}
