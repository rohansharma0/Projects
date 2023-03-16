import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:papers/Providers/user_data.dart';
import 'package:papers/global/theme/bloc/theme_bloc.dart';
import 'package:papers/screens/login_screen.dart';
import 'package:papers/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:papers/screens/splash_screen.dart';
import 'package:papers/utilities/styles.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Customizes the status Bar & navigaitonBar

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: PapersColors.primaryColor,
    statusBarIconBrightness: Brightness.light,
  ));

  // Force the app Orientation
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
        title: 'Papers',
        theme: ThemeData(
          primaryColor: PapersColors.primaryColor,
          accentColor: PapersColors.accentColor,
          scaffoldBackgroundColor: PapersColors.background,
          canvasColor: PapersColors.background,
          bottomAppBarColor: PapersColors.background,
          dividerColor: PapersColors.secondary,
          disabledColor: PapersColors.secondary,
          buttonColor: PapersColors.button,
          buttonTheme: ButtonThemeData(
            buttonColor: PapersColors.button,
            disabledColor: PapersColors.secondary,
          ),
          backgroundColor: PapersColors.background,
          bottomAppBarTheme: BottomAppBarTheme(
            color: PapersColors.primaryColor,
          ),
          appBarTheme: AppBarTheme(
            elevation: 0,
            textTheme: TextTheme(
              title: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: PapersColors.paragraph,
              ),
            ),
            color: PapersColors.background,
            actionsIconTheme: IconThemeData(
              color: PapersColors.primaryColor,
            ),
            iconTheme: IconThemeData(
              color: PapersColors.primaryColor,
            ),
          ),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: PapersColors.primaryColor,
            disabledElevation: 0.0,
            elevation: 5,
            focusElevation: 5,
            highlightElevation: 5,
          ),
        ),
        home: SplashScreen(),
        routes: {
          MainScreen.routeName: (ctx) => MainScreen(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
        },
      ),
    );
  }
}
