import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/home_page/bottom_sheet_view/bottom_sheet_view.dart';
import 'package:notes_app/home_page/bottom_sheet_view/color_circle.dart';

class NoteColorController extends GetxController {
  static String id_note_color_builder = 'id1';
  late int defaultChoosenColorIndex = 0;
  late int lastChoosenColorIndex;
  late Color defaultNoteBackgroundColor = Colors.red;

  List<ColorCircle> noteColorsPalleteList = [
    ColorCircle(circleColor: Color(0xFF231942), index: 0),
    ColorCircle(circleColor: Color(0xFF5e548e), index: 1),
    ColorCircle(circleColor: Color(0xFF9f86c0), index: 2),
    ColorCircle(circleColor: Color(0xFFbe95c4), index: 3),
    ColorCircle(circleColor: Color(0xFFe0b1cb), index: 4),
  ];

  NoteColorController() {
    defaultChoosenColorIndex = noteColorsPalleteList[0].index;
    defaultNoteBackgroundColor = noteColorsPalleteList[0].circleColor;
    lastChoosenColorIndex = noteColorsPalleteList[0].index;

    noteColorsPalleteList[0].w = Container(
      child: Icon(Icons.check),
    );
  }

  void selectColor(int choosenColorIndex) {
    if (choosenColorIndex == lastChoosenColorIndex)
      return;
    else {
      noteColorsPalleteList[lastChoosenColorIndex].w = SizedBox();
      noteColorsPalleteList[choosenColorIndex].w = Container(
        child: Icon(Icons.check),
      );
      defaultNoteBackgroundColor =
          noteColorsPalleteList[choosenColorIndex].circleColor;

      lastChoosenColorIndex = choosenColorIndex;
      print('choosen index : ${choosenColorIndex}');
      update();
    }
  }
}
