import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  @override
  void onInit() {
    print('Home Page Controller init ');
    super.onInit();
  }

  Widget SearchResult = Center(
    child: Text("there is not weather , start search now !!"),
  );
}
