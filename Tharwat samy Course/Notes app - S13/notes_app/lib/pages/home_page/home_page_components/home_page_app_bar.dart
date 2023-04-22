import 'package:animated_theme_switcher/animated_theme_switcher.dart';
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
      return ThemeSwitcher(
        builder: (context) {
          return IconButton(
            onPressed: () async {
              ThemeSwitcher.of(context).changeTheme(
                  theme: await themeController.changeApplicationTheme(
                      newValue: !themeController.isDark));
            },
            icon: themeController.isDark
                ? Icon(Icons.wb_sunny_outlined)
                : Icon(Icons.nightlight_outlined),
          );
        },
      );
    })
  ],
);
