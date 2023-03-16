import 'package:donationapp/screens/login_screen.dart';
import 'package:donationapp/screens/signup_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aashaye',
      home: LoginScreen(),
      theme: ThemeData(fontFamily: 'Montserrat'),
      routes: {
        LoginScreen.routeName: (ctx) => LoginScreen(),
        // SignupScreen.routeName: (ctx) => Si\gnupScreen(),
      },
    );
  }
}
