import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spanish Numbers',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});
  List<Color> list_colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.pink,
    Colors.brown,
    Colors.blueGrey,
    Colors.teal,
    Colors.grey,
    Colors.orange,
    Colors.purple
  ];
  List<String> list_numbers = [
    "one",
    "two",
    "three",
    "four",
    "five",
    "six",
    "seven",
    "eight",
    "nine",
    "ten",
  ];
  List<String> list_audio_path = [
    'audios/one.wav',
    'audios/two.wav',
    'audios/three.wav',
    'audios/four.wav',
    'audios/five.wav',
    'audios/six.wav',
    'audios/seven.wav',
    'audios/eight.wav',
    'audios/nine.wav',
    'audios/ten.wav',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 36,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset('assets/images/logo.png')],
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: 10,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async {
                    AudioPlayer player = AudioPlayer();
                    await player.play(AssetSource(list_audio_path[index]));
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * .2,
                    height: 20,
                    color: list_colors[index],
                    child: Center(
                      child: Text(
                        list_numbers[index],
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
