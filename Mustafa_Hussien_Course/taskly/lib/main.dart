import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskly/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  runApp(Taskly());
}

class Taskly extends StatelessWidget {
  const Taskly({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.red,
        primaryColorLight: Colors.red,
        appBarTheme: AppBarTheme(backgroundColor: Colors.red),
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: Colors.red),
      ),
      title: 'Taskly',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
