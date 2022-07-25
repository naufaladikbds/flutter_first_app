import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Question extends StatelessWidget {
  final String questionText;
  final questionFigure;

  Question(this.questionText, this.questionFigure);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 0, bottom: 20),
        child: Column(
          children: [
            questionFigure != ''
                ? Container(
                    margin: EdgeInsets.only(bottom: 18),
                    child: Image.asset(
                      questionFigure,
                      gaplessPlayback: true,
                    ),
                  )
                : Container(),
            Container(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Text(
                questionText,
                style: TextStyle(
                  fontSize: 14,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
