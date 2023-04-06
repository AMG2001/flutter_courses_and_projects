import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/home_page/note_item/note_item.dart';

class NotesController extends GetxController {
  List<NoteItem> notesList = [];

  void addNote(
      {required String title,
      required String description,
      required Color backgroundColor}) {
    notesList.add(NoteItem(
        noteTitle: title,
        noteDescription: description,
        noteBackgroundColor: backgroundColor,
        noteDate: DateFormat.yMMMd().format(DateTime.now())));
    update();
  }

  void deleteNote(int index) {
    notesList.removeAt(index);
    update();
  }
}
