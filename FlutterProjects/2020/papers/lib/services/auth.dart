import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  static final _auth = FirebaseAuth.instance;
  static final _firestore = Firestore.instance;

  String currentUserId;

  //google signin

  static GoogleSignIn _googleSignIn = GoogleSignIn();

  static Future<FirebaseUser> login() async {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: gSA.accessToken,
      idToken: gSA.idToken,
    );
    FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
    if (user != null) {
      _firestore.collection('/users').document(user.uid).setData({
        'name': user.displayName,
        'profileImageUrl': user.photoUrl,
        'email': user.email,
        'isSuperUser': false,
      });
    }
    return user;
  }

  //logout

  static Future<void> logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e);
    }
  }

  // auth  changes user stream
  Stream<FirebaseUser> get user {
    return _auth.onAuthStateChanged;
  }
}
