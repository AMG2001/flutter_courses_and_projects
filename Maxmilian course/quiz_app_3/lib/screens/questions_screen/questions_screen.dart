import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app_3/controllers/questions_controller.dart';
import 'package:quiz_app_3/models/question_model.dart';
import 'package:quiz_app_3/view/question_view.dart';

class QuestionsScreen extends StatelessWidget {
  QuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<QuestionsController>(
            init: QuestionsController(),
            builder: (controller) {
              return Center(
                child: QuestionView(
                    questionModel: controller
                        .questionsAndAnswers[controller.questionIndex]),
              );
            }));
  }
}
