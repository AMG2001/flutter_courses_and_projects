import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double height;
  late double width;

  double containerWidth = 100;
  double containerHeight = 100;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.sizeOf(context).width;
    height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _backgroundContainer(),
            _basicButton(),
          ],
        ),
      ),
    );
  }

  Widget _backgroundContainer() {
    return Container(
      width: width,
      height: height,
      color: Colors.blue,
    );
  }

  Widget _basicButton() {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            containerHeight = containerHeight == 100 ? 200 : 100;
            containerWidth = containerWidth == 100 ? 200 : 100;
          });
        },
        child: AnimatedContainer(
          alignment: Alignment.center,
          width: containerWidth,
          height: containerHeight,
          duration: Duration(milliseconds: 750),
          curve: Curves.bounceInOut,
          decoration: BoxDecoration(
              color: Colors.purple, borderRadius: BorderRadius.circular(100)),
          child: Text(
            "Basic!",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
