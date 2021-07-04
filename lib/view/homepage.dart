import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/view/quiz_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xffB0267A),
      body: Column(
        children: [
          Expanded(
              child: Center(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Quiz App",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 55)),
              SizedBox(
                height: 15,
              ),
              Text("Let's Play Quiz",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w300)),
            ],
          ))),
          CupertinoButton(
              color: Colors.white,
              child: Text("Start Quiz",
                  style: TextStyle(color: Color(0xffB01E72))),
              onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => QuizPage()))),
          SizedBox(
            height: 80,
          )
        ],
      ),
    ));
  }
}
