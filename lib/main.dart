import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/controller/quiz_controller.dart';
import 'package:quizapp/view/homepage.dart';
import 'package:quizapp/view/quiz_page.dart';
import 'package:quizapp/view/score_page.dart';
// import 'package:quizapp/view/quiz_page.dart';

void main() {
  runApp(MyApp());
  Get.put(QuizController());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Quiz App',
      home: HomePage(),
      getPages: [
        GetPage(name: '/scorepage', page: () => ScorePage()),
        GetPage(name: '/quizpage', page: () => QuizPage())
      ],
    );
  }
}
