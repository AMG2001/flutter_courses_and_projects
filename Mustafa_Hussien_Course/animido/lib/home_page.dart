import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _starAnimationController;

  @override
  void initState() {
    super.initState();
    _starAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    // is to make animation start only from 0 to 1 .
    _starAnimationController.forward();
    // is to make animation start from 1 to 0 only .
    _starAnimationController.reverse();
    // to make repeat it self infinity .
    _starAnimationController.repeat();
  }

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
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [_basicButton(), _starIcon()],
            )
          ],
        ),
      ),
    );
  }

  Widget _starIcon() {
    return AnimatedBuilder(
      animation: _starAnimationController.view,
      builder: (context, child) {
        return Transform.rotate(
            /**
           * _starAnimationController.value will be in degree , but we need raduis not degree 
           * so with math we make it : _starAnimationController.value * 2 * pi
           */
            angle: _starAnimationController.value * 2 * pi,
            child: child);
      },
      child: Icon(
        Icons.star,
        color: Colors.white,
        size: 100,
      ),
    );
  }

  Tween<double> _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0);

  Widget _backgroundContainer() {
    return TweenAnimationBuilder(
      tween: _scaleAnimation,
      duration: Duration(milliseconds: 750),
      builder: (context, value, child) {
        return Transform.scale(
          child: child,
          scale: value,
        );
      },
      child: Container(
        width: width,
        height: height,
        color: Colors.blue,
      ),
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
