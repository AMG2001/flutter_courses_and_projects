import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:sya7_ansary/list_tile_model.dart';

void main() {
  runApp(AnsaryApp());
}

class AnsaryApp extends StatelessWidget {
  const AnsaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "sya7 ansary",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> recordesWidget = [];

  @override
  Widget build(BuildContext context) {
    recordesWidget = [
      ListTileModel(
        recordName: "انا خدت القرااااار",
        recordPath: "ansary1.opus",
        duration: 2300,
      ),
      ListTileModel(
        recordName: " مش عاوز اشتم خلي بالك يا كسمك",
        recordPath: "ansary2.opus",
        duration: 18500,
      ),
      ListTileModel(
        recordName: "قله ادب كالعاده",
        recordPath: "ansary3.opus",
        duration: 10000,
      ),
      ListTileModel(
        recordName: "كسمك يلا",
        recordPath: "ansary4.opus",
        duration: 10000,
      ),
      ListTileModel(
        recordName: "غور يلا من هنا يلا",
        recordPath: "ansary5.opus",
        duration: 2000,
      ),
      ListTileModel(
        recordName: "صلاح اللي بنتقرف منه",
        recordPath: "ansary6.opus",
        duration: 12000,
      ),
      ListTileModel(
        recordName: "بتفضحني قدام اخويا يابن الوسخه 😂😂",
        recordPath: "ansary7.opus",
        duration: 4000,
      ),
      ListTileModel(
        recordName: "يا شله وسخه",
        recordPath: "ansary8.opus",
        duration: 5000,
      ),
      ListTileModel(
        recordName: "في طيظك",
        recordPath: "ansary9.opus",
        duration: 13000,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Sya7_Ansary"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: recordesWidget,
        ),
      ),
    );
  }
}
