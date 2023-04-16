import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/config/device_dimensions.dart';
import 'package:notes_app/pages/home_page/bottom_sheet_view/bottom_sheet_view.dart';
import 'package:notes_app/pages/home_page/bottom_sheet_view/bottom_sheet_view_components/note_description_tf.dart';
import 'package:notes_app/pages/home_page/bottom_sheet_view/bottom_sheet_view_components/note_title_tf.dart';
import 'package:notes_app/controllers/notes_controller.dart';

class EditNotePage extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController tec_noteTitle = TextEditingController();
  TextEditingController tec_noteDescription = TextEditingController();
  late int editNoteIndex;
  EditNotePage({required this.editNoteIndex});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Note"),
      ),
      body: SafeArea(
        child: GetBuilder<NotesController>(builder: (notesController) {
          tec_noteTitle.text =
              notesController.list_notes[editNoteIndex].noteTitle;
          tec_noteDescription.text =
              notesController.list_notes[editNoteIndex].noteDescription;
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: formKey,
              child: Container(
                width: DeviceDimensions.width,
                height: DeviceDimensions.height,
                child: Column(children: [
                  SizedBox(
                    height: 12,
                  ),
                  NoteTitleTextField(
                      noteTitleTextEditingController: tec_noteTitle),
                  SizedBox(
                    height: 12,
                  ),
                  NoteDescriptionTextField(
                      noteDescriptionTextEditingController:
                          tec_noteDescription),
                  SizedBox(
                    height: 12,
                  ),
                  ElevatedButton(
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
                        notesController.updateNoteAtIndex(
                            index: editNoteIndex,
                            noteTitle: tec_noteTitle.text,
                            noteDescription: tec_noteDescription.text);
                        Get.back();
                      }
                    },
                    child: Text("Update Note"),
                  ),
                ]),
              ),
            ),
          );
        }),
      ),
    );
  }
}
