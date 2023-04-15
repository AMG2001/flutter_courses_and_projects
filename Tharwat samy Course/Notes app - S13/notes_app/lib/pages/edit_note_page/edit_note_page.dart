// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:notes_app/config/device_dimensions.dart';
// import 'package:notes_app/pages/edit_note_page/edit_note_controller.dart';
// import 'package:notes_app/pages/home_page/bottom_sheet_view/bottom_sheet_view.dart';
// import 'package:notes_app/pages/home_page/bottom_sheet_view/bottom_sheet_view_components/note_description_tf.dart';
// import 'package:notes_app/pages/home_page/bottom_sheet_view/bottom_sheet_view_components/note_title_tf.dart';
// import 'package:notes_app/pages/home_page/note_item/notes_controller.dart';

// class EditNotePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Edit Note"),
//       ),
//       body: SafeArea(
//         child: GetBuilder<NotesController>(
//             builder: (controller) {
//               return Form(
//                 key: controller.fomrKey,
//                 child: Container(
//                   width: DeviceDimensions.width,
//                   height: DeviceDimensions.height,
//                   child: Column(children: [
//                     SizedBox(
//                       height: 12,
//                     ),
//                     NoteTitleTextField(
//                         noteTitleTextEditingController:
//                             controller.noteTitleTextEditingController),
//                     SizedBox(
//                       height: 12,
//                     ),
//                     NoteDescriptionTextField(
//                         noteDescriptionTextEditingController:
//                             controller.noteDescriptionTextEditingController),
//                     SizedBox(
//                       height: 12,
//                     ),
//                     ElevatedButton(
//                       style: ButtonStyle(
//                         padding: MaterialStateProperty.all<EdgeInsets>(
//                           EdgeInsets.symmetric(vertical: 4, horizontal: 16),
//                         ),
//                         backgroundColor: MaterialStateProperty.all<Color>(
//                           Colors.white.withOpacity(0.1),
//                         ),
//                       ),
//                       onPressed: () {
//                         if (controller.fomrKey.currentState!.validate()) {
//                           notesController.updateNoteWithIndex(
//                               index: comingNoteIndex,
//                               noteTitle: controller
//                                   .noteTitleTextEditingController.text,
//                               noteDescription: controller
//                                   .noteDescriptionTextEditingController.text);
//                           Get.back();
//                         }
//                       },
//                       child: Text("Update Note"),
//                     ),
//                   ]),
//                 ),
//               );
//             }),
//       ),
//     );
//   }
// }
