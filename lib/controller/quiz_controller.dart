import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quizapp/model/quiz_model.dart';
import 'package:quizapp/view/score_page.dart';

class QuizController extends GetxController {
  List<QuizModel> quizes = <QuizModel>[].obs;
  var isLoading = true.obs;
  var isAttemped = false.obs;
  var isCorrect = "Incorrect Answer".obs;
  var selectedPageIndex = 0.obs;
  var myScore = 0.obs;
  var timer = 30.obs;
  final pageController = PageController();

  bool get isLastPage => selectedPageIndex.value == quizes.length - 1;

  @override
  void onInit() {
    fetchQuestions();
    super.onInit();
  }

  void nextQuestion() {
    if (isLastPage) {
      print("last page");
      Get.off(() => ScorePage());
    } else {
      isAttemped.value = false;
      pageController.nextPage(
          duration: Duration(milliseconds: 500), curve: Curves.easeIn);
      timer.value = 30;
    }
  }

  void fetchQuestions() async {
    await Future.delayed(Duration(seconds: 1));
    quizes.addAll(questions);
    isLoading.value = false;
  }
}
