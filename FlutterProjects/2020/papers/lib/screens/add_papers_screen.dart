import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:papers/models/paper.dart';
import 'package:papers/services/database.dart';
import 'package:papers/utilities/constants.dart';
import 'package:papers/utilities/snakbars.dart';
import 'package:papers/utilities/styles.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class AddPapaersScreen extends StatefulWidget {
  final String currentUserId;
  AddPapaersScreen({Key key, @required this.currentUserId}) : super(key: key);

  @override
  _AddPapaersScreenState createState() => _AddPapaersScreenState();
}

class _AddPapaersScreenState extends State<AddPapaersScreen>
    with SingleTickerProviderStateMixin {
  File _imageFile;
  bool _isLoading = false;
  double uploadPercentage = 0.0;

  _selectImageFile() async {
    File imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      setState(() {
        _imageFile = imageFile;
      });
    }
  }

  _submit() async {
    if (!_isLoading && _imageFile != null) {
      setState(() {
        _isLoading = true;
        uploadPercentage = 0.0;
      });

      final paperId = Uuid().v1();

      String photoId = Uuid().v4();

      // create Paper
      final length = _imageFile.lengthSync();

      // commpress image

      final tempDir = await getTemporaryDirectory();
      final path = tempDir.path;

      File compressImageFile = await FlutterImageCompress.compressAndGetFile(
        _imageFile.absolute.path,
        '$path/img_$photoId.jpg',
        quality: 50,
      );
      final thumLength = compressImageFile.lengthSync();

      final total = length + thumLength;

      // original - paper

      StorageUploadTask uploadTask = storageRef
          .child('communityPapers/$paperId/orignal_paper_$photoId.jpg')
          .putFile(_imageFile);
      uploadTask.events.listen((event) {
        setState(() {
          uploadPercentage =
              (event.snapshot.bytesTransferred / total).toDouble();
        });
      });

      StorageTaskSnapshot snapshot = await uploadTask.onComplete;
      String orignalImage = await snapshot.ref.getDownloadURL();

      // thumbnail

      StorageUploadTask thumbuploadTask = storageRef
          .child('communityPapers/$paperId/thumbnail_paper_$photoId.jpg')
          .putFile(compressImageFile);

      thumbuploadTask.events.listen((event) {
        setState(() {
          uploadPercentage = uploadPercentage +
              ((event.snapshot.bytesTransferred / total).toDouble());
        });
      });

      StorageTaskSnapshot thumbsnapshot = await thumbuploadTask.onComplete;
      String thumbImage = await thumbsnapshot.ref.getDownloadURL();

      // upload paper

      var img = await decodeImageFromList(_imageFile.readAsBytesSync());

      Paper paper = Paper(
        id: paperId,
        imageUrl: orignalImage,
        thumbnailImageUrl: thumbImage,
        authorId: widget.currentUserId,
        category: 'User',
        timestamp: Timestamp.fromDate(DateTime.now()),
        imageSize: length,
        imageResolution: [img.width, img.height],
      );
      setState(() {
        _isLoading = false;
      });
      Database.createCommunityPaper(paper);
      Navigator.of(context).pop();
      Snackbar.paperAdded(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Container(
          padding: EdgeInsets.only(top: 10),
          child: AppBar(
            title: Text('UPLOAD'),
            centerTitle: true,
          ),
        ),
      ),
      body: (_isLoading)
          ? Center(
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    color: PapersColors.primaryColor,
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      value: uploadPercentage,
                    ),
                    SizedBox(height: 20),
                    Text(
                      (uploadPercentage <= 1.0)
                          ? uploadPercentage.toStringAsFixed(2)
                          : 'Complete',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            )
          : Container(
              height: deviceSize.height,
              width: deviceSize.width,
              padding: EdgeInsets.all(20),
              child: ListView(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    height: deviceSize.height * 0.4,
                    child: (_imageFile != null)
                        ? Image.file(_imageFile)
                        : Container(
                            decoration: BoxDecoration(
                              color: PapersColors.secondary2,
                              border: Border.all(
                                width: 0.5,
                                color: PapersColors.primaryColor,
                              ),
                            ),
                            child: Center(
                              child: GestureDetector(
                                onTap: _selectImageFile,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      PapersIcons.image,
                                      size: 35,
                                      color: PapersColors.primaryColor,
                                    ),
                                    Text(
                                      'Choose File',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: PapersColors.primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                  ),
                  SizedBox(height: 40),
                  Center(
                    child: GestureDetector(
                      onTap: _submit,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.cloud_upload,
                              color: Colors.white,
                            ),
                            Text(
                              'Upload',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
