import 'package:flutter/material.dart';
import 'package:instagram/providers/auth.dart';

class MessageScreen extends StatefulWidget {
  static const routeName = 'Message/';
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: RaisedButton(
          onPressed: () async {
            await Auth.logout();
          },
          child: Text('Logout'),
        ),
      ),
    );
  }
}
