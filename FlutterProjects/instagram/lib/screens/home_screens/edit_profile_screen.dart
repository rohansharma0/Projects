import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/models/user.dart';
import 'package:instagram/providers/database.dart';
import 'package:instagram/providers/storage__service.dart';
import 'package:instagram/screens/accounts/add_email_screen.dart';
import 'package:instagram/screens/accounts/add_gender_screen.dart';
import 'package:instagram/screens/accounts/add_phone_screen.dart';

class EditProfileScreen extends StatefulWidget {
  final User user;

  EditProfileScreen({this.user});
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formkey = GlobalKey<FormState>();
  String _name;
  String _bio;
  String _phone;
  String _gender;

  String _username;
  String _email;
  File _profileImage;
  bool _isLoading = false;

  Future<void> _handleImageFormGallery() async {
    File imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      setState(() {
        _profileImage = imageFile;
      });
    }
  }

  _displayProfileImage() {
    //no new profile image
    if (_profileImage == null) {
      // no exiting profile image
      if (widget.user.profileImageUrl.isEmpty) {
        return AssetImage('assets/images/user_placeholder.jpg');
      } else {
        return CachedNetworkImageProvider(widget.user.profileImageUrl);
      }
    } else {
      //new profile image
      return FileImage(_profileImage);
    }
  }

  Future<void> _submit() async {
    if (!_formkey.currentState.validate() && _isLoading) {
      return;
    }
    _formkey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    String _profileImageUrl = '';
    if (_profileImage == null) {
      _profileImageUrl = widget.user.profileImageUrl;
    } else {
      _profileImageUrl = await StorageService.uploadUserProfileImage(
        widget.user.profileImageUrl,
        _profileImage,
      );
    }
    User user = User(
      id: widget.user.id,
      name: _name,
      profileImageUrl: _profileImageUrl,
      bio: _bio,
      email: widget.user.email,
      username: _username,
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
  void initState() {
    _name = widget.user.name;
    _bio = widget.user.bio;
    _username = widget.user.username;
    _email = widget.user.email;
    _gender = widget.user.gender;
    _phone = widget.user.phone;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          'Edit Profile',
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
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ListView(
          children: <Widget>[
            _isLoading
                ? LinearProgressIndicator(
                    backgroundColor: Colors.blue[200],
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                  )
                : SizedBox.shrink(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 50,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 0.5,
                            color: Colors.grey[300],
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      backgroundColor: Colors.grey,
                      backgroundImage: _displayProfileImage(),
                    ),
                    FlatButton(
                      onPressed: _handleImageFormGallery,
                      child: Text(
                        'Change Profile Image',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    TextFormField(
                      initialValue: _name,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 16,
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) => value.trim().length < 1
                          ? ' Please enter a valid name'
                          : null,
                      onSaved: (value) => _name = value,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      initialValue: _username,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 16,
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) => value.trim().length < 1
                          ? ' Please enter a valid username'
                          : null,
                      onSaved: (value) => _username = value,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      initialValue: _bio,
                      decoration: InputDecoration(
                        labelText: 'Bio',
                        labelStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 16,
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) => value.trim().length > 150
                          ? ' Please enter a bio less than 150 characters'
                          : null,
                      onSaved: (value) => _bio = value,
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Profile Information',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AddEmailScreen(
                            user: widget.user,
                          ),
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'E-mail Address',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(_email),
                            Divider(),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AddPhoneScreen(
                            user: widget.user,
                          ),
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Phone number',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(_phone),
                            Divider(),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AddGenderScreen(
                            user: widget.user,
                          ),
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Gender',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(_gender),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
