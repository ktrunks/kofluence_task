import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kofluence_task/route/app_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Get x',
      initialRoute: '/',
      getPages: AppScreens.pages,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeft,
    );
  }
}
