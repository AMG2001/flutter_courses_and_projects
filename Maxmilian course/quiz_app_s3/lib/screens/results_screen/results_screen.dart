import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app_s3/controllers/questions_controller.dart';
import 'package:quiz_app_s3/main.dart';
import 'package:quiz_app_s3/screens/results_screen/result_model.dart';
import 'package:quiz_app_s3/screens/results_screen/result_view.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: Get.mediaQuery.size.height,
          width: Get.mediaQuery.size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFF5B009C), Color(0xFF6F1DAA)]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: Get.mediaQuery.size.height * .65,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "You answered 3 out of 6 questions Correctly",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0x1AFFFFFFF),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    GetBuilder<QuestionsAndAnswersController>(
                        builder: (q_aController) {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: q_aController.questionsList.length,
                          itemBuilder: (context, index) => ResultView(
                            resultModel: ResultModel(
                                question: q_aController
                                    .questionsList[index].questionText,
                                questionNumber: index + 1,
                                choosenAnswer: q_aController
                                    .resultsList[index].choosenAnswer,
                                correctAnswer: q_aController
                                    .resultsList[index].correctAnswer),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple.withOpacity(.1)),
                  onPressed: () {
                    questionsController.resetChoosenAnswersList();
                  },
                  child: Text('Try again'))
            ],
          ),
        ),
      ),
    );
  }
}
