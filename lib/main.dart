import 'package:flutter/material.dart';
import 'package:flutter_first_app/question.dart';

void main(List<String> args) {
  print('WEEEE');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;

  void _onPressAnswer() {
    if (_questionIndex < questions.length - 1) {
      setState(() {
        _questionIndex++;
      });
      print('here is the next question');
    } else {
      print('No question left');
    }
  }

  List questions = [
    'First Question?',
    'Second Question',
    'Third Question',
  ];

  @override
  Widget build(BuildContext context) {
    print('Question index is $_questionIndex');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: <Widget>[
            Question(questions[_questionIndex]),
            ElevatedButton(
              onPressed: _onPressAnswer,
              child: Text('Answer 1'),
            ),
            ElevatedButton(
              onPressed: _onPressAnswer,
              child: Text('Answer 2'),
            ),
            ElevatedButton(
              onPressed: _onPressAnswer,
              child: Text('Answer 3'),
            ),
          ],
        ),
      ),
    );
  }
}
