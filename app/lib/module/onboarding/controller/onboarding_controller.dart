import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingController extends GetxController {
  var enableNotifications = false.obs;
  var enableLocalization = false.obs;
  var loading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    await checkPermission();
  }

  checkPermission() async {
    loading.value = true;
    var statusNotification = await Permission.notification.status;

    enableNotifications.value = statusNotification == PermissionStatus.granted;

    var statusLocation = await Permission.location.status;

    enableLocalization.value = statusLocation == PermissionStatus.granted;

    loading.value = false;
  }

  Future<void> setFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('first_time', false);
  }

  void toggleNotification() async {
    if (!enableNotifications.value) {
      var statusNotification = await Permission.notification.status;

      if (statusNotification == PermissionStatus.denied) {
        openAppSettings();
      } else {
        statusNotification = await Permission.notification.request();
      }

      enableNotifications.value = statusNotification == PermissionStatus.granted;
    } else {
      openAppSettings();
    }
  }

  void toggleLocalization() async {
    loading.value = true;

    if (!enableLocalization.value) {
      var statusLocation = await Permission.location.status;
      if (statusLocation == PermissionStatus.denied) {
        openAppSettings();
      } else {
        statusLocation = await Permission.location.request();
      }

      enableLocalization.value = statusLocation == PermissionStatus.granted;
    } else {
      openAppSettings();
    }

    loading.value = false;
  }
}
