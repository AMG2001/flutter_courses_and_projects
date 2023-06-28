import 'package:flutter/material.dart';
import 'package:go_moon/custom_drop_down_button.dart';
import 'package:go_moon/device_dimensions.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<String> list1 = ['Location 1', 'Location 2', 'Location 3', 'Location 4'];
  List<String> list2 = ['1', '2', '3', '4', '5'];
  List<String> list3 = ['Economy', 'Vip'];
  late String dropDownButton1Text = list1[0];
  @override
  Widget build(BuildContext context) {
    DeviceDimensions.initDeviceDimensions(context: context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          width: DeviceDimensions.width,
          height: DeviceDimensions.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "#GoMoon",
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
              Container(
                child: Column(
                  children: [
                    CustomDropDownButton(
                      initialValue: list1[0],
                      options: list1,
                      containerWidth: DeviceDimensions.width,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomDropDownButton(
                          initialValue: list2[0],
                          options: list2,
                        ),
                        CustomDropDownButton(
                          initialValue: list3[0],
                          options: list3,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                          backgroundColor: Colors.white),
                      onPressed: () {},
                      child: Container(
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                        width: DeviceDimensions.width,
                        child: Text(
                          "Book Ride!",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
