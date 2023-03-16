// import 'package:bewakoof/models/http_exception.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../providers/auth.dart';
// import '../screens/home_screen.dart';
import '../screens/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Aashaye',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Yor\'re just one step away from signing up',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 25),
              Container(
                height: 40,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        // Provider.of<Auth>(context).fbLoginIn();
                      },
                      child: Container(
                        height: double.infinity,
                        width: (deviceSize.width / 2) - 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            // Icon(CustomIcons.facebook),
                            Text(
                              'FACEBOOK',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Provider.of<Auth>(context).googleSignIn();
                      },
                      child: Container(
                        height: double.infinity,
                        width: (deviceSize.width / 2) - 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            // Icon(CustomIcons.google),
                            Text(
                              'GOOGLE',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('or'),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: LoginForm(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key key,
  }) : super(key: key);
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  var _isLoading = false;

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred!'),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text('Okey'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }

  Future<void> _submit() async {
    // if (!_formKey.currentState.validate()) {
    //   //invalid
    //   return;
    // }
    // _formKey.currentState.save();
    // setState(() {
    //   _isLoading = true;
    // });
    // //login----
    // //error Should be handle...........
    // try {
    //   await Provider.of<Auth>(context, listen: false).login(
    //     _authData['email'],
    //     _authData['password'],
    //   );
    // } on HttpException catch (error) {
    //   var errorMessage = 'Authentication failed';
    //   if (error.toString().contains('INVALID_EMAIL')) {
    //     errorMessage = 'This is not a valid email address.';
    //   } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
    //     errorMessage =
    //         'There is no user record corresponding to this identifier. The user may have been deleted.';
    //   } else if (error.toString().contains('INVALID_PASSWORD')) {
    //     errorMessage =
    //         'The password is invalid or the user does not have a password.';
    //   }
    //   _showErrorDialog(errorMessage);
    // } catch (error) {
    //   var errorMessage = 'Could not authenticate you. Please try again later';
    //   _showErrorDialog(errorMessage);
    // }
    // Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    // setState(() {
    //   _isLoading = false;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter email address',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  cursorColor: Color.fromRGBO(0, 150, 136, 1),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value.isEmpty || !value.contains('@')) {
                      return 'Invalid email!';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _authData['email'] = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty || value.length < 5) {
                      return 'Password is too short!';
                    }
                  },
                  onSaved: (value) {
                    _authData['password'] = value;
                  },
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                          color: Color.fromRGBO(0, 150, 136, 1),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                if (_isLoading)
                  CircularProgressIndicator()
                else
                  Container(
                    height: 50,
                    width: double.infinity,
                    child: RaisedButton(
                      elevation: 0,
                      highlightElevation: 0,
                      color: Color.fromRGBO(0, 150, 136, 1),
                      onPressed: _submit,
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      colorBrightness: Brightness.dark,
                    ),
                  ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'New to Bewakoof ?',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        // Navigator.of(context).pushNamed(SignupScreen.routeName);
                      },
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(
                          color: Color.fromRGBO(0, 150, 136, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
