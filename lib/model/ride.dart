class rideModel{
  String? uid;
  String? parent;
  String? carpooler;
  String? origin;
  String? destination;
  String? date;
  String? startTime;
  String? endTime;
  int? color;
  int? remind;
  String? repeat;

  rideModel({this.uid,this.parent,this.carpooler, this.origin, this.destination,this.date,this.startTime,this.endTime,this.color,this.remind,this.repeat});

  factory rideModel.fromMap(map){
    return rideModel(
      uid: map['uid'],
      parent: map['parent'],
      carpooler: map['carpooler'],
      origin: map['origin'],
      destination: map['destination'],
      date: map['date'],
      startTime: map['startTime'],
      endTime: map['endTime'],
      color: map['color'],
      remind: map['remind'],
      repeat: map['repeat'],
    );
  }

  Map<String, dynamic> toMap(){
    return{
      'uid' : uid,
      'parent' : parent,
      'carpooler': carpooler,
      'origin': origin,
      'destination' : destination,
      'date' : date,
      'startTime' : startTime,
      'endTime' : endTime,
      'color' : color,
      'remind' : remind,
      'repeat' : repeat,
    };
  }

}