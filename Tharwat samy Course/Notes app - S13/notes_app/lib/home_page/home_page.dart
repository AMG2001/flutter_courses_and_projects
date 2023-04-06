import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/config/device_dimensions.dart';
import 'package:notes_app/home_page/home_page_components/home_page_app_bar.dart';
import 'package:notes_app/home_page/note_item/note_item.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController noteTitleTextEditingController =
      TextEditingController();
  TextEditingController noteDescriptionTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Container(
                    padding: EdgeInsets.all(24),
                    height: DeviceDimensions.height * .4,
                    width: DeviceDimensions.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(28),
                        topRight: Radius.circular(28),
                      ),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(32),
                            ),
                            margin: EdgeInsets.only(top: 16, bottom: 32),
                            width: DeviceDimensions.width * .2,
                            height: 6,
                          ),
                          TextFormField(
                            controller: noteTitleTextEditingController,
                            decoration: InputDecoration(
                              labelText: 'Note Title',
                              hintText: 'Enter your note title',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            controller: noteDescriptionTextEditingController,
                            decoration: InputDecoration(
                              labelText: 'Note Description',
                              hintText: 'Enter your note description',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 16),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.white.withOpacity(0.1),
                              ),
                            ),
                            onPressed: () {},
                            child: Text("Add Note"),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
      appBar: homePageAppBar,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: DeviceDimensions.width,
          height: DeviceDimensions.height,
          child: ListView(
            children: [
              NoteItem(
                noteTitle: 'Flutter Tips',
                noteDescription: 'Future with Mavica Academy',
                noteBackgroundColor: Colors.amber[400],
                noteDate: DateFormat.yMMMd().format(DateTime.now()).toString(),
              ),
              NoteItem(
                noteTitle: 'Flutter Tips',
                noteDescription: 'Future with Mavica Academy',
                noteBackgroundColor: Colors.red,
                noteDate: DateFormat.yMMMd().format(DateTime.now()).toString(),
              ),
              NoteItem(
                noteTitle: 'Flutter Tips',
                noteDescription: 'Future with Mavica Academy',
                noteBackgroundColor: Colors.purple.shade400,
                noteDate: DateFormat.yMMMd().format(DateTime.now()).toString(),
              ),
              NoteItem(
                noteTitle: 'Flutter Tips',
                noteDescription: 'Future with Mavica Academy',
                noteBackgroundColor: Colors.blueAccent,
                noteDate: DateFormat.yMMMd().format(DateTime.now()).toString(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
