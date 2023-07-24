import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  late bool searchPerformed;
  @override
  void onInit() {
    searchPerformed = false;
    super.onInit();
  }

  void changeSearchPerformedState() {
    searchPerformed = true;
    update();
  }

  
  
}
