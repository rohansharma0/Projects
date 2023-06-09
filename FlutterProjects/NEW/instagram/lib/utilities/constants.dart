import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final _firestore = Firestore.instance;
final storageRef = FirebaseStorage.instance.ref();
final userRef = _firestore.collection('users');
final postRef = _firestore.collection('posts');
final followersRef = _firestore.collection('followers');
final followingsRef = _firestore.collection('followings');
