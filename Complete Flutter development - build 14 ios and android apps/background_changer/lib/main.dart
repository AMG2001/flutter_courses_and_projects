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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Color> colorsList = [
    Colors.blue,
    Colors.black,
    Colors.white,
    Colors.purple,
    Colors.blueAccent,
    Colors.green,
    Colors.green,
    Colors.red
  ];

  int colorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorsList[colorIndex],
      appBar: AppBar(
        title: Text("Background Changer"),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: OutlinedButton(
            onPressed: () {
              setState(() {
                colorIndex = Random().nextInt(colorsList.length);
              });
            },
            child: Text(
              "Random Color",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
