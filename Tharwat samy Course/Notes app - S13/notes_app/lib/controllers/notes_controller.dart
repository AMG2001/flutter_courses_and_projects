import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/pages/edit_note_page/edit_note_page.dart';
import 'package:notes_app/pages/home_page/bottom_sheet_view/color_circle.dart';
import 'package:notes_app/pages/home_page/note_item/note_item.dart';
import 'package:notes_app/services/boxes/notes_box.dart';

class NotesController extends GetxController {
  late int defaultChoosenColorIndex = 0;
  late int lastChoosenColorIndex;
  late Color defaultNoteBackgroundColor;

  List<NoteItem> list_notes = [];

  late Color noteColor;

  List<ColorCircle> noteColorsPalleteList = [
    ColorCircle(circleColor: Color(0xFF231942), index: 0),
    ColorCircle(circleColor: Color(0xFF5e548e), index: 1),
    ColorCircle(circleColor: Color(0xFF9f86c0), index: 2),
    ColorCircle(circleColor: Color(0xFFbe95c4), index: 3),
    ColorCircle(circleColor: Color(0xFFe0b1cb), index: 4),
  ];

  NotesController() {
    defaultChoosenColorIndex = noteColorsPalleteList[0].index;
    defaultNoteBackgroundColor = noteColorsPalleteList[0].circleColor;
    lastChoosenColorIndex = noteColorsPalleteList[0].index;

    noteColorsPalleteList[0].w = Container(
      child: Icon(Icons.check),
    );
  }

  void updateNoteAtIndex(
      {required int index,
      required String noteTitle,
      required String noteDescription}) {
    list_notes[index] = NoteItem(
        noteTitle: noteTitle,
        noteDescription: noteDescription,
        noteBackgroundColor: list_notes[index].noteBackgroundColor,
        noteDate: list_notes[index].noteDate);
    update();
  }

  void selectColor({required int choosenColorIndex}) {
    if (choosenColorIndex == lastChoosenColorIndex)
      return;
    else {
      noteColorsPalleteList[lastChoosenColorIndex].w = SizedBox();
      noteColorsPalleteList[choosenColorIndex].w = Container(
        child: Icon(Icons.check),
      );
      defaultNoteBackgroundColor =
          noteColorsPalleteList[choosenColorIndex].circleColor;
      lastChoosenColorIndex = choosenColorIndex;
      print('choosen index : ${choosenColorIndex}');
      update();
    }
  }

  void moveToEditPageWithIndex({required int editNoteInIndex}) {
    Get.to(() => EditNotePage(editNoteIndex: editNoteInIndex));
  }

  void addNewNote(
      {required String noteTitle,
      required String noteDescription,
      required Color noteBackgroundColor}) {
    list_notes.add(
      NoteItem(
        noteTitle: noteTitle,
        noteDescription: noteDescription,
        noteBackgroundColor: noteBackgroundColor,
        noteDate: DateFormat.MMMEd().format(
          DateTime.now(),
        ),
      ),
    );

    NotesBox.instance.addNewNote(
      noteTitle: noteTitle,
      noteDescription: noteDescription,
      note_color_value: noteBackgroundColor.value,
      note_date_and_time: DateFormat.MMMEd().format(DateTime.now()),
    );
    NotesBox.instance.getAllNotesList();
    update();
  }

  void deleteNote({required int note_index}) {
    list_notes.removeAt(note_index);
    update();
  }
}
