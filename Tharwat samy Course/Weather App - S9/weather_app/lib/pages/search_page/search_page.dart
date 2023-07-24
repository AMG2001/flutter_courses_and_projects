import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/config/device_dimensions.dart';
import 'package:weather_app/pages/home_page/controller/home_page_controller.dart';
import 'package:weather_app/services/weather_api.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search for City"),
      ),
      body: Center(
        child: GetBuilder<HomePageController>(builder: (controller) {
          return Container(
            width: DeviceDimensions.width * .8,
            child: TextField(
              onSubmitted: (value) async {
                await WeatherApi.instance.getCityData(cityName: value);
              },
              decoration: InputDecoration(
                labelText: 'City Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
