import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/pages/home_page/home_page.dart';

void main(){
  runApp(WeatherApp());
}


class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}