import 'package:flutter/material.dart';
import 'package:notes_app/config/device_dimensions.dart';
import 'package:notes_app/controllers/notes_controller.dart';
import 'package:notes_app/pages/home_page/home_page_components/home_page_app_bar.dart';
import 'package:notes_app/pages/home_page/home_page_components/home_page_floating_action_button.dart';
import 'package:get/get.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:notes_app/services/audio_player_controller.dart';

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
              builder: (notesController) {
                // if there is no Notes , show no notes message .
                if (notesController.list_notes.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
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
                // else , this mean there is Notes Stored , start to show it .
                  return ListView.builder(
                    itemCount: notesController.list_notes.length,
                    itemBuilder: (context, index) {
                      /**
                       * Create Swip Cell "Note" with 2 Actions 
                       * 1.
                       */
                      return SwipeActionCell(
                          closeWhenScrolling: true,
                          leadingActions: [
                            SwipeAction(
                                widthSpace: DeviceDimensions.width * .23,
                                title: "Done",
                                onTap: (CompletionHandler handler) async {
                                  AudioPlayerController.instance
                                      .playSuccessSound();
                                  notesController.deleteNote(note_index: index);
                                },
                                color: Colors.green),
                          ],
                          key:
                              Key(notesController.list_notes[index].toString()),
                          trailingActions: <SwipeAction>[
                            SwipeAction(
                                widthSpace: DeviceDimensions.width * .2,
                                title: "Edit",
                                onTap: (CompletionHandler handler) async {
                                  // AudioPlayerController.instance
                                  //     .playFailSound();
                                  notesController.moveToEditPageWithIndex(
                                      editNoteInIndex: index);
                                },
                                color: Colors.red),
                          ],
                          child: notesController.list_notes[index]);
                    },
                  );
              }),
        ),
      ),
    );
  }
}
