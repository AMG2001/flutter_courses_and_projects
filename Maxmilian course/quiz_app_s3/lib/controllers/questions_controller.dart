import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app_s3/models/question_model.dart';
import 'package:quiz_app_s3/screens/home_page/home_page.dart';
import 'package:quiz_app_s3/screens/results_screen/result_model.dart';
import 'package:quiz_app_s3/screens/results_screen/results_screen.dart';

class QuestionsAndAnswersController extends GetxController {
  List<int> choosen_answers_index = [];
  List<ResultModel> resultsList = [];

  int questionIndex = 0;

  List<QuestionModel> questionsList = [
    QuestionModel(
      questionText: 'what is the first method in stateful widget',
      answer1_text: 'build()',
      answer2_text: 'createState()',
      answer3_text: 'answer3_text',
      answer4_text: 'answer4_text',
      right_answer_index: 0,
    ),
    QuestionModel(
      questionText: 'Question 2',
      answer1_text: 'build()',
      answer2_text: 'createState()',
      answer3_text: 'answer3_text',
      answer4_text: 'answer4_text',
      right_answer_index: 1,
    ),
    QuestionModel(
      questionText: 'Question 3',
      answer1_text: 'build()',
      answer2_text: 'createState()',
      answer3_text: 'answer3_text',
      answer4_text: 'answer4_text',
      right_answer_index: 2,
    ),
    QuestionModel(
      questionText: 'Question 4',
      answer1_text: 'build()',
      answer2_text: 'createState()',
      answer3_text: 'answer3_text',
      answer4_text: 'answer4_text',
      right_answer_index: 3,
    ),
    QuestionModel(
      questionText: 'Question 5',
      answer1_text: 'build()',
      answer2_text: 'createState()',
      answer3_text: 'answer3_text',
      answer4_text: 'answer4_text',
      right_answer_index: 0,
    ),
    QuestionModel(
      questionText: 'Question 6',
      answer1_text: 'build()',
      answer2_text: 'createState()',
      answer3_text: 'answer3_text',
      answer4_text: 'answer4_text',
      right_answer_index: 1,
    ),
    QuestionModel(
      questionText: 'Question 7',
      answer1_text: 'build()',
      answer2_text: 'createState()',
      answer3_text: 'answer3_text',
      answer4_text: 'answer4_text',
      right_answer_index: 2,
    ),
    QuestionModel(
      questionText: 'Question 8',
      answer1_text: 'build()',
      answer2_text: 'createState()',
      answer3_text: 'answer3_text',
      answer4_text: 'answer4_text',
      right_answer_index: 3,
    ),
    QuestionModel(
      questionText: 'Question 9',
      answer1_text: 'build()',
      answer2_text: 'createState()',
      answer3_text: 'answer3_text',
      answer4_text: 'answer4_text',
      right_answer_index: 0,
    ),
    QuestionModel(
      questionText: 'Question 10',
      answer1_text: 'build()',
      answer2_text: 'createState()',
      answer3_text: 'answer3_text',
      answer4_text: 'answer4_text',
      right_answer_index: 1,
    ),
  ];

  void moveToResultsPage() {
    Get.to(() => ResultsScreen(),
        transition: Transition.rightToLeft,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic);
  }

  void resetChoosenAnswersList() {
    Get.offAll(() => HomePage(),
        transition: Transition.leftToRight,
        curve: Curves.easeInOutCubic,
        duration: Duration(milliseconds: 500));
    questionIndex = 0;
    choosen_answers_index.clear();
    update();
  }

  void storeAnswer({required int answer_index}) {
    choosen_answers_index.add(answer_index);
    late String correctAnswer;
    late String choosenAnswer;
    /**
       * Define corrent Answer .
       */
    switch (questionsList[questionIndex].right_answer_index) {
      case 0:
        correctAnswer = questionsList[questionIndex].answer1_text;
        break;
      case 1:
        correctAnswer = questionsList[questionIndex].answer2_text;
        break;
      case 2:
        correctAnswer = questionsList[questionIndex].answer3_text;
        break;
      case 3:
        correctAnswer = questionsList[questionIndex].answer4_text;
        break;
    }

    /**
       * Define Choosen answer .
       */
    switch (answer_index) {
      case 0:
        choosenAnswer = questionsList[questionIndex].answer1_text;
        break;
      case 1:
        choosenAnswer = questionsList[questionIndex].answer2_text;
        break;
      case 2:
        choosenAnswer = questionsList[questionIndex].answer3_text;
        break;
      case 3:
        choosenAnswer = questionsList[questionIndex].answer4_text;
        break;
    }
    resultsList.add(ResultModel(
        questionNumber: questionIndex,
        question: questionsList[questionIndex].questionText,
        correctAnswer: correctAnswer,
        choosenAnswer: choosenAnswer));
  }

  void addAnswerToChoosendAnswersList({int answer_index = 0}) {
    storeAnswer(answer_index: answer_index);
    if (questionIndex == 9)
      moveToResultsPage();
    else
      getNextQuestion();
  }

  void getNextQuestion() {
    questionIndex++;
    update();
  }
}
