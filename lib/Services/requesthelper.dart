import 'dart:convert';

import 'package:http/http.dart' as http;
class RequestHelper{

  static Future<dynamic> getRequest(Uri url) async {

    http.Response reponse = await http.get(url);

    try{
      if(reponse.statusCode == 200){
        String data = reponse.body;
        var decodedData = jsonDecode(data);
        return decodedData;
      }
      else{
        return 'failed';
      }
    }
    catch(r){
      return 'failed';
    }
    
  }

}