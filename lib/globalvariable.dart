class MyService {
  static final MyService _instance = MyService._internal();

  factory MyService() => _instance;


  MyService._internal(){
    OriginAddress = "UTD";
    String mapKey = 'AIzaSyCnbekIXH6m8YiE1uam_D6qeh7ge5hZZQ8';
    destinationAddress = "UTD";
  }


  String? OriginAddress;
  String? get _originAddress => OriginAddress;
  set _originAddress(String? value) => OriginAddress = value;

  String? destinationAddress;
  String? get _destinationAddress => destinationAddress;
  set _destinationAddress(String? value) => destinationAddress = value;

}
