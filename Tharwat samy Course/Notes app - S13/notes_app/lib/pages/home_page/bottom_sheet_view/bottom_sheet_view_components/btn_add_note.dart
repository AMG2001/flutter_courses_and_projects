import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controllers/notes_controller.dart';
import 'package:notes_app/pages/home_page/bottom_sheet_view/bottom_sheet_view.dart';

class AddNoteButton extends StatelessWidget {
  TextEditingController noteTitleTextEditingController;
  TextEditingController noteDescriptionTextEditingController;
  GlobalKey<FormState> formKey;
  AddNoteButton(
      {required this.formKey,
      required this.noteTitleTextEditingController,
      required this.noteDescriptionTextEditingController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotesController>(builder: (notesController) {
      return ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            Colors.white.withOpacity(0.1),
          ),
        ),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            notesController.addNewNote(
                noteTitle: noteTitleTextEditingController.text,
                noteDescription: noteDescriptionTextEditingController.text,
                noteBackgroundColor:
                    notesController.defaultNoteBackgroundColor);
            Get.back();
          }
        },
        child: Text("Add Note"),
      );
    });
  }
}
