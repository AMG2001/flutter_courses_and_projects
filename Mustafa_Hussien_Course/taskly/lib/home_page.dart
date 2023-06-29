import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskly/home_page_controller.dart';
import 'package:taskly/task_model.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  late Checkbox checkbox;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Taskly"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showTaskDialog(context: context);
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        child: GetBuilder<HomePageController>(
          builder: (controller) {
            return controller.tasksList.isEmpty
                ? controller.TasksListIsEmpty()
                : controller.TasksList();
          },
        ),
      ),
    );
  }

  void _showTaskDialog({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController tec_controller = TextEditingController();
        return GetBuilder<HomePageController>(builder: (controller) {
          return AlertDialog(
            title: Text("Task"),
            content: TextField(
              controller: tec_controller,
              onSubmitted: (value) async {
                await controller.addNewTask(
                  taskModel: TaskModel(
                      taskName: value,
                      taskDate: DateTime.now().toIso8601String(),
                      isDone: false),
                );
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          );
        });
      },
    );
  }
}
