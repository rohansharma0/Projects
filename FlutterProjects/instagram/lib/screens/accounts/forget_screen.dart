import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram/models/error_handling.dart';
import 'package:instagram/providers/auth.dart';

class ForgetScreen extends StatefulWidget {
  static const routeName = 'forget/';

  @override
  _ForgetScreenState createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email;
  bool _isLoading = false;

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    setState(() {
      _isLoading = true;
    });
    _formKey.currentState.save();

    try {
      await Auth.forgotPassword(_email);
    } on PlatformException catch (error) {
      if (error.code == 'ERROR_USER_NOT_FOUND') {
        ErrorHandling.showSnackbar(context, 'User does not exits.');
      } else if (error.code == 'ERROR_USER_DISABLED') {
        ErrorHandling.showSnackbar(context, 'User is disabled.');
      } else if (error.code == 'ERROR_INVALID_EMAIL') {
        ErrorHandling.showSnackbar(
            context, 'Invalid email. Please enter a valid email address.');
      } else {
        ErrorHandling.showSnackbar(context, 'Something went wrong!');
      }
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          'Login help',
          style: TextStyle(color: Colors.black),
        ),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          padding: EdgeInsets.all(30),
          width: deviceSize.width,
          height: deviceSize.height,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                  'Find your account',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Enter your instagram username or the email\naddress or phone number linked to your account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Email address or username',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1,
                                style: BorderStyle.solid,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 15,
                            ),
                            filled: true,
                            fillColor: Colors.grey[50],
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1,
                                style: BorderStyle.solid,
                              ),
                            ),
                          ),
                          cursorColor: Colors.black,
                          validator: (value) {
                            if (value.isEmpty ||
                                !value.contains('@gmail.com')) {
                              return 'Please enter a valid email address.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _email = value;
                          },
                        ),
                        SizedBox(height: 15),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: MaterialButton(
                            onPressed: _submit,
                            elevation: 0,
                            height: 45,
                            splashColor: Colors.transparent,
                            highlightElevation: 0,
                            highlightColor: Colors.blue[300],
                            disabledColor: Colors.blue[100],
                            disabledTextColor: Colors.white,
                            textColor: Colors.white,
                            minWidth: double.infinity,
                            color: Colors.blue[400],
                            child: (_isLoading)
                                ? CircularProgressIndicator(
                                    backgroundColor: Colors.white,
                                    strokeWidth: 1,
                                  )
                                : Text('Reset password'),
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Divider(
                                color: Colors.grey,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "OR",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Back to login',
                            style: TextStyle(
                              color: Colors.blue[400],
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
