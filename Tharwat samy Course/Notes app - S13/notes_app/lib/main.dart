import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/pages/home_page/home_page.dart';
import 'package:notes_app/services/boxes/notes_box.dart';

void main() async {
  // initialize Hive and open Notes Box .
  await NotesBox.instance.initNotesBox();
  runApp(NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      title: 'Notes app',
    );
  }
}
