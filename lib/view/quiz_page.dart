import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/controller/quiz_controller.dart';
import 'package:quizapp/view/quiz_container.dart';
// import 'package:get/get.dart';

class QuizPage extends StatelessWidget {
  final controller = Get.find<QuizController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffB01E72),
        body: controller.isLoading.value
            ? CircularProgressIndicator()
            : GetX<QuizController>(builder: (controller) {
                return PageView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    controller: controller.pageController,
                    onPageChanged: (value) {
                      controller.selectedPageIndex.value = value;
                    },
                    itemCount: controller.quizes.length,
                    itemBuilder: (context, index) {
                      return Center(child: QuizContainer(index: index));
                    });
              }),
      ),
    );
  }
}
