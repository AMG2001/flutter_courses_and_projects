import 'package:flutter/material.dart';
import 'package:go_moon/device_dimensions.dart';

class CustomDropDownButton extends StatelessWidget {
  late double containerWidth;
  late String initialValue;
  late List<String> options;
  CustomDropDownButton(
      {this.containerWidth = 0,
      required this.initialValue,
      required this.options});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return containerWidth != 0
            ? Container(
                width: containerWidth,
                margin: EdgeInsets.only(top: 16),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.withOpacity(.25),
                ),
                child: DropdownButton(
                  underline: SizedBox(),
                  value: initialValue,
                  items: options.map((String item) {
                    return DropdownMenuItem(value: item, child: Text(item));
                  }).toList(),
                  onChanged: (value) {
                    setState(
                      () {
                        initialValue = value!;
                      },
                    );
                  },
                ),
              )
            : Container(
                width: DeviceDimensions.width * .4,
                margin: EdgeInsets.only(top: 16),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.withOpacity(.25),
                ),
                child: DropdownButton(
                  underline: SizedBox(),
                  value: initialValue,
                  items: options.map((String item) {
                    return DropdownMenuItem(value: item, child: Text(item));
                  }).toList(),
                  onChanged: (value) {
                    setState(
                      () {
                        initialValue = value!;
                      },
                    );
                  },
                ),
              );
      },
    );
  }
}
