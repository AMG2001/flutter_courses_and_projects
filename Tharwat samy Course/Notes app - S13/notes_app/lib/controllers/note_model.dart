import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel {
  @HiveField(0)
  late String noteTitle;
  @HiveField(1)
  late String noteDescription;
  @HiveField(2)
  late String noteDate;
  @HiveField(3)
  late Color noteBackgroundColor;
}
