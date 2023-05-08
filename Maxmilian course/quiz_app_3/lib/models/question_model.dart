class QuestionModel {
  String questionText;
  String answer1_text;
  String answer2_text;
  String answer3_text;
  String answer4_text;
  int right_answer_index;

  int get rightanswer_index => this.right_answer_index;

  set rightanswer_index(int value) => this.right_answer_index = value;

  QuestionModel({
    required this.questionText,
    required this.answer1_text,
    required this.answer2_text,
    required this.answer3_text,
    required this.answer4_text,
    required this.right_answer_index,
  });
}
