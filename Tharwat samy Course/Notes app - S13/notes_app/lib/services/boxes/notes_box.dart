import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/pages/home_page/note_item/note_item.dart';

class NotesBox {
  late Box box_notes;
  String _key_boxName = "notes_box";
  String _key_noteTitle = 'note_title';
  String _key_noteDescription = "note_description";
  String _key_id = 'note_id';
  String _key_color_value = 'note_color_value';
  String _key_note_date_and_time = 'note_time';

  NotesBox._privateConstructor();

  static final NotesBox _instance = NotesBox._privateConstructor();

  static NotesBox get instance => _instance;

  Future<void> initNotesBox() async {
    await Hive.initFlutter();

    box_notes = await Hive.openBox(_key_boxName);
  }

  Future<void> addNewNote(
      {required String noteTitle,
      required String noteDescription,
      required String note_date_and_time,
      required int note_color_value}) async {
    Map<String, dynamic> note_in_map = {
      _key_note_date_and_time: note_date_and_time,
      _key_noteTitle: noteTitle,
      _key_noteDescription: noteDescription,
      _key_color_value: note_color_value
    };
    try {
      await box_notes.add(note_in_map);
    } catch (e) {
      print('error while adding note in NotesBox File , addNote method');
    }
  }

  List<NoteItem> getAllNotesList() {
    final list_of_notes_items = box_notes.keys.map((key) {
      Map<dynamic, dynamic> item = box_notes.get(key);
      return NoteItem(
          note_id: key,
          noteTitle: item[_key_noteTitle],
          noteDescription: item[_key_noteDescription],
          noteBackgroundColor: Color(item[_key_color_value]),
          noteDate: item[_key_note_date_and_time]);
    }).toList();
    return list_of_notes_items;
  }
}
