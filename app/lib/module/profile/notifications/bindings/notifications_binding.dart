import 'package:get/get.dart';

import 'package:app/module/profile/notifications/controller/notifications_controller.dart';

class NotificationsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationsController>(() => NotificationsController(), fenix: true);
  }
}
