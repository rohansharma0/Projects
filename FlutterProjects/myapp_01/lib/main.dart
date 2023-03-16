import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _index = 0;
  var _totalScore = 0;
  final _questions = [
    {
      'question': 'What is your Favorite Color ?',
      'answers': [
        {'text': 'Blue', 'score': 10},
        {'text': 'Black', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'Yellow', 'score': 1},
      ]
    },
    {
      'question': 'What is your Favorite Animal ?',
      'answers': [
        {'text': 'Dogs', 'score': 3},
        {'text': 'Snake', 'score': 15},
        {'text': 'Lion', 'score': 5},
        {'text': 'Tiger', 'score': 9},
      ]

    },
  ];

  void _resetQuiz(){
    setState(() {
      _totalScore=0;
      _index=0;
    });
  }

  void _func(int score) {

    _totalScore += score;

    setState(() {
      _index += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("My First App"),
          ),
          body: _index < _questions.length
              ? Quiz(func: _func, questions: _questions, index: _index)
              : Result(_totalScore,_resetQuiz)),
    );
  }
}
