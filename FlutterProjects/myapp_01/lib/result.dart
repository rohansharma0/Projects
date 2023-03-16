import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function reset;
  final int resultScore;

  Result(this.resultScore,this.reset);

  String get resultText {
    var resultStr = 'You did it !!';
    if (resultScore <= 8) {
      resultStr = 'You are awesome and innocent !!';
    } else if (resultScore <= 12) {
      resultStr = 'You are strange !!';
    } else {
      resultStr = 'You are bad';
    }

    return resultStr;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          resultText,
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          "Your Score : $resultScore",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        FlatButton(
          child: Text("Restart Quiz"),
          textColor: Colors.blue,
          onPressed: reset,
        )
      ],
    );
  }
}
