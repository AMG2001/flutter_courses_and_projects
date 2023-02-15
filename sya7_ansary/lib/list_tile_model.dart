import 'dart:async';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class ListTileModel extends StatefulWidget {
  String recordName;
  String recordPath;
  int duration;
  ListTileModel(
      {required this.recordName,
      required this.recordPath,
      required this.duration});

  @override
  State<ListTileModel> createState() => _ListTileModelState();
}

class _ListTileModelState extends State<ListTileModel> {
  Widget buttonIcon = Icon(Icons.play_arrow_outlined);
  bool audioPlayed = false;
  final player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.black)),
        child: ListTile(
          title: Text(widget.recordName),
          leading: IconButton(
            onPressed: () async {
              setState(() {
                buttonIcon = Icon(Icons.pause_circle_outline);
              });
              await player.play(AssetSource(widget.recordPath));
              Timer(Duration(milliseconds: widget.duration), () {
                setState(() {
                  buttonIcon = Icon(Icons.play_arrow_outlined);
                });
              });
            },
            icon: buttonIcon,
          ),
        ),
      ),
    );
  }
}
