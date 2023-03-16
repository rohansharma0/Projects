import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/auth.dart';
import './screens/accounts/login_screen.dart';

import './screens/Women/women_home_screen.dart';
import './screens/products_overview_screen.dart';
import './screens/Men/men_home_screen.dart';
import './screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
      ],
      child: MaterialApp(
        title: 'Bewakoof',
        theme: ThemeData(fontFamily: 'Nunito'),
        home: LoginScreen(),
        routes: {
          MenHomeScreen.routeName: (ctx) => MenHomeScreen(),
          WomenHomeScreen.routeName: (ctx) => WomenHomeScreen(),
          ProductsOverviewScreen.routeName: (ctx) => ProductsOverviewScreen(),
        },
      ),
    );
  }
}
