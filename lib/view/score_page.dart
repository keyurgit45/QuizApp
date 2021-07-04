import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/controller/quiz_controller.dart';

class ScorePage extends StatelessWidget {
  ScorePage({Key? key}) : super(key: key);
  final controller = Get.find<QuizController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffB01E72),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.60,
          width: MediaQuery.of(context).size.width * 0.70,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(18)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/pic.jpg"),
              SizedBox(
                height: 25,
              ),
              Obx(() {
                return Text(
                  "Your Score is\n${controller.myScore.value}",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xffB01E72), fontSize: 26),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
