import 'package:flutter/material.dart';

class NoteDescriptionTextField extends StatelessWidget {
  TextEditingController tec_noteDescription = TextEditingController();

  String get get_noteDescriptionText => tec_noteDescription.text;

  void set_noteDescriptionText({required String text}) {
    tec_noteDescription.text = text;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 60,
      validator: (value) {
        if (value!.isEmpty || value == '') {
          return 'you can\'t leave this field empty';
        }
      },
      controller: tec_noteDescription,
      decoration: InputDecoration(
        suffixIcon: const Icon(Icons.app_registration_rounded),
        labelText: 'Note Description',
        hintText: 'Enter your note description',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
