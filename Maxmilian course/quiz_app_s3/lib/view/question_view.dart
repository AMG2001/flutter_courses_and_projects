import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app_s3/controllers/questions_controller.dart';
import 'package:quiz_app_s3/models/question_model.dart';
import 'package:quiz_app_s3/widgets/custom_button.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionView extends StatelessWidget {
  final questionsController = Get.find<QuestionsAndAnswersController>();
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
                style: GoogleFonts.lato(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color(0x1AFFFFFFF),
                ),
              ),
            ),
            space,
            CustomButton(
                text: questionModel.answer1_text,
                function: () {
                  questionsController.addAnswerToChoosendAnswersList(
                      answer_index: 0);
                }),
            space,
            CustomButton(
                text: questionModel.answer2_text,
                function: () {
                  questionsController.addAnswerToChoosendAnswersList(
                      answer_index: 1);
                }),
            space,
            CustomButton(
                text: questionModel.answer3_text,
                function: () {
                  questionsController.addAnswerToChoosendAnswersList(
                      answer_index: 2);
                }),
            space,
            CustomButton(
                text: questionModel.answer4_text,
                function: () {
                  questionsController.addAnswerToChoosendAnswersList(
                      answer_index: 3);
                }),
          ]),
    );
  }
}
