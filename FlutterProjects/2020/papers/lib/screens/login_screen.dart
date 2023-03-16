import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:papers/Providers/user_data.dart';
import 'package:papers/screens/main_screen.dart';
import 'package:papers/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class LoginScreen extends StatefulWidget {
  static const routeName = 'login';
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  AnimationController _backgroundAnimationController;
  AnimationController _textAnimationController;
  Animation _backgroundAnimation, _textAnimation;

  Future<void> _submit() async {
    try {
      FirebaseUser user = await Auth.login();
      Provider.of<UserData>(context, listen: false).currentUserId = user.uid;

      Navigator.of(context).pushReplacementNamed(MainScreen.routeName);
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    _backgroundAnimationController.dispose();
    _textAnimationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _backgroundAnimationController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    _textAnimationController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );
    _backgroundAnimation = Tween<double>(begin: 1.08, end: 1.0).animate(
      CurvedAnimation(
        parent: _backgroundAnimationController,
        curve: Curves.easeIn,
      ),
    );
    _textAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _textAnimationController,
        curve: Curves.easeIn,
      ),
    );
    _backgroundAnimationController.forward();
    _textAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    ImageProvider backgroundImage = AssetImage('assets/images/background.jpg');
    return Material(
      child: Container(
        height: deviceSize.height,
        width: deviceSize.width,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            AnimatedBuilder(
              animation: _backgroundAnimation,
              builder: (BuildContext context, Widget child) {
                return Transform(
                  alignment: FractionalOffset.center,
                  transform: Matrix4.diagonal3(
                    Vector3(
                      _backgroundAnimation.value,
                      _backgroundAnimation.value,
                      _backgroundAnimation.value,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: backgroundImage,
                      ),
                    ),
                  ),
                );
              },
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomRight,
                  colors: [
                    Color.fromRGBO(0, 0, 0, 0),
                    Color.fromRGBO(116, 37, 37, 78)
                  ],
                ),
              ),
            ),
            Positioned(
              top: deviceSize.height * 0.25,
              child: AnimatedBuilder(
                animation: _textAnimation,
                builder: (BuildContext context, Widget child) {
                  return Opacity(
                    opacity: _textAnimation.value,
                    child: Container(
                      width: deviceSize.width,
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Welcome to Papers.',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 21,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Your new favorite wallpaper app.',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              bottom: 30,
              child: AnimatedBuilder(
                animation: _textAnimation,
                builder: (BuildContext context, Widget child) {
                  return Opacity(
                    opacity: _textAnimation.value,
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: _submit,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            width: deviceSize.width * 0.56,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(55, 18, 18, 70),
                                  offset: Offset(0, 7),
                                  blurRadius: 16.0,
                                ),
                              ],
                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 30,
                                  width: 30,
                                  child: Image.asset(
                                      'assets/images/googleLogo.png'),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  'Sign in with Google',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed(MainScreen.routeName);
                          },
                          child: Text(
                            'Skip for now',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
