import 'package:flutter/material.dart';
import 'package:instagram/models/user.dart';
import 'package:instagram/providers/database.dart';

class AddPhoneScreen extends StatefulWidget {
  final User user;
  AddPhoneScreen({Key key, this.user}) : super(key: key);

  @override
  _AddPhoneScreenState createState() => _AddPhoneScreenState();
}

class _AddPhoneScreenState extends State<AddPhoneScreen> {
  String _phone;
  final _formkey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _phone = widget.user.phone;
  }

  Future<void> _submit() async {
    if (!_formkey.currentState.validate() && _isLoading) {
      return;
    }
    _formkey.currentState.save();
    setState(() {
      _isLoading = true;
    });

    User user = User(
      id: widget.user.id,
      name: widget.user.name,
      profileImageUrl: widget.user.profileImageUrl,
      bio: widget.user.bio,
      email: widget.user.email,
      username: widget.user.username,
      gender: widget.user.gender,
      phone: _phone,
    );
    try {
      await Database.updateUser(user);
    } catch (e) {
      print(e);
    }
    setState(() {
      _isLoading = false;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          'Phone number',
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                strokeWidth: 1,
                backgroundColor: Colors.blue[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
              ),
            )
          : Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(30.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Enter your phone number',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      width: 1.0,
                      color: Colors.grey[400],
                    ),
                    color: Colors.grey[100],
                  ),
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,
                          height: double.infinity,
                          child: Text(
                            'IN +91',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Form(
                          key: _formkey,
                          child: TextFormField(
                            initialValue: _phone,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value.length > 10 || value.length < 10) {
                                return 'Please enter a valid phone number';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _phone = value;
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.all(15),
                  child: MaterialButton(
                    elevation: 0,
                    highlightElevation: 0,
                    highlightColor: Colors.blue[300],
                    splashColor: Colors.transparent,
                    height: 40,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    minWidth: double.infinity,
                    color: Colors.blue,
                    onPressed: _submit,
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'You may receive SMS updates from Instagram and can opt out at any time.',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
    );
  }
}
