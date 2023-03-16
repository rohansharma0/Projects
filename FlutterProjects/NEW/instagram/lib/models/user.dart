import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class User {
  final String id;
  final String name;
  final String profileImageUrl;
  final String username;
  final String email;
  final String bio;

  User({
    @required this.id,
    @required this.name,
    @required this.profileImageUrl,
    @required this.username,
    @required this.email,
    @required this.bio,
  });

  factory User.fromDoc(DocumentSnapshot doc) {
    return User(
      id: doc.documentID,
      name: doc['name'],
      profileImageUrl: doc['profileImageUrl'],
      username: doc['username'],
      email: doc['email'],
      bio: doc['bio'] ?? '',
    );
  }
}
