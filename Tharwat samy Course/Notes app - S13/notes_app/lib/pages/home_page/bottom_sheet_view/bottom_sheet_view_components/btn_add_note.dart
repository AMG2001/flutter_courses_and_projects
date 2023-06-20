import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controllers/notes_controller.dart';
import 'package:notes_app/pages/home_page/bottom_sheet_view/bottom_sheet_view.dart';

class AddNoteButton extends StatelessWidget {
  String noteTitle;
  String noteDescription;
  String noteDate;
  GlobalKey<FormState> formKey;
  AddNoteButton(
      {required this.formKey,
      required this.noteTitle,
      required this.noteDescription,
      required this.noteDate});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotesController>(builder: (notesController) {
      return ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            const Color(0xffe36414),
          ),
        ),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            print('Note title : ${noteTitle}');
            print('Note Description : ${noteDescription}');
            print('Note Date : ${noteDate}');
            notesController.addNewNote(
                noteTitle: noteTitle,
                noteDescription: noteDescription,
                noteDate: noteDate,
                noteBackgroundColor:
                    notesController.defaultNoteBackgroundColor);
            Get.back();
          }
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              "Add Note",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              width: 8,
            ),
            Icon(Icons.add_circle_outline)
          ],
        ),
      );
    });
  }
}
