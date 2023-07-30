import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHoePage(),
    );
  }
}

class MyHoePage extends StatefulWidget {
  const MyHoePage({super.key});

  @override
  State<MyHoePage> createState() => _MyHoePageState();
}

class _MyHoePageState extends State<MyHoePage> {
  List<String> images_paths = [
    'images/one.png',
    'images/two.png',
    'images/three.png',
    'images/four.png',
    'images/five.png',
    'images/six.png',
  ];
  @override
  Widget build(BuildContext context) {
    int random_int = Random().nextInt(5) + 1;
    return Scaffold(
      appBar: AppBar(
        title: Text("Dice Roller"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(images_paths[random_int]),
            SizedBox(
              height: 24,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text("Change"))
          ],
        ),
      ),
    );
  }
}
