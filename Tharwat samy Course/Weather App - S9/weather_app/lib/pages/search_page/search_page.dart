import 'package:flutter/material.dart';
import 'package:weather_app/config/device_dimensions.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search for City"),
      ),
      body: Center(
        child: Container(
          width: DeviceDimensions.width * .8,
          child: TextField(
            decoration: InputDecoration(
              labelText: 'City Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
