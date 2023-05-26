import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app_s3/controllers/questions_controller.dart';
import 'package:quiz_app_s3/view/question_view.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<QuestionsAndAnswersController>(
            init: QuestionsAndAnswersController(),
            builder: (controller) {
              return Container(
                height: Get.mediaQuery.size.height,
                width: Get.mediaQuery.size.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xFF5B009C), Color(0xFF6F1DAA)]),
                ),
                child: Center(
                  child: QuestionView(
                      questionModel:
                          controller.questionsList[controller.questionIndex]),
                ),
              );
            }));
  }
}
