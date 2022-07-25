import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final List answers;
  final Function onPress;

  Answer(this.answers, this.onPress);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 8),
          ),
          ...answers.map(
            (answeritem) => Container(
              width: double.infinity,
              height: 40,
              margin: EdgeInsets.only(bottom: 15),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                onPressed: () => onPress(answeritem),
                child: Text(
                  answeritem,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
