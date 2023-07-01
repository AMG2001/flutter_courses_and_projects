import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskly/task_model.dart';

class HomePageController extends GetxController {
  late Box<TaskModel> tasksBox;
  late int lastKey;
  String _key_tasks_box_name = 'tasks_box';

  List<TaskModel> tasksList = [];

  @override
  void onInit() async {
    Hive.registerAdapter(TaskModelAdapter());
    await Hive.openBox<TaskModel>(_key_tasks_box_name).then((value) async {
      tasksBox = value;
      lastKey = tasksBox.keys.last ?? 0;
      await getAllTasks();
    });
    super.onInit();
  }

  Future<void> addNewTask({required TaskModel taskModel}) async {
    taskModel.setTaskKey = lastKey + 1;
    try {
      tasksList.add(taskModel);
      await tasksBox.add(taskModel).then((value) {
        taskModel.setTaskKey = value;
      });
      // getAllTasks();
      Get.back();
      update();
    } catch (e) {
      print('''
\n\nerror while adding new Task !!

$e\n\n
''');
    }
  }

  Future<void> deleteTaskAtIndex(
      {required int indexInList, required int keyInLocalStore}) async {
    tasksList.removeAt(indexInList);
    update();
    await tasksBox.delete(keyInLocalStore);
  }

  Future<void> getAllTasks() async {
    tasksBox.keys.forEach((key) {
      print('looped key : $key \n');
      tasksList.add(tasksBox.get(key)!);
    });
    update();
  }

  Future<void> changeTaskStatus(
      {required bool newStatus, required int index}) async {
    try {
      print('index : $index');
      print(
          ' tasksList.elementAt(index).isDone ${tasksList.elementAt(index).isDone}');
      tasksList.elementAt(index).isDone = newStatus;
      await tasksBox.putAt(
          index,
          TaskModel(
              taskName: tasksBox.get(index)!.taskName,
              taskDate: tasksBox.get(index)!.taskDate,
              isDone: newStatus,
              taskKey: tasksBox.get(index)!.taskKey));
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
              return GestureDetector(
                child: ListTile(
                  onLongPress: () {
                    // Do something here
                    showMenu(
                        context: context,
                        position: RelativeRect.fromLTRB(0, 0, 0, 0),
                        items: [
                          PopupMenuItem(
                            child: Text("Delete"),
                            onTap: () async {
                              await task_controller.deleteTaskAtIndex(
                                  indexInList: index,
                                  keyInLocalStore:
                                      task_controller.tasksList[index].taskKey);
                            },
                          ),
                          PopupMenuItem(
                            child: Text("Update"),
                            onTap: () async {
                              await task_controller.deleteTaskAtIndex(
                                  indexInList: index,
                                  keyInLocalStore:
                                      task_controller.tasksList[index].taskKey);
                            },
                          ),
                        ]);
                  },
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
                ),
              );
            });
      },
    );
  }
}
