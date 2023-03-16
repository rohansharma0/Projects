import 'package:flutter/material.dart';
import 'package:instagram/models/user.dart';
import 'package:instagram/providers/database.dart';

class AddEmailScreen extends StatefulWidget {
  final User user;
  AddEmailScreen({Key key, this.user}) : super(key: key);

  @override
  _AddEmailScreenState createState() => _AddEmailScreenState();
}

class _AddEmailScreenState extends State<AddEmailScreen> {
  String _email;
  final _formkey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _email = widget.user.email;
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
      email: _email,
      username: widget.user.username,
      gender: widget.user.gender,
      phone: widget.user.phone,
    );
    try {
      await Database.updateUser(user);
    } catch (e) {
      print(e);
    }
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          'Change Email',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.close,
            size: 30,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: _submit,
            icon: Icon(
              Icons.done,
              size: 30,
            ),
            color: Colors.blue,
          ),
        ],
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
          : Form(
              key: _formkey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    initialValue: _email,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.mail,
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value.isEmpty || !value.contains('@gmail.com')) {
                        return 'Please enter a valid email address.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value;
                    },
                  )
                ],
              ),
            ),
    );
  }
}
