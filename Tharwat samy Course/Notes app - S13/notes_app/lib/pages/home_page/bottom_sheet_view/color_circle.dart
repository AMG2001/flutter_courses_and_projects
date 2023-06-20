import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controllers/notes_controller.dart';
import 'package:notes_app/pages/home_page/bottom_sheet_view/bottom_sheet_view.dart';

class ColorCircle extends StatefulWidget {
  ColorCircle({required this.circleColor, required this.index});
  Color circleColor;
  int index;
  bool isSelected = false;
  Widget w = SizedBox();
  @override
  State<ColorCircle> createState() => _ColorCircleState();
}

class _ColorCircleState extends State<ColorCircle> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotesController>(builder: (controller) {
      return Row(
        children: [
          GestureDetector(
            child: CircleAvatar(
                radius: 14,
                backgroundColor: widget.circleColor,
                child: widget.w),
            onTap: () {
              setState(() {
                controller.selectColor(choosenColorIndex: widget.index);
              });
            },
          ),
          const SizedBox(
            width: 10,
          )
        ],
      );
    });
  }
}
