import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function _fun;

  final String _answerText;
  Answer(this._fun,this._answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
        child: Text(_answerText),
        onPressed: _fun,
      ),
    );
  }
}
