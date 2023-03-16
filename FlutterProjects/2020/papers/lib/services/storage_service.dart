import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:papers/utilities/constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class StorageService {
  static Future<String> uploadOrignalPaper(
      File imageFile, String paperId) async {
    String photoId = Uuid().v4();

    StorageUploadTask uploadTask = storageRef
        .child('communityPapers/$paperId/orignal_paper_$photoId.jpg')
        .putFile(imageFile);

    StorageTaskSnapshot snapshot = await uploadTask.onComplete;
    String downloadUrl = await snapshot.ref.getDownloadURL();

    return downloadUrl;
  }

  static Future<String> uploadThumbnailPaper(
      File imageFile, String paperId) async {
    String photoId = Uuid().v4();

    File compressImage = await _compressImage(photoId, imageFile);
    StorageUploadTask uploadTask = storageRef
        .child('communityPapers/$paperId/thumbnail_paper_$photoId.jpg')
        .putFile(compressImage);

    StorageTaskSnapshot snapshot = await uploadTask.onComplete;
    String downloadUrl = await snapshot.ref.getDownloadURL();

    return downloadUrl;
  }

  static Future<File> _compressImage(String photoId, File image) async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;

    File compressImageFile = await FlutterImageCompress.compressAndGetFile(
      image.absolute.path,
      '$path/img_$photoId.jpg',
      quality: 50,
    );
    return compressImageFile;
  }
}
