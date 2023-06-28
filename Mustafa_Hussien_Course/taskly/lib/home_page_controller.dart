import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskly/task_model.dart';

class HomePageController extends GetxController {
  late Box<TaskModel> _tasksBox;
  String _key_tasks_box_name = 'tasks_box';

  List<TaskModel> tasksList = [];

  Future<void> addNewTask({required TaskModel taskModel}) async {
    await _tasksBox.put(_key_tasks_box_name, taskModel);
    update();
  }

  Future<void> getAllTasks() async {
    _tasksBox.keys.forEach((key) {
      tasksList.add(_tasksBox.get(key)!);
    });
    update();
  }

  void changeTaskStatus({required bool newStatus, required int index}) {
    _tasksBox.putAt(
        index,
        TaskModel(
            taskName: _tasksBox.get(index)!.taskName,
            taskDate: _tasksBox.get(index)!.taskDate,
            isDone: newStatus));
    Get.back();
    update();
  }

  @override
  void onInit() async {
    _tasksBox = await Hive.openBox<TaskModel>(_key_tasks_box_name);
    await getAllTasks().then((value) {
      print('\n\n\nController init ✅\n\n\n');
    });
    super.onInit();
  }
}
