import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';

class DeviceDimensions {
  
  static late double width;
  static late double height;

  static void initDeviceDimensions() {
    width = Get.mediaQuery.size.width;
    height = Get.mediaQuery.size.height;
  }
}
