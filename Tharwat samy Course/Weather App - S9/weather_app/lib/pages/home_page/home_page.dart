import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/config/device_dimensions.dart';
import 'package:weather_app/pages/home_page/home_page_controller.dart';
import 'package:weather_app/pages/search_page/search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    DeviceDimensions.initDeviceDimensions();
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather"),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => SearchPage(),
                    transition: Transition.rightToLeft,
                    duration: Duration(milliseconds: 750),
                    curve: Curves.easeInOutCubic);
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: GetBuilder<HomePageController>(
        init: HomePageController(),
        builder: (controller) {
          return SafeArea(
            child: Container(
              child: controller.SearchResult,
            ),
          );
        },
      ),
    );
  }
}
