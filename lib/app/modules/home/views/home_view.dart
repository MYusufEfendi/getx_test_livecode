import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var data = controller.usersResponse.value.data;
      return Scaffold(
        appBar: AppBar(
          title: Text('HomeView'),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.all(16),
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.only(top: 8),
                child: Row(
                  children: [
                    Image.network(data[index]?.avatar ?? ""),
                    SizedBox(
                      width: 6,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("ID : ${data[index]?.id ?? ""}"),
                        Text("Name : ${data[index]?.firstName ?? ""}"),
                        Text("email : ${data[index]?.email ?? ""}"),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      );
    });
  }
}
