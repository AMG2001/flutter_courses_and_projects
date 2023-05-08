import 'package:get/get.dart';
import 'package:quiz_app_3/models/question_model.dart';

class QuestionsController extends GetxController {
  List<int> choosen_answers_index = [];

  int questionIndex = 0;

  List<QuestionModel> questionsAndAnswers = [
    QuestionModel(
      questionText: 'what is the first method in stateful widget',
      answer1_text: 'build()',
      answer2_text: 'createState()',
      answer3_text: 'answer3_text',
      answer4_text: 'answer4_text',
      right_answer_index: 2,
    ),
    QuestionModel(
      questionText: 'Question 2',
      answer1_text: 'build()',
      answer2_text: 'createState()',
      answer3_text: 'answer3_text',
      answer4_text: 'answer4_text',
      right_answer_index: 2,
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
      right_answer_index: 2,
    ),
    QuestionModel(
      questionText: 'Question 5',
      answer1_text: 'build()',
      answer2_text: 'createState()',
      answer3_text: 'answer3_text',
      answer4_text: 'answer4_text',
      right_answer_index: 2,
    ),
    QuestionModel(
      questionText: 'Question 6',
      answer1_text: 'build()',
      answer2_text: 'createState()',
      answer3_text: 'answer3_text',
      answer4_text: 'answer4_text',
      right_answer_index: 2,
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
      right_answer_index: 2,
    ),
    QuestionModel(
      questionText: 'Question 9',
      answer1_text: 'build()',
      answer2_text: 'createState()',
      answer3_text: 'answer3_text',
      answer4_text: 'answer4_text',
      right_answer_index: 2,
    ),
    QuestionModel(
      questionText: 'Question 10',
      answer1_text: 'build()',
      answer2_text: 'createState()',
      answer3_text: 'answer3_text',
      answer4_text: 'answer4_text',
      right_answer_index: 2,
    ),
  ];

  void resetChoosenAnswersList() {
    questionIndex = 0;
    choosen_answers_index.clear();
  }

  void addAnswerToChoosendAnswersList({int answer_index = 0}) {
    if (questionIndex == 9) {
      choosen_answers_index.add(answer_index);
      resetChoosenAnswersList();
      update();
    } else {
      choosen_answers_index.add(answer_index);
      getNextQuestion();
    }
  }

  void getNextQuestion() {
    questionIndex++;
    update();
  }
}
