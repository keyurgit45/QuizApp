import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/controller/quiz_controller.dart';

class QuizContainer extends StatefulWidget {
  // const QuizContainer({Key? key}) : super(key: key);
  late final int index;
  QuizContainer({required this.index});

  @override
  _QuizContainerState createState() => _QuizContainerState();
}

class _QuizContainerState extends State<QuizContainer> {
  final quizController = Get.find<QuizController>();

  List<String> options = [];

  void makeOptions() {
    for (var item in quizController.quizes[widget.index].incorrectAnswers) {
      options.add(item);
    }
    options.add(quizController.quizes[widget.index].correctAnswer);
    options.shuffle();
  }

  void onPressed(option) {
    quizController.isAttemped.value = true;
    if (option == quizController.quizes[widget.index].correctAnswer) {
      quizController.isCorrect.value = "Correct Answer!";
      quizController.myScore.value += 1;
    } else {
      quizController.isCorrect.value = "Incorrect Answer";
    }
  }

  void startTimer() {
    Timer.periodic(Duration(seconds: 1), (t) {
      quizController.timer.value -= 1;

      if (quizController.timer.value == 0) {
        quizController.isCorrect.value = "    Time is Up!";
        quizController.isAttemped.value = true;
        t.cancel();
        quizController.timer.value = 30;
      } else if (quizController.isAttemped.value) {
        t.cancel();
      }
    });
  }

  bool get isMultiple => quizController.quizes[widget.index].type == "multiple";

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    makeOptions();

    return GetX<QuizController>(builder: (controller) {
      return Stack(children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.83,
            width: MediaQuery.of(context).size.width * 0.80,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(18)),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: 63,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  quizController.quizes[widget.index].question,
                  maxLines: 5,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              IgnorePointer(
                ignoring: quizController.isAttemped.value ? true : false,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: isMultiple ? 4 : 2,
                    itemBuilder: (context, e) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: ElevatedButton(
                          onPressed: () {
                            onPressed(options[e].toString());
                          },
                          child: Text(
                            options[e].toString(),
                            style: TextStyle(
                                color: quizController.isAttemped.value
                                    ? quizController.quizes[widget.index]
                                                .correctAnswer ==
                                            options[e].toString()
                                        ? Colors.white
                                        : Colors.black
                                    : Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size.fromWidth(240),
                              primary: quizController.isAttemped.value
                                  ? quizController.quizes[widget.index]
                                              .correctAnswer ==
                                          options[e].toString()
                                      ? Colors.lightGreen
                                      : Colors.white
                                  : Colors.white,
                              side: BorderSide(
                                  color: quizController.isAttemped.value
                                      ? quizController.quizes[widget.index]
                                                  .correctAnswer ==
                                              options[e].toString()
                                          ? Colors.transparent
                                          : Colors.black
                                      : Colors.black),
                              shape: StadiumBorder()),
                        ),
                      );
                    }),
              ),
            ])),
        if (quizController.isAttemped.value)
          Positioned(
              bottom: 20,
              right: 20,
              child: FloatingActionButton.extended(
                backgroundColor: Color(0xffB01E72),
                onPressed: quizController.nextQuestion,
                label: Row(
                  children: [
                    Text(quizController.isLastPage ? "View Score " : "Next "),
                    Icon(quizController.isLastPage
                        ? Icons.sports_score
                        : Icons.navigate_next),
                  ],
                ),
              )),
        if (quizController.isAttemped.value)
          Positioned(
              left: MediaQuery.of(context).size.width * 0.18,
              top: 60,
              child: Text(quizController.isCorrect.value,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600))),
        Positioned(
          child: Text(
            "Question ${widget.index + 1}",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          top: 20,
          left: MediaQuery.of(context).size.width * 0.28,
        ),
        Positioned(
          top: 110,
          left: MediaQuery.of(context).size.width * 0.35,
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xffB01E72), width: 1.7)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "${quizController.timer.value}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        )
      ]);
    });
  }
}
