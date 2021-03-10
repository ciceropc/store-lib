import 'package:get/get.dart';

import 'package:app/util/services/local_storage_service.dart';
import 'package:app/util/services/notification_service.dart';

class NotificationsController extends GetxController {
  final NotificationService notificationService = Get.find<NotificationService>();
  final LocalStorageService localStorageService = Get.find<LocalStorageService>();

  @override
  void onInit() {
    super.onInit();

    verifyNotificationServices();
    getUserNotifications();
  }

  void getUserNotifications() {
    localStorageService.loadStorage();
  }

  void verifyNotificationServices() async {
    await notificationService.checkPermission();
  }

  void requestNotificationPermission() async {
    await notificationService.resquestNotificationPermission();
  }
}
