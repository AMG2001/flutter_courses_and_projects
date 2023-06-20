import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controllers/notes_controller.dart';

class UpdateNoteButton extends StatelessWidget {
  GlobalKey<FormState> formKey;
  NotesController notesController;
  int editNoteIndex;
  String noteTitle;
  String noteDescription;
  String noteDate;
  UpdateNoteButton(
      {required this.formKey,
      required this.notesController,
      required this.editNoteIndex,
      required this.noteTitle,
      required this.noteDescription,
      required this.noteDate});

  @override
  Widget build(BuildContext context) {
    print('edited note Title : $noteTitle');
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        ),
      ),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          notesController.updateNoteAtIndex(
              index: editNoteIndex,
              noteTitle: noteTitle,
              noteDescription: noteDescription,
              noteDate: noteDate);
          Get.back();
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text(
            "Update Note",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: 8,
          ),
          Icon(Icons.mode_edit_outline_outlined)
        ],
      ),
    );
  }
}
