import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

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

  List<Map<String, dynamic>> getAllNotesList() {
    final data = box_notes.keys.map((key) {
      Map<String, dynamic> item = box_notes.get(key);
      return {
        _key_id: key,
        _key_noteTitle: item[_key_noteTitle],
        _key_note_date_and_time:item[_key_note_date_and_time],
        _key_noteDescription: item[_key_noteDescription],
        _key_color_value: item[_key_color_value]
      };
    }).toList();
    print(data);
    return data;
  }
}
