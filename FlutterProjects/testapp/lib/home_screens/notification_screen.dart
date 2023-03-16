import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  static const routeName = 'notification/';
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('notification'),
      ),
    );
  }
}
