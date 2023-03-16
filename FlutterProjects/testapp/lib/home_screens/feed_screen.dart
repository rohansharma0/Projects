import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
  static const routeName = 'feed/';
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          'Instagram',
          style: TextStyle(
            fontFamily: 'Billabong',
            color: Colors.black,
            fontSize: 30,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Text('feed'),
      ),
    );
  }
}
