import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/config/device_dimensions.dart';
import 'package:weather_app/pages/home_page/controller/home_page_controller.dart';
import 'package:weather_app/pages/search_page/search_page.dart';
import 'package:weather_app/services/weather_api.dart';

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
              child: controller.searchPerformed == false
                  ? Center(
                      child: Text("there is not weather , start search now !!"),
                    )
                  : Column(
                      children: [
                        SizedBox(
                          height: 24,
                        ),
                        Text(WeatherApi.instance.getCityName()),
                        SizedBox(
                          height: 24,
                        ),
                        Text(""),
                        SizedBox(
                          height: 24,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset('assets/images/clear.png'),
                            Text(WeatherApi.instance.getTemp()),
                            Column(
                              children: [
                                Text(
                                    "Max temp : ${WeatherApi.instance.getMaxTemp()}"),
                                Text(
                                    "Min temp : ${WeatherApi.instance.getMinTemp()}")
                              ],
                            )
                          ],
                        )
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }
}
