import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app_s3/controllers/questions_controller.dart';
import 'package:quiz_app_s3/screens/home_page/home_page.dart';
import 'package:quiz_app_s3/screens/questions_screen/questions_screen.dart';
import 'package:quiz_app_s3/screens/results_screen/results_screen.dart';

final questionsController =
    Get.put(QuestionsAndAnswersController(), permanent: true);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: "Quiz App",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
