import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/answer.dart';
import './question.dart';

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  void _answerQuestion() {
    setState(() {
      if (_questionIndex < 2) _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': ['Green', 'Red', 'Blue']
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': ['Rabbit', 'Cat', 'Elephant', 'Lion']
      },
      {
        'questionText': 'What\'s your favorite place?',
        'answers': ['Perambalur', 'Coimbatore', 'Chennai']
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My First App'),
        ),
        // ignore: prefer_const_literals_to_create_immutables
        body: Column(
          children: [
            Question(_questions[_questionIndex]['questionText'].toString()),
            ...(_questions[_questionIndex]['answers'] as List<String>)
                .map((value) {
              return Answer(_answerQuestion, value);
            })
          ],
        ),
      ),
    );
  }
}
