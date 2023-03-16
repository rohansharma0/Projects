import 'package:app/screens/home/location_detail.dart';
import "package:flutter/material.dart";

import "./screens/locations/locations.dart";
import 'style.dart';

const LocationsRoute = '/';
const LocationDetailRoute = '/location_detail';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Locations(),
      onGenerateRoute: _routes(),
      theme: _theme(),
    );
  }

  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case LocationsRoute:
          screen = Locations();
          break;
        case LocationDetailRoute:
          screen = LocationDetail(arguments["id"]);
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }

  ThemeData _theme() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        color: Colors.black,
        
      ),
      textTheme: TextTheme(
        title: TitleTextStyle,
        body1: Body1TextStyle,
      ),
    );
  }
}
