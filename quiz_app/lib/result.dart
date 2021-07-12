import 'package:flutter/material.dart';
import 'main.dart';

class Result extends StatelessWidget {
  final VoidCallback q;
  final int resultScore;

  Result(this.q, this.resultScore);

  String get resultPhrase {
    String resultText;
    if (resultScore >= 70) {
      resultText = "You are awesome !";
    } else if (resultScore >= 40) {
      resultText = "Pretty likable !";
    } else {
      resultText = "You are so bad !";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: [
            Text(
              "Your Score is : $resultScore \n" + resultPhrase,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: b),
              textAlign: TextAlign.center,
            ),
            FlatButton(
              child: Text(
                "Restart The App",
                style: TextStyle(fontSize: 30, color: Colors.blue),
              ),
              onPressed: q,
            ),
          ],
        ));
  }
}
