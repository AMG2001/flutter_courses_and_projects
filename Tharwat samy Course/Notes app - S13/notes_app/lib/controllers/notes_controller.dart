import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/pages/edit_note_page/edit_note_page.dart';
import 'package:notes_app/pages/home_page/bottom_sheet_view/color_circle.dart';
import 'package:notes_app/pages/home_page/note_item/note_item.dart';
import 'package:notes_app/config/db/notes_box.dart';

class NotesController extends GetxController {
  late int defaultChoosenColorIndex = 0;
  late int lastChoosenColorIndex;
  late Color defaultNoteBackgroundColor;

  List<NoteItem> list_notes = [];

  late Color noteColor;

  List<ColorCircle> noteColorsPalleteList = [
    ColorCircle(circleColor: Color(0xFF231942), index: 0),
    ColorCircle(circleColor: Color(0xFF5e548e), index: 1),
    ColorCircle(circleColor: Color(0xFF5f0f40), index: 2),
    ColorCircle(circleColor: Color(0xFF192a51), index: 3),
    ColorCircle(circleColor: Color(0xFFfca311), index: 4),
    ColorCircle(circleColor: Color(0xFF19376D), index: 5),
    ColorCircle(circleColor: Color(0xFF576CBC), index: 6),
    ColorCircle(circleColor: Color(0xFF917FB3), index: 7),
    ColorCircle(circleColor: Color(0xFF569DAA), index: 8),
    ColorCircle(circleColor: Color(0xFF263A29), index: 9),
    ColorCircle(circleColor: Color(0xFF210062), index: 10),
    ColorCircle(circleColor: Color(0xFF6D5D6E), index: 11),
  ];

  NotesController() {
    list_notes = NotesBox.instance.getAllNotesList();
    defaultChoosenColorIndex = noteColorsPalleteList[0].index;
    defaultNoteBackgroundColor = noteColorsPalleteList[0].circleColor;
    lastChoosenColorIndex = noteColorsPalleteList[0].index;

    noteColorsPalleteList[0].w = Container(
      child: Icon(Icons.check),
    );
    update();
  }

  void updateNoteAtIndex(
      {required int index,
      required String noteTitle,
      required String noteDescription,
      required String noteDate}) {
    NotesBox.instance.updateNoteAtIndex(
        note_id: index,
        noteTitle: noteTitle,
        noteDescription: noteDescription,
        note_date: noteDate,
        note_color_value: list_notes[index].noteBackgroundColor!.value);
    list_notes = NotesBox.instance.getAllNotesList();
    update();
  }

  void selectColor({required int choosenColorIndex}) {
    if (choosenColorIndex == lastChoosenColorIndex)
      return;
    else {
      noteColorsPalleteList[lastChoosenColorIndex].w = SizedBox();
      noteColorsPalleteList[choosenColorIndex].w = Container(
        child: Icon(
          Icons.check,
          color: Colors.white,
        ),
      );
      defaultNoteBackgroundColor =
          noteColorsPalleteList[choosenColorIndex].circleColor;
      lastChoosenColorIndex = choosenColorIndex;
      print('choosen index : ${choosenColorIndex}');
      update();
    }
  }

  void moveToEditPageWithIndex({required int editNoteInIndex}) {
    Get.to(() => EditNotePage(editNoteIndex: editNoteInIndex),
        curve: Curves.easeInOutCubic,
        duration: Duration(milliseconds: 500),
        transition: Transition.rightToLeft);
  }

  void addNewNote(
      {required String noteTitle,
      required String noteDescription,
      required String noteDate,
      required Color noteBackgroundColor}) async {
    await NotesBox.instance.addNewNote(
      noteTitle: noteTitle,
      noteDescription: noteDescription,
      note_color_value: noteBackgroundColor.value,
      noteDate: noteDate,
    );
    list_notes = NotesBox.instance.getAllNotesList();
    update();
  }

  void deleteNote({required int note_index}) {
    NotesBox.instance.deleteNote(note_id: note_index);
    list_notes = NotesBox.instance.getAllNotesList();
    update();
  }
}
