import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/config/theme/application_theme.dart';
import 'package:notes_app/config/theme/application_theme_controller.dart';

final homePageAppBar = AppBar(
  title: Text(
    "Notes app",
    style: TextStyle(fontSize: 18),
  ),
  actions: [
    GetBuilder<ApplicationThemeController>(builder: (themeController) {
      return IconButton(
        onPressed: () async {
          await themeController.changeApplicationTheme(
              newValue: !themeController.isDark);
        },
        icon: themeController.isDark
            ? Icon(Icons.wb_sunny_outlined)
            : Icon(Icons.nightlight_outlined),
      );
    })
  ],
);
