import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class ErrorHandling {
  static showSnackbar(BuildContext context, String massage) {
    Flushbar(
      message: massage,
      duration: Duration(seconds: 3),
      margin: EdgeInsets.all(8),
      borderRadius: 8,
      dismissDirection: FlushbarDismissDirection.VERTICAL,
      isDismissible: true,
    )..show(context);
  }
}
