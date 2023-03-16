import 'package:flutter/cupertino.dart';

class UserData extends ChangeNotifier {
  String currentUserId;

  bool isLoggedIn() {
    if (currentUserId != null) {
      return true;
    } else {
      return false;
    }
  }
}
