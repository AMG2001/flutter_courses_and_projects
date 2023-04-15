import 'package:flutter/material.dart';

class NoteTitleTextField extends StatelessWidget {
  TextEditingController noteTitleTextEditingController;
  NoteTitleTextField({required this.noteTitleTextEditingController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty || value == '') {
          return 'you can\'t leave this field empty';
        }
      },
      controller: noteTitleTextEditingController,
      maxLength: 20,
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.turned_in_not),
        labelText: 'Note Title',
        hintText: 'Enter your note title',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
