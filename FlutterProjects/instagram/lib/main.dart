import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram/providers/user_data.dart';
import 'package:instagram/screens/accounts/add_photo_screen.dart';
import 'package:instagram/screens/accounts/forget_screen.dart';
import 'package:instagram/screens/accounts/login_screen.dart';
import 'package:instagram/screens/accounts/signup_screen.dart';
import 'package:instagram/screens/home_screens/create_post_screen.dart';
import 'package:instagram/screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget _getScreen() {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          Provider.of<UserData>(context).currentUserId = snapshot.data.uid;
          return HomeScreen();
        } else {
          return LoginScreen();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.black));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: UserData(),
        ),
      ],
      child: MaterialApp(
        title: 'Instagram',
        theme: ThemeData(
          textTheme: GoogleFonts.robotoTextTheme(
            Theme.of(context).textTheme,
          ),
          primaryIconTheme:
              Theme.of(context).primaryIconTheme.copyWith(color: Colors.black),
        ),
        home: _getScreen(),
        debugShowCheckedModeBanner: false,
        routes: {
          LoginScreen.routeName: (ctx) => LoginScreen(),
          ForgetScreen.routeName: (ctx) => ForgetScreen(),
          SignupScreen.routeName: (ctx) => SignupScreen(),
          AddPhotoScreen.routeName: (ctx) => AddPhotoScreen(),
          CreatePostScreen.routeName: (ctx) => CreatePostScreen(),
          HomeScreen.routeName: (ctx) => HomeScreen(),
        },
      ),
    );
  }
}
