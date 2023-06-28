import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskly/home_page_controller.dart';
import 'package:taskly/task_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
          init: HomePageController(),
          builder: (controller) {
            return controller.tasksList.isEmpty
                ? Center(
                    child: Text("tasks List is Empty"),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) {
                      ListTile(
                        title: Text(controller.tasksList[index].taskName),
                        subtitle: Text(controller.tasksList[index].taskDate),
                        trailing: Checkbox(
                          value: controller.tasksList[index].isDone,
                          onChanged: (value) {
                            controller.changeTaskStatus(
                                newStatus: value!, index: index);
                          },
                        ),
                      );
                    },
                  );
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
              onSubmitted: (value) {
                controller.addNewTask(
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
