import 'package:flutter/material.dart';
import 'package:notes_app/config/device_dimensions.dart';
import 'package:notes_app/config/theme/application_theme_controller.dart';
import 'package:notes_app/controllers/notes_controller.dart';
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
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(18),
        topRight: Radius.circular(18),
      ),
    ),
    isScrollControlled: true,
    backgroundColor: ApplicationThemeController.instance.isDark
        ? Colors.black
        : Colors.white,
    barrierColor: Colors.black.withOpacity(.5),
    context: context,
    builder: (context) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          padding: EdgeInsets.all(24),
          child: SingleChildScrollView(
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
                      Text(
                        "choose note color : ",
                        style: TextStyle(
                            color: ApplicationThemeController.instance.isDark
                                ? Colors.white
                                : Colors.black),
                      ),
                      SizedBox(
                        width: 14,
                      ),
                      GetBuilder<NotesController>(
                          init: NotesController(),
                          builder: (notesController) {
                            return Container(
                              height: 25,
                              width: DeviceDimensions.width * .5,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: notesController
                                    .noteColorsPalleteList.length,
                                itemBuilder: (context, index) {
                                  return notesController
                                      .noteColorsPalleteList[index];
                                },
                                scrollDirection: Axis.horizontal,
                              ),
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
      );
    },
  );
}
