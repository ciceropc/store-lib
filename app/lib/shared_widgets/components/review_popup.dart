import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:in_app_review/in_app_review.dart';

import 'package:app/module/review/controller/review_controller.dart';
import 'package:app/shared_widgets/components/primary_button.dart';
import 'package:app/shared_widgets/widget/popup.dart';
import 'package:app/theme/app_theme.dart';
import 'package:app/util/firebase_analytics.dart';

class ReviewPopup {
  static final ReviewController _reviewController = ReviewController();

  static showReviewDialog({bool checkConditions = false}) {
    _reviewController.verifyReview();
    _reviewController.reviewCommentController.clear();

    if (!checkConditions || _reviewController.showReview.value) {
      Get.dialog(
        Popup(
          contentPadding: 0,
          actionsPadding: 0,
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          content: [
            Column(
              children: [
                Row(
                  children: [
                    Spacer(),
                    InkWell(
                      splashColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        Get.close(0);
                      },
                      child: Icon(
                        Icons.close,
                        color: textHigh,
                        size: 26,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Está gostando do app?',
                  style: headlineBold,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Queremos saber a sua opinião',
                  style: bodyRegular,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
          actions: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Ink(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 0.5),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        padding: const EdgeInsets.all(20),
                        icon: SvgPicture.asset("assets/icons/thumbs_up.svg"),
                        color: Colors.white,
                        onPressed: () {
                          FirebaseAnalyticsService.logClick('avaliação', 'thumbs_up');
                          Get.close(0);
                          _showStoreReview();
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                    ),
                    Ink(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 0.5),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        padding: const EdgeInsets.all(20),
                        icon: SvgPicture.asset("assets/icons/thumbs_down.svg"),
                        color: Colors.white,
                        onPressed: () {
                          FirebaseAnalyticsService.logClick('avaliação', 'thumbs_down');
                          Get.close(0);
                          _showReviewCommentDialog();
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            )
          ],
        ),
        barrierDismissible: false,
      );
    }
  }

  static _showReviewCommentDialog() {
    Get.dialog(
      Popup(
        contentPadding: 0,
        actionsPadding: 0,
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        content: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Spacer(),
                  InkWell(
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Get.close(0);
                    },
                    child: Icon(
                      Icons.close,
                      color: textHigh,
                      size: 26,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Agradecemos pela resposta',
                style: headlineBold,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Estamos sempre buscando melhorar os nossos serviços e produtos',
                  style: bodyRegular,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: TextField(
                  controller: _reviewController.reviewCommentController,
                  maxLines: 5,
                  style: captionRegular,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      _reviewController.allowSubmit.value = true;
                    } else {
                      _reviewController.allowSubmit.value = false;
                    }
                  },
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    hintText: 'Queremos saber a sua opinião',
                    hintStyle: captionRegular.copyWith(color: disabledColor),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ],
        actions: [
          Obx(() {
            return PrimaryButton(
              onTap: _reviewController.allowSubmit.value
                  ? () async {
                      _reviewController.sendReview(true, _reviewController.reviewCommentController.text);
                      Get.close(0);
                    }
                  : null,
              text: 'Enviar',
            );
          }),
        ],
      ),
      barrierDismissible: false,
    );
  }

  static _showStoreReview() async {
    final InAppReview inAppReview = InAppReview.instance;
    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    }
  }
}
