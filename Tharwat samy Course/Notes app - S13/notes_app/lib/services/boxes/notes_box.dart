import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/controllers/note_model.dart';

class NotesBox {
  late Box notesBox;

  String _key_boxName = "notes_box";

  NotesBox._privateConstructor();

  static final NotesBox _instance = NotesBox._privateConstructor();

  static NotesBox get instance => _instance;

  Future<void> initNotesBox() async {
    await Hive.initFlutter();
    Hive.registerAdapter(NoteModelAdapter());
    notesBox = await Hive.openBox(_key_boxName);
  }
}
