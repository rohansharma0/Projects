import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = 'search/';
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('search'),
      ),
    );
  }
}
