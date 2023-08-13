import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:weather_app/pages/home_page/controller/home_page_controller.dart';

class WeatherApi {
  String _base_url = 'http://api.weatherapi.com/v1';

  void setApiKey({required String api_key}) {
    _apiKey = api_key;
  }

  final homePageController = Get.put(HomePageController(), permanent: true);
  late String _apiKey;

  Dio _dio = Dio();

  WeatherApi._privateConstructor();

  static final WeatherApi _instance = WeatherApi._privateConstructor();

  static WeatherApi get instance => _instance;

  Map<String, dynamic> cityData_Map = {};

  Future<void> getCityData({required String cityName}) async {
    String request =
        'http://api.weatherapi.com/v1/current.json?key=${_apiKey}&q=${cityName}';
    print('request is : $request');
    await _dio.get(request).then((response) {
      cityData_Map = {
        'name': response.data['name'],
        'temp': response.data['main']['temp'],
        'temp_min': response.data['main']['temp_min'],
        'temp_max': response.data['main']['temp_max'],
        'weather': response.data['weather'][0]['main'],
      };
      print('city data in map : $cityData_Map');
    });
    homePageController.changeThemeColor(weatherStateName: getWeatherState());
    homePageController.changeSearchPerformedState();
    Get.back();
  }

  String getCityName() {
    return cityData_Map['name'];
  }

  String getTemp() {
    return (double.parse(cityData_Map['temp'].toString().replaceAll(' ', "")) /
            1.8)
        .toInt()
        .toString();
  }

  String getMinTemp() {
    return (double.parse(
                cityData_Map['temp_min'].toString().replaceAll(' ', "")) /
            1.8)
        .toInt()
        .toString();
  }

  String getMaxTemp() {
    return (double.parse(
                cityData_Map['temp_max'].toString().replaceAll(' ', "")) /
            1.8)
        .toInt()
        .toString();
  }

  String getWeatherState() {
    return cityData_Map['weather'];
  }
}
