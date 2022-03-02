import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';


class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}
//test12435
class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCalendar(),
    );
  }
}
