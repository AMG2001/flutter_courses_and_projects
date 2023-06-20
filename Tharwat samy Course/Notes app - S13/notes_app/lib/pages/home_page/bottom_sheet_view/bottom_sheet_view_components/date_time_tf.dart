import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoteDateTextField extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  String choosenDateInString = '';
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
          labelText: 'Date', suffixIcon: Icon(Icons.date_range_outlined)),
      controller: controller,
      onTap: () async {
        await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2100))
            .then((value) {
          if (value != null) {
            controller.text = DateFormat.MMMEd().format(value).toString();
          } else {
            controller.text = 'Date is not choosen !!';
          }
        });
      },
    );
  }

  void setText({required String text}) {
    choosenDateInString = text;
    controller.text = text;
  }

  String get getChoosenDateInString => controller.text;
}
