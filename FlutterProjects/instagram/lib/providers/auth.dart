import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/providers/user_data.dart';
import 'package:provider/provider.dart';

class Auth {
  static final _auth = FirebaseAuth.instance;
  static final _firestore = Firestore.instance;

  static Future<void> login(
      BuildContext context, String email, String password) async {
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  static Future<void> signup(BuildContext context, String name, String username,
      String email, String password) async {
    AuthResult authResult = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    FirebaseUser signedInUser = authResult.user;
    if (signedInUser != null) {
      _firestore.collection('/users').document(signedInUser.uid).setData({
        'name': name,
        'email': email,
        'username': username,
        'profileImageUrl': '',
      });
      Provider.of<UserData>(context).currentUserId = signedInUser.uid;
    }
  }

  static Future<void> logout() async {
    await _auth.signOut();
  }

  static Future<void> forgotPassword(String email) async {
    await _auth.sendPasswordResetEmail(
      email: email,
    );
  }
}
