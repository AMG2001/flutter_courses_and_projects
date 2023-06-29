import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskly/task_model.dart';

class HomePageController extends GetxController {
  late Box<TaskModel> _tasksBox;
  String _key_tasks_box_name = 'tasks_box';

  List<TaskModel> tasksList = [];

  @override
  void onInit() async {
    Hive.registerAdapter(TaskModelAdapter());
    await Hive.openBox<TaskModel>(_key_tasks_box_name).then((value) async {
      _tasksBox = value;
      await getAllTasks();
    });
    super.onInit();
  }

  Future<void> addNewTask({required TaskModel taskModel}) async {
    try {
      tasksList.add(taskModel);
      await _tasksBox.add(taskModel);
      getAllTasks();
      Get.back();
      update();
    } catch (e) {
      print('''
\n\nerror while adding new Task !!

$e\n\n
''');
    }
  }

  Future<void> getAllTasks() async {
    tasksList.clear();
    _tasksBox.keys.forEach((key) {
      print('looped key : $key \n');
      tasksList.add(_tasksBox.getAt(key)!);
      print(tasksList[key].taskName);
    });
    update();
  }

  Future<void> changeTaskStatus(
      {required bool newStatus, required int index}) async {
    try {
      print('task status changed');
      tasksList.elementAt(index).isDone = newStatus;
      await _tasksBox.putAt(
          index,
          TaskModel(
              taskName: _tasksBox.get(index)!.taskName,
              taskDate: _tasksBox.get(index)!.taskDate,
              isDone: newStatus));
      update(['task_object']);
      print('task UI Updated');
    } catch (e) {
      print('''
\n\nerror while changing Task Status !!

$e\n\n
''');
    }
  }

  Widget TasksListIsEmpty() {
    return Center(
      child: Text("tasks List is Empty"),
    );
  }

  Widget TasksList() {
    return ListView.builder(
      itemCount: tasksList.length,
      itemBuilder: (context, index) {
        return GetBuilder<HomePageController>(
            id: 'task_object',
            builder: (task_controller) {
              return ListTile(
                onTap: () async {
                  await task_controller.changeTaskStatus(
                      newStatus: !task_controller.tasksList[index].isDone,
                      index: index);
                },
                title: Text(
                  task_controller.tasksList[index].taskName,
                  style: TextStyle(
                      decoration:
                          task_controller.tasksList[index].isDone == true
                              ? TextDecoration.lineThrough
                              : null),
                ),
                subtitle: Text(task_controller.tasksList[index].taskDate),
                trailing: Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.all<Color>(Colors.red),
                  value: task_controller.tasksList[index].isDone,
                  onChanged: (value) async {
                    await task_controller.changeTaskStatus(
                        newStatus: value!, index: index);
                  },
                ),
              );
            });
      },
    );
  }
}
