import 'package:flutter/material.dart';
import 'package:notes_app/config/device_dimensions.dart';
import 'package:notes_app/home_page/note_item/note_item_components/delete_note_button.dart';

class NoteItem extends StatelessWidget {
  String noteTitle;
  String noteDescription;
  String noteDate;
  Color? noteBackgroundColor;
  NoteItem(
      {required this.noteTitle,
      required this.noteDescription,
      required this.noteBackgroundColor,
      required this.noteDate});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: DeviceDimensions.width,
          height: DeviceDimensions.height * .25,
          padding: EdgeInsets.all(32),
          decoration: BoxDecoration(
              color: noteBackgroundColor,
              borderRadius: BorderRadius.circular(16)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    noteTitle,
                    style: TextStyle(fontSize: 24),
                  ),
                 DeleteNoteButton()
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: DeviceDimensions.width * .5,
                    child: Text(
                      noteDescription,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Text(
                    noteDate,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 24,
        )
      ],
    );
  }
}
