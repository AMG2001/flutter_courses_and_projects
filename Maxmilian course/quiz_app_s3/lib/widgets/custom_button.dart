import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  Function() function;
  String text;
  CustomButton({super.key, required this.text, required this.function});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: Color(0x6D000000),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        onPressed: function,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0x1AFFFFFFF),
          ),
        ));
  }
}
