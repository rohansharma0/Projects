import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  static const routeName = 'user-profile/';

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('user'),
      ),
    );
  }
}
