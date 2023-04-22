import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/config/theme/application_theme_controller.dart';
import 'package:notes_app/pages/home_page/home_page.dart';
import 'package:notes_app/config/db/application_boxes.dart';

void main() async {
  ApplicationBoxes.instance.initAllApplicationBoxes().then((value) {
    runApp(NotesApp());
  });
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApplicationThemeController>(
        init: ApplicationThemeController.instance,
        builder: (themeController) {
          return GetMaterialApp(
            theme: themeController.currentTheme,
            home: HomePage(),
            debugShowCheckedModeBanner: false,
            title: 'Notes app',
          );
        });
  }
}
