import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:weather_app/pages/home_page/view/home_page.dart';
import 'package:weather_app/services/weather_api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await rootBundle.loadString("assets/secrets.json").then((value) {
    final data = jsonDecode(value);
    WeatherApi.instance.setApiKey(api_key: data['api_key']);
  });
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
