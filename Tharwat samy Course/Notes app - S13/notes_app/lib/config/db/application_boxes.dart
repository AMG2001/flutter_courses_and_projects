import 'package:notes_app/config/db/notes_box.dart';
import 'package:notes_app/config/theme/application_theme_controller.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ApplicationBoxes {
  ApplicationBoxes._privateConstructor();

  static final ApplicationBoxes _instance =
      ApplicationBoxes._privateConstructor();

  static ApplicationBoxes get instance => _instance;

  Future<void> initAllApplicationBoxes() async {
    await Hive.initFlutter();

    await ApplicationThemeController.instance.initApplicationThemeBox();
    // initialize Hive and open Notes Box .
    await NotesBox.instance.initNotesBox();
  }
}
