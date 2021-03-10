import 'package:get/get.dart';
import 'package:app/module/onboarding/controller/onboarding_controller.dart';

class OnBoardingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnBoardingController>(() => OnBoardingController());
  }
}
