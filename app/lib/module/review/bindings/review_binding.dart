import 'package:get/instance_manager.dart';
import 'package:app/module/review/controller/review_controller.dart';
import 'package:app/module/review/data/review_repository.dart';

class ReviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReviewRepository>(() => ReviewRepository());
    Get.lazyPut<ReviewController>(() => ReviewController());
  }
}
