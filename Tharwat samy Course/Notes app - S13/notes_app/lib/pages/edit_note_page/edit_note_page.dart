import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/config/device_dimensions.dart';
import 'package:notes_app/pages/edit_note_page/edit_page_components/update_note_button.dart';
import 'package:notes_app/pages/home_page/bottom_sheet_view/bottom_sheet_view_components/date_time_tf.dart';
import 'package:notes_app/pages/home_page/bottom_sheet_view/bottom_sheet_view_components/note_description_tf.dart';
import 'package:notes_app/pages/home_page/bottom_sheet_view/bottom_sheet_view_components/note_title_tf.dart';
import 'package:notes_app/controllers/notes_controller.dart';

class EditNotePage extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  NoteTitleTextField noteTitleTextField = NoteTitleTextField();
  
  NoteDescriptionTextField noteDescriptionTextField =
      NoteDescriptionTextField();

        NoteDateTextField noteDateTextField = NoteDateTextField();

  late int editNoteIndex;

  Widget space = const SizedBox(
    height: 12,
  );
  EditNotePage({required this.editNoteIndex});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Note"),
      ),
      body: SafeArea(
        child: GetBuilder<NotesController>(builder: (notesController) {
          noteTitleTextField.setNoteTitle(
              text: notesController.list_notes[editNoteIndex].noteTitle);
          noteDescriptionTextField.set_noteDescriptionText(
              text: notesController.list_notes[editNoteIndex].noteDescription);
          noteDateTextField.setText(
              text: notesController.list_notes[editNoteIndex].noteDate);
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: formKey,
              child: Container(
                width: DeviceDimensions.width,
                height: DeviceDimensions.height,
                child: Column(children: [
                  space,
                  noteTitleTextField,
                  space,
                  noteDescriptionTextField,
                  space,
                  noteDateTextField,
                  space,
                  UpdateNoteButton(
                    formKey: formKey,
                    editNoteIndex: editNoteIndex,
                    notesController: notesController,
                    noteTitle: noteTitleTextField.get_noteTitleText,
                    noteDescription:
                        noteDescriptionTextField.get_noteDescriptionText,
                    noteDate: noteDateTextField.getChoosenDateInString,
                  )
                ]),
              ),
            ),
          );
        }),
      ),
    );
  }
}
