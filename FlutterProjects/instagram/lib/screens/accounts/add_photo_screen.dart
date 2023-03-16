import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/models/user.dart';
import 'package:instagram/providers/database.dart';
import 'package:instagram/providers/storage__service.dart';
import 'package:instagram/providers/user_data.dart';
import 'package:instagram/utilities/constants.dart';
import 'package:provider/provider.dart';

class AddPhotoScreen extends StatefulWidget {
  static const routeName = 'addphoto/';

  @override
  _AddPhotoScreenState createState() => _AddPhotoScreenState();
}

class _AddPhotoScreenState extends State<AddPhotoScreen> {
  bool _isLoading = false;

  Future<void> _submit(User userData) async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      File croppedImage = await ImageCropper.cropImage(
        sourcePath: image.path,
        cropStyle: CropStyle.circle,
        aspectRatioPresets: [CropAspectRatioPreset.square],
      );
      if (croppedImage != null) {
        setState(() {
          _isLoading = true;
        });
        String _profileImageUrl = await StorageService.uploadUserProfileImage(
            userData.profileImageUrl, croppedImage);
        User user = User(
          id: userData.id,
          bio: userData.bio,
          email: userData.email,
          name: userData.name,
          profileImageUrl: _profileImageUrl,
          username: userData.username,
        );
        try {
          await Database.updateUser(user);
          Navigator.of(context).pop();
        } catch (e) {
          print(e);
        }
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final userId = Provider.of<UserData>(context).currentUserId;
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: null,
      backgroundColor: Colors.white,
      body: FutureBuilder(
          future: userRef.document(userId).get(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  strokeWidth: 1,
                ),
              );
            }
            User user = User.fromDoc(snapshot.data);
            return Container(
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
                              onPressed: () => _submit(user),
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
                              Navigator.of(context).pop();
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
            );
          }),
    );
  }
}
