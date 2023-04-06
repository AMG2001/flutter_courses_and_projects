import 'package:flutter/material.dart';
import 'package:notes_app/config/device_dimensions.dart';
import 'package:notes_app/home_page/home_page_components/home_page_app_bar.dart';
import 'package:notes_app/home_page/note_item/note_item.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
