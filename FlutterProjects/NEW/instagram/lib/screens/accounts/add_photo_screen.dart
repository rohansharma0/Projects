import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class AddPhotoScreen extends StatefulWidget {
  static const routeName = 'addphoto/';
  AddPhotoScreen({Key key}) : super(key: key);

  @override
  _AddPhotoScreenState createState() => _AddPhotoScreenState();
}

class _AddPhotoScreenState extends State<AddPhotoScreen> {
  bool _isLoading = false;

  Future<void> _submit() async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      File croppedImage = await ImageCropper.cropImage(
        sourcePath: image.path,
        cropStyle: CropStyle.circle,
        aspectRatioPresets: [CropAspectRatioPreset.square],
      );

      setState(() {
        _isLoading = true;
      });
      try {
        // final FirebaseUser user = await FirebaseAuth.instance.currentUser();

        // final profileImageUrl = await Provider.of<Auth>(context)
        //     .uploadUserProfileImage(croppedImage);
        // userRef.document(user.uid).updateData({
        //   'profileImageUrl': profileImageUrl,
        // });
        // Navigator.of(context).pushReplacementNamed(MainScreen.routeName);
      } catch (e) {
        print(e);
      }
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: null,
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        width: deviceSize.width,
        height: deviceSize.height,
        child: Column(
          children: <Widget>[
            (_isLoading)
                ? LinearProgressIndicator(
                    backgroundColor: Colors.blue[200],
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                  )
                : SizedBox.shrink(),
            Container(
              padding: EdgeInsets.all(30),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.camera_alt,
                      size: 60,
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Add profile photo',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Add a profile photo so that your friends\nknow it\'s you',
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
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
                        child: Text('Add a photo'),
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        // Navigator.of(context)
                        //     .pushReplacementNamed(MainScreen.routeName);
                      },
                      child: Text(
                        'Skip',
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
            ),
          ],
        ),
      ),
    );
  }
}
