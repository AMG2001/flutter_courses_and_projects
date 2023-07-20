import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

class APIServices {
  late String _baseUrl;
  late String _request_bitcoin;
  final Dio dio = Dio();
  late Map<String, dynamic> _apiMap;
  Future<void> initializeAPIServices() async {
    final _config_file_content = await rootBundle.loadString("main.json");
    _apiMap = jsonDecode(_config_file_content);
    _baseUrl = _apiMap['base_url'];
    await getCoinData(coinName: 'bitcoin');
  }

  Future<Response?> getCoinData({required String coinName}) async {
    String _request = '$_baseUrl'+'coins/$coinName';
    try {
      Response _response = await dio.get(_request);
      print("$coinName response : ${_response.data}");
    } catch (e) {
      print(e);
    }
  }
}
