import 'package:flutter/material.dart';
import 'main.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final VoidCallback x;

  Answer(this.x, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: RaisedButton(
        color: Colors.blue,
        textColor: w,
        child: Text(
          answerText,
          style: TextStyle(fontSize: 25),
        ),
        onPressed: x,
      ),
    );
  }
}