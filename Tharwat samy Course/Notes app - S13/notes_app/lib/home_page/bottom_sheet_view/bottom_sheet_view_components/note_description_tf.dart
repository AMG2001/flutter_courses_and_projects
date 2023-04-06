import 'package:flutter/material.dart';

class NoteDescriptionTextField extends StatelessWidget {
  TextEditingController noteDescriptionTextEditingController;
  NoteDescriptionTextField(
      {required this.noteDescriptionTextEditingController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 60,
      validator: (value) {
        if (value!.isEmpty || value == '') {
          return 'you can\'t leave this field empty';
        }
      },
      controller: noteDescriptionTextEditingController,
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.app_registration_rounded),
        labelText: 'Note Description',
        hintText: 'Enter your note description',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
