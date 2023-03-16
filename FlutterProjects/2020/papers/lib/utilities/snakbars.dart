import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:papers/utilities/styles.dart';

class Snackbar {
  static void showFeatureNotPresentSnakbar(BuildContext context) {
    Flushbar(
      backgroundColor: PapersColors.primaryColor,
      message: 'Feature coming soon.',
      isDismissible: true,
      duration: Duration(seconds: 2),
    )..show(context);
  }

  static void paperAdded(BuildContext context) {
    Flushbar(
      backgroundColor: PapersColors.primaryColor,
      message: 'Paper added successful.',
      isDismissible: true,
      duration: Duration(seconds: 2),
    )..show(context);
  }
}
