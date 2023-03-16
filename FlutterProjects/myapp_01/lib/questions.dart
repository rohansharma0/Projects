import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String _questionText;

  Question(this._questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      width: double.infinity,
      child: Text(
        _questionText,
        style: TextStyle(
          fontSize: 28,
          color: Colors.redAccent,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
