import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_app/question.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final List correctionDetail;
  final int questionQuantity;
  final VoidCallback restart;

  ResultScreen(
      this.score, this.correctionDetail, this.questionQuantity, this.restart);

  @override
  Widget build(BuildContext context) {
    print(correctionDetail[0]['question']);
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40, bottom: 20),
            child: Text(
              "You scored $score out of $questionQuantity",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          ...correctionDetail.map(
            (item) => Container(
              margin: EdgeInsets.symmetric(
                vertical: 10,
              ),
              color: Color.fromARGB(255, 233, 233, 233),
              child: Column(
                children: [
                  Question(
                    item['question']['question'],
                    item['question']['figure'],
                  ),
                  Container(
                    color: Colors.green,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Your answer: ${item['user_answer']}"
                      "\n Correct answer: ${item['correct_answer']}",
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(onPressed: restart, child: Text('Try Again'))
        ],
      ),
    );
  }
}
