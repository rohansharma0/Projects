import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_demo/screens/login_screen.dart';
import 'package:user_demo/screens/main_screen.dart';

import './providers/auth.dart';

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
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'Login-Demo',
          theme: ThemeData(fontFamily: 'Nunito'),
          home: auth.isAuth ? MainScreen() : LoginScreen(),
          routes: {
            MainScreen.routeName: (ctx) => MainScreen(),
          },
        ),
      ),
    );
  }
}
