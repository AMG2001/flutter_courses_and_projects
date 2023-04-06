import 'package:flutter/material.dart';
import 'package:notes_app/config/device_dimensions.dart';
import 'package:notes_app/home_page/home_page_components/home_page_app_bar.dart';
import 'package:notes_app/home_page/home_page_components/home_page_floating_action_button.dart';
import 'package:get/get.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:notes_app/home_page/note_item/notes_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: HomePageFloatingActionButton(),
      appBar: homePageAppBar,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: DeviceDimensions.width,
          height: DeviceDimensions.height,
          child: GetBuilder<NotesController>(
              init: NotesController(),
              builder: (controller) {
                if (controller.notesList.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.layers_clear_outlined,
                          size: 36,
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        Text(
                          "your notes list is empty",
                          style: TextStyle(fontSize: 22),
                        )
                      ],
                    ),
                  );
                } else
                  return ListView.builder(
                    itemCount: controller.notesList.length,
                    itemBuilder: (context, index) {
                      return SwipeActionCell(
                          leadingActions: [
                            SwipeAction(
                                widthSpace: DeviceDimensions.width * .23,
                                performsFirstActionWithFullSwipe: true,
                                title: "Archive",
                                onTap: (CompletionHandler handler) async {
                                  controller.deleteNote(index);
                                },
                                color: Colors.green),
                          ],
                          key: Key(controller.notesList[index].toString()),
                          trailingActions: <SwipeAction>[
                            SwipeAction(
                                widthSpace: DeviceDimensions.width * .2,
                                performsFirstActionWithFullSwipe: true,
                                title: "delete",
                                onTap: (CompletionHandler handler) async {
                                  controller.deleteNote(index);
                                },
                                color: Colors.red),
                          ],
                          child: controller.notesList[index]);
                    },
                  );
              }),
        ),
      ),
    );
  }
}
