import 'package:flutter/material.dart';
import 'package:notes_app/config/device_dimensions.dart';
import 'package:notes_app/controllers/note_controller.dart';
import 'package:notes_app/pages/home_page/bottom_sheet_view/bottom_sheet_view_components/btn_add_note.dart';
import 'package:notes_app/pages/home_page/bottom_sheet_view/bottom_sheet_view_components/grey_header_container.dart';
import 'package:notes_app/pages/home_page/bottom_sheet_view/bottom_sheet_view_components/note_description_tf.dart';
import 'package:notes_app/pages/home_page/bottom_sheet_view/bottom_sheet_view_components/note_title_tf.dart';
import 'package:notes_app/pages/home_page/note_item/note_item.dart';
import 'package:get/get.dart';

void BottomSheetView(
    {required BuildContext context,
    required GlobalKey<FormState> formKey,
    required TextEditingController noteTitleTextEditingController,
    required TextEditingController noteDescriptionTextEditingController}) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return FittedBox(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              padding: EdgeInsets.all(24),
              width: DeviceDimensions.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
              ),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    GreyHeaderContainer(),
                    NoteTitleTextField(
                        noteTitleTextEditingController:
                            noteTitleTextEditingController),
                    SizedBox(
                      height: 24,
                    ),
                    NoteDescriptionTextField(
                        noteDescriptionTextEditingController:
                            noteDescriptionTextEditingController),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Text("choose note color : "),
                        SizedBox(
                          width: 14,
                        ),
                        GetBuilder<NotesController>(
                            init: NotesController(),
                            builder: (notesController) {
                              return SingleChildScrollView(
                                child: Row(
                                    children:
                                        notesController.noteColorsPalleteList),
                              );
                            }),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    AddNoteButton(
                      formKey: formKey,
                      noteTitleTextEditingController:
                          noteTitleTextEditingController,
                      noteDescriptionTextEditingController:
                          noteDescriptionTextEditingController,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
