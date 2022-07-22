import 'package:flutter/cupertino.dart';
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

  //TODO: quiz progress bar

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
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
    );
  }
}
