import 'package:flutter/material.dart';
import 'package:flutter_first_app/answer.dart';
import 'package:flutter_first_app/data.dart';
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
  static const questionAndAnswer = quizData;

  int _questionIndex = 0;
  bool isFinished = false;

  void _onPressAnswer() {
    if (_questionIndex < questionAndAnswer.length - 1) {
      setState(() {
        _questionIndex++;
      });
      print('here is the next question');
    } else {
      isFinished = true;
      setState(() {});
      print('No question left');
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> ResultScreen = [];
    // List<Widget> ResultScreen = [];
    print('Question index is $_questionIndex');
    print('Question length is ${questionAndAnswer.length}');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('E-Psychotest'),
        ),
        body: isFinished
            ? Center(
                child: Text("COMPLETE"),
              )
            : Column(
                children: [
                  Question(
                    questionAndAnswer[_questionIndex]['question'] as String,
                    questionAndAnswer[_questionIndex]['figure'],
                  ),
                  Answer(
                    questionAndAnswer[_questionIndex]['answers'] as List,
                    _onPressAnswer,
                  ),
                ],
              ),
      ),
    );
  }
}
