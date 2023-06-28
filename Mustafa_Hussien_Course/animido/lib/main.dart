import 'package:animido/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Animido());
}


class Animido extends StatelessWidget {
  const Animido({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"Animido" ,
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}



