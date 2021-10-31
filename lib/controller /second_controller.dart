import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SecondController extends GetxController {
  String data = 'test';

  int integer = 1;

  SecondController() {
    debugPrint('second screen controller');
  }

  @override
  void onInit() {
    super.onInit();
    debugPrint('on init of controller');
  }

  @override
  void onClose() {
    super.onClose();
    debugPrint('on close of controller');
  }

  void updateString() {
    data = 'update';
    debugPrint('on click of update string');
    update();
  }

  void updateInteger() {
    integer = 10;
    debugPrint('on click of update integer');
    update();
  }
}
