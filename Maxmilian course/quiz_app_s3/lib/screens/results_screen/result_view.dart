import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app_s3/screens/results_screen/result_model.dart';

class ResultView extends StatelessWidget {
  ResultView({super.key, required this.resultModel});
  ResultModel resultModel;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      leading: CircleAvatar(
        radius: 16,
        backgroundColor:
            resultModel.isCorrect ? Colors.blue[300] : Colors.pink[300],
        child: Text(
          resultModel.questionNumber.toString(),
          style: TextStyle(color: Colors.black),
        ),
      ),
      title: Text(
        resultModel.question,
        style: GoogleFonts.lato(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
      ),
      subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 4,
        ),
        Text(
          resultModel.correctAnswer,
          style: GoogleFonts.lato(
              color: Colors.pink[200],
              fontSize: 14,
              fontWeight: FontWeight.w600),
        ),
        Text(
          resultModel.choosenAnswer,
          style: GoogleFonts.lato(
              color: Colors.blue[100],
              fontSize: 14,
              fontWeight: FontWeight.w600),
        ),
      ]),
    );
  }
}
