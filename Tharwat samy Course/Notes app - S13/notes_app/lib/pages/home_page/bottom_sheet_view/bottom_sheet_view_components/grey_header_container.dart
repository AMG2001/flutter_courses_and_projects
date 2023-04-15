import 'package:flutter/material.dart';
import 'package:notes_app/config/device_dimensions.dart';

class GreyHeaderContainer extends StatelessWidget {
  const GreyHeaderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(32),
      ),
      margin: EdgeInsets.only(top: 16, bottom: 32),
      width: DeviceDimensions.width * .2,
      height: 6,
    );
  }
}
