import 'package:flutter/material.dart';

class StoryScreen extends StatefulWidget {
  static const routeName = 'Story/';
  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('Story'),
      ),
    );
  }
}
