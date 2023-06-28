import 'package:flutter/material.dart';

class DeviceDimensions {
  static late double width;
  static late double height;

  static void initDeviceDimensions({required BuildContext context}) {
    width = MediaQuery.sizeOf(context).width;
    height = MediaQuery.sizeOf(context).height;
  }
}
