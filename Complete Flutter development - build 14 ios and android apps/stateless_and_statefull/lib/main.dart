import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> numberInString = [
    'uno',
    "dos",
    "tres",
    "cuatro",
    "seis",
    "siete",
    "ocho",
    "nueve",
    "diez"
  ];
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(numberInString[counter]),ElevatedButton(onPressed: (){
            setState(() {
              counter <8 ? counter++:counter=0;
            });
          }, child: Text(counter<8?"next is : ${counter+2}":"back to 1"))],
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
