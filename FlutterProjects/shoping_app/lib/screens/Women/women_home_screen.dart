import 'package:flutter/material.dart';

class WomenHomeScreen extends StatelessWidget {
  static const routeName = '/women-section';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Women'),
      ),
      body: Center(
        child: Text('Women'),
      ),
    );
  }
}
