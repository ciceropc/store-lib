import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:app/module/review/data/review_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReviewController extends GetxController {
  ReviewRepository _reviewRepository;
  Rx<bool> showReview = Rx<bool>(false);
  SharedPreferences prefs;
  Rx<bool> allowSubmit = Rx<bool>(false);

  TextEditingController reviewCommentController = TextEditingController();

  ReviewController() {
    _reviewRepository = Get.find();
  }

  void verifyReview() async {
    if (prefs == null) prefs = await SharedPreferences.getInstance();
    final purchaseCount = prefs.getInt("purchase_count") ?? 0;
    if ((purchaseCount < 5 && purchaseCount % 2 == 0) || (purchaseCount >= 5 && purchaseCount % 3 == 1)) {
      showReview.value = true;
    }
    await prefs.setInt("purchase_count", purchaseCount + 1);
  }

  Future sendReview(bool thumbsUp, String comment) async {
    return _reviewRepository.sendReview(thumbsUp, comment);
  }
}
