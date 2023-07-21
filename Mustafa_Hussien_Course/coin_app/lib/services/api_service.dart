import 'dart:convert';

import 'package:dio/dio.dart' as d;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class APIServices extends GetxController {
  int index = 0;
  bool dataFetched = false;
  List<String> drop_down_items = [
    'bitcoin',
    'ethereum ',
    'cnh-tether ',
    'binance-peg-xrp '
  ];
  List<DropdownMenuItem> dropdownMenuItems = [];
  List<String> requests = [
    'https://api.coingecko.com/api/v3/coins/bitcoin',
    'https://api.coingecko.com/api/v3/coins/ethereum',
    'https://api.coingecko.com/api/v3/coins/binance-peg-xrp',
    'https://api.coingecko.com/api/v3/coins/cnh-tether',
  ];
  late String _baseUrl;
  late String _request_bitcoin;
  final d.Dio dio = d.Dio();
  late Map<String, dynamic> _apiMap;
  late String displayedItem;
  Map<String, dynamic> crypto_data = {};
  @override
  void onInit() async {
    await initializeAPIServices();
    super.onInit();
  }

  Future<void> initializeAPIServices() async {
    drop_down_items.forEach((item) {
      dropdownMenuItems.add(DropdownMenuItem(child: Text(item), value: item));
    });
    displayedItem = drop_down_items[index];
    await rootBundle
        .loadString("assets/main.json")
        .then((_config_file_content) async {
      _apiMap = jsonDecode(_config_file_content);
      _baseUrl = _apiMap['base_url'];
    });
    await getCoinData(crypto_request: requests[index]);
    update();
  }

  Future<d.Response?> getCoinData({required String crypto_request}) async {
    dataFetched = false;
    update();
    print('request : $crypto_request');
    try {
      await dio.get(crypto_request).then((response) {
        crypto_data = {
          'description': response.data['description']['en'],
          'image': response.data['image']['thumb'],
          'usd_value': response.data['market_data']['current_price']['usd'],
          'usd_precentage': response.data['market_data']
              ['ath_change_percentage']['usd'],
        };
      });
      dataFetched = true;
      update();
    } catch (e) {
      print(e);
    }
  }

  void changeIndex({required String value}) async {
    index = drop_down_items.indexOf(value);
    displayedItem = drop_down_items[index];
    await getCoinData(crypto_request: requests[index]);
  }
}
