import 'package:coin_app/pages/details_page.dart';
import 'package:coin_app/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetBuilder<APIServices>(
            init: APIServices(),
            builder: (api_controller) {
              return api_controller.dataFetched == true
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DropdownButton(
                            value: api_controller.displayedItem,
                            items: api_controller.dropdownMenuItems,
                            onChanged: (value) {
                              api_controller.changeIndex(value: value);
                            }),
                        SizedBox(
                          height: 36,
                        ),
                        GestureDetector(
                          onDoubleTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return DetailsPage();
                              },
                            ));
                          },
                          child: Image.network(
                            api_controller.crypto_data['image'],
                            width: MediaQuery.sizeOf(context).width * .2,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 36,
                        ),
                        Text(
                          "${api_controller.crypto_data['usd_value']} USD",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 36,
                        ),
                        Text(
                          "${api_controller.crypto_data['usd_precentage']} %",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          height: 36,
                        ),
                        Container(
                          margin: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.black.withOpacity(.5)),
                          padding: EdgeInsets.all(24),
                          height: MediaQuery.sizeOf(context).height * .4,
                          width: MediaQuery.sizeOf(context).width,
                          child: SelectableText(
                            "${api_controller.crypto_data['description']}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            }),
      ),
    );
  }
}
