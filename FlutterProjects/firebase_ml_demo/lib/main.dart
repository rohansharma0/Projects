import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FacePage(),
    );
  }
}

class FacePage extends StatefulWidget {
  @override
  _FacePageState createState() => _FacePageState();
}

class _FacePageState extends State<FacePage> {
  File _imageFile;
  List<Face> _faces;
  Future<void> _getImage() async {
    final imageFile = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    final image = FirebaseVisionImage.fromFile(imageFile);
    final faceDetector = FirebaseVision.instance.faceDetector(
      FaceDetectorOptions(
        mode: FaceDetectorMode.accurate,
      ),
    );
    final faces = await faceDetector.processImage(image);
    if (mounted) {
      setState(() {
        _imageFile = imageFile;
        _faces = faces;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FaceApp'),
      ),
      body: ImagesAndFaces(
        imageFile: _imageFile,
        faces: _faces,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: _getImage,
        tooltip: 'take an image',
        child: Icon(Icons.camera),
      ),
    );
  }
}

class ImagesAndFaces extends StatelessWidget {
  final File imageFile;
  final List<Face> faces;

  ImagesAndFaces({this.imageFile, this.faces});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: imageFile != null
            ? Column(
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    child: Container(
                      constraints: BoxConstraints.expand(),
                      child: Image.file(
                        imageFile,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Flexible(
                      flex: 1,
                      child: ListView(
                        children: faces
                            .map<Widget>((f) => FaceCoordinates(f))
                            .toList(),
                      )),
                ],
              )
            : Container(
                child: Center(
                child: Text('Select an image'),
              )));
  }
}

class FaceCoordinates extends StatelessWidget {
  FaceCoordinates(this.face);
  final Face face;
  @override
  Widget build(BuildContext context) {
    final pos = face.boundingBox;
    return Card(
      child: ListTile(
        title: Text('(${pos.top},${pos.left}),(${pos.bottom},${pos.right})'),
      ),
    );
  }
}
