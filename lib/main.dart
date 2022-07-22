import 'package:flutter/material.dart';
import 'package:flutter_first_app/answer.dart';
import 'package:flutter_first_app/data.dart';
import 'package:flutter_first_app/question.dart';
import 'package:flutter_first_app/quiz_screen.dart';
import 'package:flutter_first_app/result_screen.dart';

void main(List<String> args) {
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
  List correctionDetail = [];
  int _score = 0;
  bool isFinished = false;

  void _onPressAnswer(String answerChosen) {
    if (_questionIndex < questionAndAnswer.length) {
      if (answerChosen == questionAndAnswer[_questionIndex]['answer']) {
        _score++;
      } else {
        correctionDetail.add({
          'no': _questionIndex + 1,
          'question': questionAndAnswer[_questionIndex],
          'user_answer': answerChosen,
          'correct_answer': questionAndAnswer[_questionIndex]['answer'],
        });
      }
      setState(() {
        _questionIndex++;
        print(_questionIndex);
      });
    } else {
      setState(() {
        isFinished = true;
      });
    }
  }

  void restart() {
    setState(() {
      _score = 0;
      _questionIndex = 0;
      correctionDetail = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    // List<Widget> ResultScreen = [];
    print('Question index is $_questionIndex');
    print('Question length is ${questionAndAnswer.length}');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('E-Psychotest'),
        ),
        body: _questionIndex > questionAndAnswer.length - 1
            ? ResultScreen(
                _score,
                correctionDetail,
                questionAndAnswer.length,
                restart,
              )
            : QuizScreen(
                questionAndAnswer,
                _questionIndex,
                _onPressAnswer,
              ),
      ),
    );
  }
}
