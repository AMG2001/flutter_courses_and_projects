import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scratch Win',
      theme: ThemeData.light(useMaterial3: true).copyWith(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

enum NumberType { lucky, unLucky }

class _HomePageState extends State<HomePage> {
  int luckyNumber = Random().nextInt(25);

  late List<NumberType> itemsArray;

  @override
  void initState() {
    itemsArray = List<NumberType>.generate(25, (index) {
      return index == luckyNumber ? NumberType.lucky : NumberType.unLucky;
    });
    print(itemsArray);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: 25,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return CustomCard(
                    numberType: itemsArray[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatefulWidget {
  late NumberType numberType;
  CustomCard({required this.numberType});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  AssetImage img_circle = AssetImage('images/circle.png');
  AssetImage img_lucky = AssetImage('images/rupee.png');
  AssetImage img_unLucky = AssetImage('images/sadFace.png');

  late Widget custom_widget = GestureDetector(
    child: Container(
      height: 50,
      width: 50,
      color: Colors.grey,
      child: Image(image: img_circle),
    ),
    onTap: () {
      showen == false
          ? setState(() {
              custom_widget = Container(
                child: Image(
                    image: widget.numberType == NumberType.lucky
                        ? img_lucky
                        : img_unLucky),
              );
            })
          : null;
    },
  );
  bool showen = false;
  @override
  Widget build(BuildContext context) {
    return custom_widget;
  }
}
