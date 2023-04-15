import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/config/device_dimensions.dart';
import 'package:notes_app/pages/home_page/home_page.dart';
void main() {
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
