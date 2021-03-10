import 'package:get/get.dart';

import 'package:app/module/home/controller/home_controller.dart';
import 'package:app/module/home/data/home_repository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeRepository>(() => HomeRepository(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
  }
}
