class ResultModel {
  int questionNumber;
  String question;
  String correctAnswer;
  String choosenAnswer;
  late bool isCorrect;
  ResultModel(
      {required this.questionNumber,
      required this.question,
      required this.correctAnswer,
      required this.choosenAnswer}) {
    correctAnswer == choosenAnswer ? isCorrect = true : isCorrect = false;
  }
}
