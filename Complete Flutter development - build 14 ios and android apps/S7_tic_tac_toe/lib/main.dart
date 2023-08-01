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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

enum gameState { empty, circle, cross }

class _HomePageState extends State<HomePage> {
  bool isCross = false;
  List<gameState> gameStateList = [
    gameState.empty,
    gameState.empty,
    gameState.empty,
    gameState.empty,
    gameState.empty,
    gameState.empty,
    gameState.empty,
    gameState.empty,
    gameState.empty
  ];
  AssetImage cross_img = AssetImage('images/cross.png');
  AssetImage circle_img = AssetImage('images/circle.png');
  AssetImage edit_img = AssetImage('images/edit.png');
  String message = "continue";
  void resetGame() {
    setState(() {
      isCross = false;
      gameStateList = [
        gameState.empty,
        gameState.empty,
        gameState.empty,
        gameState.empty,
        gameState.empty,
        gameState.empty,
        gameState.empty,
        gameState.empty,
        gameState.empty
      ];
      message = "continue";
    });
  }

  AssetImage getImage(gameState value) {
    switch (value) {
      case (gameState.empty):
        return edit_img;
      case (gameState.cross):
        return cross_img;
      case (gameState.circle):
        return circle_img;
    }
  }

  playGame({required int index}) {
    if (gameStateList[index] == gameState.empty) {
      setState(() {
        if (isCross)
          gameStateList[index] = gameState.cross;
        else
          gameStateList[index] = gameState.circle;
        isCross = !isCross;
        checkWin();
      });
    }
  }

  void checkWin() {
    // check first Row
    if ((gameStateList[0] != gameState.empty) &&
        gameStateList[0] == gameStateList[1] &&
        gameStateList[1] == gameStateList[2]) {
      setState(() {
        message =
            gameStateList[0] == gameState.circle ? "Circle Win" : "Cross win";
        this.showBottomSheet();
      });
      // check second Row
    } else if ((gameStateList[3] != gameState.empty) &&
        gameStateList[3] == gameStateList[4] &&
        gameStateList[4] == gameStateList[5]) {
      setState(() {
        message =
            gameStateList[3] == gameState.circle ? "Circle Win" : "Cross win";
        this.showBottomSheet();
      });
    }
    // check third Row
    else if ((gameStateList[6] != gameState.empty) &&
        gameStateList[6] == gameStateList[7] &&
        gameStateList[7] == gameStateList[8]) {
      setState(() {
        message =
            gameStateList[6] == gameState.circle ? "Circle Win" : "Cross win";
        this.showBottomSheet();
      });
    }
    // check first column
    else if ((gameStateList[0] != gameState.empty) &&
        gameStateList[0] == gameStateList[3] &&
        gameStateList[3] == gameStateList[6]) {
      setState(() {
        message =
            gameStateList[0] == gameState.circle ? "Circle Win" : "Cross win";
        this.showBottomSheet();
      });
    }
    // check second column
    else if ((gameStateList[1] != gameState.empty) &&
        gameStateList[1] == gameStateList[4] &&
        gameStateList[4] == gameStateList[7]) {
      setState(() {
        message =
            gameStateList[1] == gameState.circle ? "Circle Win" : "Cross win";
        this.showBottomSheet();
      });
    }
    // check third column
    else if ((gameStateList[2] != gameState.empty) &&
        gameStateList[2] == gameStateList[5] &&
        gameStateList[5] == gameStateList[8]) {
      setState(() {
        message =
            gameStateList[2] == gameState.circle ? "Circle Win" : "Cross win";
        this.showBottomSheet();
      });
    }
    // check diagonal
    else if ((gameStateList[0] != gameState.empty) &&
        gameStateList[0] == gameStateList[4] &&
        gameStateList[4] == gameStateList[8]) {
      setState(() {
        message =
            gameStateList[0] == gameState.circle ? "Circle Win" : "Cross win";
        this.showBottomSheet();
      });
    }
    // check other diagonal
    else if ((gameStateList[2] != gameState.empty) &&
        gameStateList[2] == gameStateList[4] &&
        gameStateList[4] == gameStateList[6]) {
      setState(() {
        message =
            gameStateList[2] == gameState.circle ? "Circle Win" : "Cross win";
        this.showBottomSheet();
      });
    } else if (!gameStateList.contains(gameState.empty))
      setState(() {
        message = "Game Draw";
        this.showBottomSheet();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TicTacToe"),
      ),
      body: Container(
        child: GridView.builder(
          itemCount: gameStateList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if (message == "continue")
                  playGame(index: index);
                else
                  this.showBottomSheet();
              },
              child: SizedBox(
                height: 100,
                width: 100,
                child: Image(
                  image: getImage(gameStateList[index]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void showBottomSheet() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return FittedBox(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                padding: EdgeInsets.all(24),
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      margin: EdgeInsets.only(top: 16, bottom: 32),
                      width: MediaQuery.sizeOf(context).width * .2,
                      height: 6,
                    ),
                    Text(
                      "$message",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(16),
                          backgroundColor: Colors.deepPurple),
                      onPressed: () {
                        resetGame();
                        Navigator.pop(context);
                      },
                      child: Text("Reset Game"),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
