import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_app/answer.dart';
import 'package:flutter_first_app/question.dart';

class QuizScreen extends StatelessWidget {
  final List questionAndAnswer;
  final int _questionIndex;
  final Function _onPressAnswer;

  const QuizScreen(
    this.questionAndAnswer,
    this._questionIndex,
    this._onPressAnswer,
  );

  //TODO: beautify progress bar

  Color progressBar(barIndex) {
    if (_questionIndex >= barIndex) {
      return Color.fromARGB(255, 33, 184, 33);
    } else {
      return Color.fromARGB(255, 218, 218, 218);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              height: 10,
              child: Row(
                children: [
                  ...List.generate(questionAndAnswer.length, (i) {
                    return Expanded(
                      child: Container(
                        color: progressBar(i),
                      ),
                    );
                  }),
                ],
              ),
            ),
            Question(
              questionAndAnswer[_questionIndex]['question'] as String,
              questionAndAnswer[_questionIndex]['figure'],
            ),
            Answer(
              questionAndAnswer[_questionIndex]['choice'] as List,
              _onPressAnswer,
            ),
          ],
        ),
      ),
    );
  }
}
