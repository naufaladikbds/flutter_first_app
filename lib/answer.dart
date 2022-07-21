import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final List answers;
  final Function onPress;

  Answer(this.answers, this.onPress);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: answers
            .map(
              (answeritem) => Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 85),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  onPressed: () => onPress(answeritem),
                  child: Text(
                    answeritem,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
            .toList());
  }
}
