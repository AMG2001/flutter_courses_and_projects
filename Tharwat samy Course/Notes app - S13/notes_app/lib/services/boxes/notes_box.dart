import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/controllers/note_model.dart';

class NotesBox {
  late Box box_notes;

  String _key_boxName = "notes_box";

  NotesBox._privateConstructor();

  static final NotesBox _instance = NotesBox._privateConstructor();

  static NotesBox get instance => _instance;

  Future<void> initNotesBox() async {
    await Hive.initFlutter();
    Hive.registerAdapter(NoteModelAdapter());
    box_notes = await Hive.openBox<NoteModel>(_key_boxName);
  }

  Future<void> addNote({required NoteModel noteModel}) async {
    try {
      await box_notes.add(noteModel);
    } catch (e) {
      print('error while adding note in NotesBox File , addNote method');
    }
  }
}
