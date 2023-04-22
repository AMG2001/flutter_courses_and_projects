import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/config/theme/application_theme_controller.dart';
import 'package:notes_app/controllers/notes_controller.dart';
import 'package:notes_app/pages/home_page/home_page.dart';
import 'package:notes_app/config/db/application_boxes.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';

void main() async {
  ApplicationBoxes.instance.initAllApplicationBoxes().then((value) {
    runApp(NotesApp());
  });
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(NotesController(), permanent: true);
    return GetBuilder<ApplicationThemeController>(
        init: ApplicationThemeController.instance,
        builder: (themeController) {
          return ThemeProvider(
            duration: Duration(seconds: 1),
            initTheme: themeController.currentTheme,
            builder: (context, theme) {
              return GetMaterialApp(
                theme: theme,
                home: HomePage(),
                debugShowCheckedModeBanner: false,
                title: 'Notes app',
              );
            },
          );
        });
  }
}
