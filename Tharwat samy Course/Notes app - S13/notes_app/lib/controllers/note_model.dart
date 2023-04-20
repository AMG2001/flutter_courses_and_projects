import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NoteDataModel {
  late String note_title;

  late String note_description;

  late String note_date;

  late Color note_color;

  late int note_color_value;

  late int note_id;

  NoteDataModel(
      {required this.note_id,
      required this.note_title,
      required this.note_description,
      required this.note_date,
      required this.note_color,
      required this.note_color_value});

}
