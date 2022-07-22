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

  int get scorePercentage {
    return ((score / questionQuantity) * 100).toInt();
  }

  String get scoreText {
    String phrase = 'Failed';
    if (scorePercentage >= 100) {
      phrase = 'Perfect score!';
    } else if (scorePercentage >= 50) {
      phrase = "$scorePercentage%";
    }
    return phrase;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 40, bottom: 5),
              child: Text(
                scoreText,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 0, bottom: 5),
              child: Text(
                "You scored $score out of $questionQuantity",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(
                onPressed: restart,
                child: Text('Try Again'),
              ),
            ),
            ...correctionDetail.map(
              (item) => Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                padding: EdgeInsets.only(
                  bottom: 20,
                  top: 20,
                ),
                color: Color.fromARGB(255, 233, 233, 233),
                child: Column(
                  children: [
                    Question(
                      item['question']['question'],
                      item['question']['figure'],
                    ),
                    Container(
                      color: Colors.blue[200],
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your answer: ${item['user_answer']}",
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "Correct answer: ${item['correct_answer']}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
