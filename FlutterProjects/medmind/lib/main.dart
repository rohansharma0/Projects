import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medmind/screens/detail_screen.dart';
import 'package:medmind/screens/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    return MaterialApp(
      title: 'MedMind',
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
        DetailScreen.routeName: (ctx) => DetailScreen(),
      },
    );
  }
}
