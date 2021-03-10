import 'package:get/get.dart';

import 'package:app/module/profile/controller/profile_controller.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController(), fenix: true);
  }
}
