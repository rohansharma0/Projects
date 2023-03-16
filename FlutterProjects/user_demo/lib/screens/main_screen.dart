import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_demo/providers/auth.dart';

class MainScreen extends StatelessWidget {
  static const routeName = '/main';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Myapp'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('name'),
            Text('email'),
            RaisedButton(
              onPressed: () {
                Provider.of<Auth>(context, listen: false).logout();
              },
              child: Text('Log out'),
            )
          ],
        ),
      ),
    );
  }
}
