import 'package:flutter/material.dart';
import 'package:go_moon/home_page.dart';

void main() {
  runApp(GoMoon());
}

class GoMoon extends StatelessWidget {
  const GoMoon({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(),
      title: 'Go Moon',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
