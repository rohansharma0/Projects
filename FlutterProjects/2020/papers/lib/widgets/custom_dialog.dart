import 'package:flutter/material.dart';
import 'package:papers/utilities/styles.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    Key key,
    @required this.context,
    @required this.content,
    @required this.title,
    @required this.actions,
  }) : super(key: key);
  final String title;
  final String content;
  final List<Widget> actions;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      backgroundColor: PapersColors.primaryColor,
      title: Text(
        title,
        style: TextStyle(
          color: PapersColors.background,
          fontSize: 16,
        ),
      ),
      content: Text(
        content,
        style: TextStyle(
          color: PapersColors.secondary,
          fontSize: 14,
        ),
      ),
      actions: actions,
    );
  }
}
