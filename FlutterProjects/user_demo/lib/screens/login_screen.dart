import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:user_demo/screens/main_screen.dart';
import '../providers/auth.dart';

enum AuthMode { Signup, Login }

class LoginScreen extends StatelessWidget {
  static const routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light),
    );
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromRGBO(53, 46, 62, 1),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          height: deviceSize.height,
          width: deviceSize.width,
          child: AuthCard(),
        ),
      ),
    );
  }
}

class AuthCard extends StatefulWidget {
  const AuthCard({
    Key key,
  }) : super(key: key);

  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  var _isLoading = false;
  final _passwordController = TextEditingController();

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    if (_authMode == AuthMode.Login) {
      // Log user in
      await Provider.of<Auth>(context, listen: false).login(
        _authData['email'],
        _authData['password'],
      );
      // Sign user up
      await Provider.of<Auth>(context, listen: false).signup(
        _authData['email'],
        _authData['password'],
      );
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text(
              _authMode == AuthMode.Login ? 'Log In' : 'Sign up',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter email address',
                        hintStyle: TextStyle(
                          color: Colors.white30,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        disabledBorder: InputBorder.none,
                        filled: true,
                        fillColor: Color.fromRGBO(70, 64, 78, 1),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4)),
                      ),
                      autofocus: false,
                      cursorColor: Colors.white54,
                      cursorRadius: Radius.circular(5),
                      cursorWidth: 1,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value.isEmpty || !value.contains('@')) {
                          return 'Invalid email!';
                        }
                      },
                      onSaved: (value) {
                        _authData['email'] = value;
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        hintStyle: TextStyle(
                          color: Colors.white30,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        disabledBorder: InputBorder.none,
                        filled: true,
                        fillColor: Color.fromRGBO(70, 64, 78, 1),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4)),
                      ),
                      autofocus: false,
                      cursorColor: Colors.white54,
                      cursorRadius: Radius.circular(5),
                      cursorWidth: 1,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      controller: _passwordController,
                      validator: (value) {
                        if (value.isEmpty || value.length < 5) {
                          return 'Password is too short!';
                        }
                      },
                      onSaved: (value) {
                        _authData['password'] = value;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    if (_authMode == AuthMode.Signup)
                      Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Confirm password',
                              hintStyle: TextStyle(
                                color: Colors.white30,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              disabledBorder: InputBorder.none,
                              filled: true,
                              fillColor: Color.fromRGBO(70, 64, 78, 1),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                            autofocus: false,
                            cursorColor: Colors.white54,
                            cursorRadius: Radius.circular(5),
                            cursorWidth: 1,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            validator: _authMode == AuthMode.Signup
                                ? (value) {
                                    if (value != _passwordController.text) {
                                      return 'Passwords do not match!';
                                    }
                                  }
                                : null,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    SizedBox(
                      height: 20,
                    ),
                    if (_isLoading)
                      CircularProgressIndicator()
                    else
                      ButtonTheme(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        minWidth: double.infinity,
                        height: 50,
                        buttonColor: Color.fromRGBO(142, 128, 244, 1),
                        child: RaisedButton(
                          textColor: Colors.white,
                          onPressed: _submit,
                          child: Text(_authMode == AuthMode.Login
                              ? 'Log In'
                              : 'Sign up'),
                        ),
                      ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            _authMode == AuthMode.Login
                                ? 'Don\'t have an account?'
                                : 'Have an account?',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: _switchAuthMode,
                            child: Text(
                              _authMode == AuthMode.Login
                                  ? 'Sign up'
                                  : 'Log In',
                              style: TextStyle(
                                color: Color.fromRGBO(142, 128, 244, 1),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
