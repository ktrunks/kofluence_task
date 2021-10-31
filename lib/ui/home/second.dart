import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kofluence_task/controller%20/home_controller.dart';
import 'package:kofluence_task/controller%20/second_controller.dart';

class Second extends StatelessWidget {
  HomeController ctrl = Get.find();
  SecondController controller = Get.find();

  @override
  Widget build(context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${ctrl.count}"),
          const SizedBox(
            height: 10,
          ),
          GetBuilder<SecondController>(builder: (_) {
            debugPrint('build of data  $_');
            return Text(
              'data : ${controller.data}',
            );
          }),
          ElevatedButton(
            child: Text('update string'),
            onPressed: () {
              controller.updateString();
            },
          ),
          GetBuilder<SecondController>(builder: (_) {
            debugPrint('build of integer data  $_');
            return Text(
              'integer : ${controller.integer}',
            );
          }),
          ElevatedButton(
            child: Text('update integer'),
            onPressed: () {
              controller.updateInteger();
            },
          ),
        ],
      ))),
    );
  }
}
