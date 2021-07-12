import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

Color w = Colors.white;
Color b = Colors.black;

class _MyAppState extends State<MyApp> {
  bool isSwitched = false;

  int questionIndex = 0;
  int totalScore = 0;
  int num = 0, num1 = 0, num2 = 0;

  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      totalScore = 0;
      num = 0;
      num1 = 0;
      num2 = 0;
    });
  }

  void answerQuestion(int score) {
    if (questionIndex == 0) {
      num = score;
    } else if (questionIndex == 1) {
      num1 = score;
    } else if (questionIndex == 2) {
      num2 = score;
    }
    totalScore += score;
    setState(() {
      questionIndex += 1;
    });
  }

  final List<Map<String, Object>> question = [
    // Map
    {
      'questionText': 'What\'s Your Favorite Color ?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Green', 'score': 20},
        {'text': 'Blue', 'score': 30},
        {'text': 'Yellow', 'score': 40},
      ],
    },
    {
      'questionText': 'What\'s Your Favorite Animal ?',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Tiger', 'score': 20},
        {'text': 'Elephant', 'score': 30},
        {'text': 'Lion', 'score': 40},
      ],
    },
    {
      'questionText': 'What\'s Your Favorite Instructor ?',
      'answers': [
        {'text': 'Yasser', 'score': 10},
        {'text': 'Esam', 'score': 20},
        {'text': 'Ebrahem', 'score': 30},
        {'text': 'Mina', 'score': 40},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Quiz App",
            style: TextStyle(color: w),
          ),
          actions: <Widget>[
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                  if (isSwitched == true) {
                    b = Colors.white;
                    w = Colors.black;
                  }
                  if (isSwitched == false) {
                    b = Colors.black;
                    w = Colors.white;
                  }
                });
              },
              activeColor: Colors.white,
              inactiveThumbColor: Colors.black,
              inactiveTrackColor: Colors.black,
            ),
          ],
        ),
        body: Container(
          color: w,
          child: questionIndex < question.length
              ? Quiz(question, questionIndex, answerQuestion)
              : Result(resetQuiz, totalScore),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.arrow_back,
            color: w,
            size: 40,
          ),
          onPressed: () {
            if (questionIndex == 1) {
              totalScore -= num;
            } else if (questionIndex == 2) {
              totalScore -= num1;
            } else if (questionIndex == 3) {
              totalScore -= num2;
            }
            setState(() {
              if (questionIndex > 0) {
                questionIndex--;
              }
            });
          },
        ),
      ),
    );
  }
}
