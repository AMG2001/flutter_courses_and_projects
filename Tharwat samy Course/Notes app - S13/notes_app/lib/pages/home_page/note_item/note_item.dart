import 'package:flutter/material.dart';
import 'package:notes_app/config/device_dimensions.dart';

class NoteItem extends StatelessWidget {
  String noteTitle;
  String noteDescription;
  String noteDate;
  Color? noteBackgroundColor;
  late int note_id;

  NoteItem(
      {required this.note_id,
      required this.noteTitle,
      required this.noteDescription,
      required this.noteBackgroundColor,
      required this.noteDate});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 18),
          width: DeviceDimensions.width,
          height: DeviceDimensions.height * .22,
          padding: EdgeInsets.all(32),
          decoration: BoxDecoration(
              color: noteBackgroundColor,
              borderRadius: BorderRadius.circular(16)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.turned_in_not),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        noteTitle,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Container(
                    width: DeviceDimensions.width * .7,
                    child: Text(
                      noteDescription,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        size: 24,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        noteDate,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          top: DeviceDimensions.height * .05,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.swipe_right),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "Done",
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
            height: 60,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12)),
              color: Colors.green.withOpacity(.5),
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: DeviceDimensions.height * .125,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.swipe_left),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "Edit",
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
            height: 60,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12)),
              color: Colors.red.withOpacity(.5),
            ),
          ),
        ),
      ],
    );
  }
}
