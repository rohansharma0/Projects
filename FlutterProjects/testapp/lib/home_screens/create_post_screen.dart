import 'package:flutter/material.dart';

class CreatePostScreen extends StatefulWidget {
  static const routeName = 'create-post/';
  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('create post'),
      ),
    );
  }
}
