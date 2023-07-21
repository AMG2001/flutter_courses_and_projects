import 'package:coin_app/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: GetBuilder<APIServices>(builder: (api_controller) {
            return ListView.builder(
              itemCount: api_controller.list_details.length,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.sizeOf(context).width,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(16),
                  child: api_controller.list_details[index],
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
