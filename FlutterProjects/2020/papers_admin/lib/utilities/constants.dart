import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final _firestore = Firestore.instance;
final storageRef = FirebaseStorage.instance.ref();
final userRef = _firestore.collection('users');
final categoriesRef = _firestore.collection('categories');
final papersRef = _firestore.collection('papers');
final communityPapersRef = _firestore.collection('communityPapers');
