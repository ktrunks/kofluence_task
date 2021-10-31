import 'package:get/get.dart';
import 'package:kofluence_task/binding%20/home_binding.dart';
import 'package:kofluence_task/binding%20/second_binding.dart';
import 'package:kofluence_task/ui/home/home_screen.dart';
import 'package:kofluence_task/ui/home/second.dart';

class AppScreens {
  static final pages = [
    GetPage(name: '/', page: () => HomeScreen(), binding: HomeBinding()),
    GetPage(
        name: '/second_screen', page: () => Second(), binding: SecondBinding()),
  ];
}
