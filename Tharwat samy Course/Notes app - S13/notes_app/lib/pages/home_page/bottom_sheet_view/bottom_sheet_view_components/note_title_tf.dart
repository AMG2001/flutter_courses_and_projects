import 'package:flutter/material.dart';

class NoteTitleTextField extends StatelessWidget {
  TextEditingController tec_noteTitle = TextEditingController();

  String get get_noteTitleText => tec_noteTitle.text;

  void setNoteTitle({required String text}) {
    tec_noteTitle.text = text;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        print(get_noteTitleText);
      },
      validator: (value) {
        if (value!.isEmpty || value == '') {
          return 'you can\'t leave this field empty';
        }
      },
      controller: tec_noteTitle,
      maxLength: 20,
      decoration: InputDecoration(
        suffixIcon: const Icon(Icons.turned_in_not),
        labelText: 'Note Title',
        hintText: 'Enter your note title',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
