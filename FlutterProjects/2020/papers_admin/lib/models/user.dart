import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String name;
  final String profileImageUrl;
  final String email;
  bool isSuperUser = false;

  User({
    this.id,
    this.name,
    this.profileImageUrl,
    this.email,
    this.isSuperUser,
  });

  factory User.fromDoc(DocumentSnapshot doc) {
    return User(
      id: doc.documentID,
      name: doc['name'],
      profileImageUrl: doc['profileImageUrl'],
      email: doc['email'],
      isSuperUser: doc['isSuperUser'],
    );
  }
}
