import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipe_app/screens/tab_screen.dart';

void main() {
  return runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle(
    //     statusBarColor: Colors.white,
    //     statusBarIconBrightness: Brightness.dark,
    //     statusBarBrightness: Brightness.dark,
    //     systemNavigationBarColor: Colors.white,
    //     systemNavigationBarDividerColor: Colors.black,
    //     systemNavigationBarIconBrightness: Brightness.dark,
    //   ),
    // );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe App',
      theme: ThemeData(
        fontFamily: 'Nunito',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TabScreen(),
      },
    );
  }
}
