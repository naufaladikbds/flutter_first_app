import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Question extends StatelessWidget {
  final String questionText;
  final questionFigure;

  Question(this.questionText, this.questionFigure);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20, bottom: 10),
      child: Column(
        children: [
          Container(
            child: questionFigure != ''
                ? Image.asset(
                    questionFigure,
                    gaplessPlayback: true,
                  )
                : null,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 16,
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
    );
  }
}
