import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = [
    {
      'questionText': 'What\'s your favorite fruit?',
      'answers': [
        {'text': 'Apple', 'score': 10},
        {'text': 'Mango', 'score': 8},
        {'text': 'Banana', 'score': 6},
      ],
    },
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Brown', 'score': 10},
        {'text': 'Red', 'score': 8},
        {'text': 'Black', 'score': 6},
      ],
    },
    {
      'questionText': 'What\'s your favorite sport?',
      'answers': [
        {'text': 'Chess', 'score': 10},
        {'text': 'Bandminton', 'score': 8},
        {'text': 'Cricket', 'score': 6},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Deer', 'score': 10},
        {'text': 'Tiger', 'score': 8},
        {'text': 'Lion', 'score': 6},
      ],
    },
  ];
  var _questionIndx = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndx = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;

    setState(() {
      if (_questionIndx < _questions.length)
        _questionIndx = _questionIndx + 1;
      else
        print('Completed!');
    });
    print(_questionIndx);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Abdullah Al Numan'),
        ),
        body: _questionIndx < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndx: _questionIndx,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
