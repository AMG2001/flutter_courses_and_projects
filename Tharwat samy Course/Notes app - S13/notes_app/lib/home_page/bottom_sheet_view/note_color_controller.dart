import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteColorController extends GetxController {
  List<ColorCircle> noteColorsPalleteList = [];

  Color noteBackgroundColor = Colors.red;

  NoteColorController() {
    noteColorsPalleteList = [
      ColorCircle(circleColor: Colors.red, index: 0),
      ColorCircle(circleColor: Colors.green, index: 1),
      ColorCircle(circleColor: Colors.yellow, index: 2),
      ColorCircle(circleColor: Colors.purple, index: 3),
      ColorCircle(circleColor: Colors.white, index: 4),
    ];
  }

  void selectColor(int choosenColorIndex) {
    // get circle color to add as background for note .
    noteBackgroundColor = noteColorsPalleteList[choosenColorIndex].circleColor;
    // reset all other circles shape to make only 1 circle with Check mark .
    for (int i = 0; i < noteColorsPalleteList.length; i++) {
      noteColorsPalleteList[i].w = SizedBox();
    }
    // Add check mark to circle .
    noteColorsPalleteList[choosenColorIndex].w = Container(
      child: Icon(
        Icons.check,
        color: Colors.black,
      ),
    );
    // update();
  }
}

final noteColorController = Get.put(NoteColorController());

class ColorCircle extends StatelessWidget {
  ColorCircle({required this.circleColor, required this.index});
  Color circleColor;
  int index;
  Widget w = SizedBox();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          child:
              CircleAvatar(radius: 14, backgroundColor: circleColor, child: w),
          onTap: () {
            noteColorController.selectColor(index);
          },
        ),
        SizedBox(
          width: 10,
        )
      ],
    );
  }
}
