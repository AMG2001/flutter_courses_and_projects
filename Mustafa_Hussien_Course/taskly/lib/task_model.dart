import 'package:hive_flutter/hive_flutter.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  late String taskName;
  @HiveField(1)
  late String taskDate;
  @HiveField(2)
  late bool isDone;

  TaskModel(
      {required this.taskName, required this.taskDate, required this.isDone});
}
