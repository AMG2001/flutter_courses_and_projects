import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/home_page/bottom_sheet_view/bottom_sheet_view.dart';
import 'package:notes_app/home_page/bottom_sheet_view/note_color_controller.dart';

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
    return GetBuilder<NoteColorController>(builder: (controller) {
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
            notesController.addNote(
                title: noteTitleTextEditingController.text,
                description: noteDescriptionTextEditingController.text,
                backgroundColor: controller.defaultNoteBackgroundColor);
            Get.back();
          }
        },
        child: Text("Add Note"),
      );
    });
  }
}
