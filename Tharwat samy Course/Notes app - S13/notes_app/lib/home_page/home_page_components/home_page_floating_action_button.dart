import 'package:flutter/material.dart';
import 'package:notes_app/config/device_dimensions.dart';
import 'package:notes_app/home_page/bottom_sheet_view/bottom_sheet_view.dart';
import 'package:notes_app/home_page/note_item/note_item.dart';

class HomePageFloatingActionButton extends StatelessWidget {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController noteTitleTextEditingController =
      TextEditingController();
  TextEditingController noteDescriptionTextEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        BottomSheetView(
          context: context,
            formKey: _formKey,
            noteDescriptionTextEditingController:
                noteDescriptionTextEditingController,
            noteTitleTextEditingController: noteTitleTextEditingController);
      },
      child: const Icon(Icons.add),
    );
  }
}
