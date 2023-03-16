import 'package:flutter/material.dart';
import 'package:instagram/models/user.dart';
import 'package:instagram/providers/database.dart';

class AddGenderScreen extends StatefulWidget {
  final User user;
  AddGenderScreen({Key key, this.user}) : super(key: key);

  @override
  _AddGenderScreenState createState() => _AddGenderScreenState();
}

class _AddGenderScreenState extends State<AddGenderScreen> {
  String _seletedGender;
  bool _isLoading = false;

  _setSeletedVal(String val) {
    setState(() {
      _seletedGender = val;
    });
  }

  @override
  void initState() {
    super.initState();
    _seletedGender = widget.user.gender;
  }

  Future<void> _submit() async {
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
      gender: _seletedGender,
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
          'Gender',
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
          : Column(
              children: <Widget>[
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Male',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Radio(
                      groupValue: _seletedGender,
                      value: 'Male',
                      onChanged: (value) => _setSeletedVal(value),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Female',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Radio(
                      groupValue: _seletedGender,
                      value: 'Female',
                      onChanged: (value) => _setSeletedVal(value),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Others',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Radio(
                      groupValue: _seletedGender,
                      value: 'Others',
                      onChanged: (value) => _setSeletedVal(value),
                    )
                  ],
                ),
              ],
            ),
    );
  }
}
