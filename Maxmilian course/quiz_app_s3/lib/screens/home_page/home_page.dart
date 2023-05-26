import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app_s3/screens/questions_screen/questions_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFF5B009C), Color(0xFF6F1DAA)]),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              width: 220,
              color: Color(0x1AFFFFFFF),
            ),
            const SizedBox(
              height: 36,
            ),
            const Text(
              "Learn Flutter the fun way!",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 24,
            ),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xA1FFFFFF),
                  side: const BorderSide(color: Color(0xA1FFFFFF))),
              icon: const Icon(Icons.arrow_right_alt_rounded),
              onPressed: () {
                Get.to(() => QuestionsScreen());
              },
              label: const Text(
                "Start Quiz",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
