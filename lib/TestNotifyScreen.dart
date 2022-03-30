import 'package:flutter/material.dart';
import 'LocalNotifyManager.dart';
import 'ScreenSecond.dart';

class TestNotifyScreen extends StatefulWidget {
  @override
  State<TestNotifyScreen> createState() => _TestNotifyScreenState();
}

class _TestNotifyScreenState extends State<TestNotifyScreen> {

  @override
  void initState() {
    super.initState();
    localNotifyManager.setOnNotificationReceive(onNotificationReceive);
    localNotifyManager.setOnNotificationClick(onNotificationClick);

  }

  onNotificationReceive(ReceiveNotification notification) {
    print('Notification Received: ${notification.id}');
  }

  onNotificationClick(String payload) {
    print('Payload $payload');
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ScreenSecond(payload: payload);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local Notifications'),
      ),
      body: Center(
        child: FlatButton(
          onPressed: () async {
            //await localNotifyManager.showNotification();
            //await localNotifyManager.scheduleNotification();
            //await localNotifyManager.repeatNotification();
            await localNotifyManager.showDailyAtTimeNotification();
          },
          child: Text('Send Notification'),
        ),
      ),
    );
  }
}
