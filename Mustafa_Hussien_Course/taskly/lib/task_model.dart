import 'package:hive_flutter/hive_flutter.dart';

part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel {
  @HiveField(1)
  late String taskName;
  @HiveField(2)
  late String taskDate;
  @HiveField(3)
  late bool isDone;
  
  TaskModel(
      {required this.taskName, required this.taskDate, required this.isDone});
}
