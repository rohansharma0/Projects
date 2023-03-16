import 'package:flutter/material.dart';

import 'questions.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final Function func;
  final int index;
  final List<Map<String, Object>> questions;

  Quiz({@required this.func, @required this.questions, @required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: <Widget>[
            Question(
              questions[index]['question'],
            ),
            ...(questions[index]['answers'] as List<Map<String, Object>>)
                .map((_answerText) {
              return Answer(() => func(_answerText['score']), _answerText['text']);
            }).toList()
          ],
        ),
      ],
    );
  }
}
