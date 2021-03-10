import 'package:get/get.dart';

import 'package:app/module/home/bindings/home_binding.dart';
import 'package:app/module/profile/bindings/profile_binding.dart';
import 'package:app/module/root/controller/root_controller.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    HomeBinding().dependencies();
    ProfileBinding().dependencies();
    Get.put(RootController(), permanent: true);
  }
}
