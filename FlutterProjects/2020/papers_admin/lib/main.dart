import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:papers_admin/Providers/user_data.dart';
import 'package:papers_admin/screens/home_screen.dart';
import 'package:papers_admin/screens/login_screen.dart';
import 'package:papers_admin/utilities/styles.dart';
import 'package:provider/provider.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // // Customizes the status Bar & navigaitonBar

  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   statusBarColor: Colors.transparent,
  //   statusBarIconBrightness: Brightness.dark,
  // ));

  // // Force the app Orientation
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

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
    precacheImage(AssetImage('assets/images/background.jpg'), context);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: UserData(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Papers-Admin',
        theme: ThemeData(
          scaffoldBackgroundColor: PapersColors.background,
          canvasColor: Colors.white,
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
            elevation: 0,
            brightness: Brightness.light,
            color: Colors.white,
            actionsIconTheme: IconThemeData(
              color: Colors.black,
            ),
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: _getScreen(),
        routes: {
          HomeScreen.routeName: (ctx) => HomeScreen(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
        },
      ),
    );
  }
}
