import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app_3/controllers/questions_controller.dart';
import 'package:quiz_app_3/models/question_model.dart';

class QuestionView extends StatelessWidget {
  final questionsController = Get.find<QuestionsController>();

  QuestionModel questionModel;
  QuestionView({super.key, required this.questionModel});
  var space = const SizedBox(
    height: 24,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(35),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                questionModel.questionText,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ),
            space,
            ElevatedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                onPressed: () {
                  questionsController.addAnswerToChoosendAnswersList(
                      answer_index: 0);
                },
                child: Text(questionModel.answer1_text)),
            space,
            ElevatedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                onPressed: () {
                  questionsController.addAnswerToChoosendAnswersList(
                      answer_index: 1);
                },
                child: Text(questionModel.answer2_text)),
            space,
            ElevatedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                onPressed: () {
                  questionsController.addAnswerToChoosendAnswersList(
                      answer_index: 2);
                },
                child: Text(questionModel.answer3_text)),
            space,
            ElevatedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                onPressed: () {
                  questionsController.addAnswerToChoosendAnswersList(
                      answer_index: 3);
                },
                child: Text(questionModel.answer4_text)),
          ]),
    );
  }
}
