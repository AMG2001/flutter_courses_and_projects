import 'package:flutter/material.dart';
import 'package:notes_app/config/device_dimensions.dart';
import 'package:notes_app/home_page/bottom_sheet_view/note_color_controller.dart';
import 'package:notes_app/home_page/note_item/note_item.dart';
import 'package:get/get.dart';
import 'package:notes_app/home_page/note_item/notes_controller.dart';

final notesController = Get.put(NotesController(), permanent: true);
final noteColorController = Get.put(NoteColorController());
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
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      margin: EdgeInsets.only(top: 16, bottom: 32),
                      width: DeviceDimensions.width * .2,
                      height: 6,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty || value == '') {
                          return 'you can\'t leave this field empty';
                        }
                      },
                      controller: noteTitleTextEditingController,
                      decoration: InputDecoration(
                        labelText: 'Note Title',
                        hintText: 'Enter your note title',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty || value == '') {
                          return 'you can\'t leave this field empty';
                        }
                      },
                      controller: noteDescriptionTextEditingController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText: 'Note Description',
                        hintText: 'Enter your note description',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    // Row(
                    //   children: [
                    //     Text("choose note color : "),
                    //     SizedBox(
                    //       width: 14,
                    //     ),
                    //     GetBuilder<NoteColorController>(
                    //         init: NoteColorController(),
                    //         builder: (controller) {
                    //           return SingleChildScrollView(
                    //             child: Row(
                    //                 children: controller.noteColorsPalleteList),
                    //           );
                    //         }),
                    //   ],
                    // ),
                    SizedBox(
                      height: 24,
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
                          notesController.addNote(
                              title: noteTitleTextEditingController.text,
                              description:
                                  noteDescriptionTextEditingController.text,
                              backgroundColor:
                                  noteColorController.noteBackgroundColor);
                          Get.back();
                        }
                      },
                      child: Text("Add Note"),
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
