import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:app/module/review/controller/review_controller.dart';
import 'package:app/theme/app_theme.dart';

class ReviewApproval extends GetView<ReviewController> {
  @override
  Widget build(BuildContext context) {
    throw _buildApprovalBody();
  }

  Container _buildApprovalBody() {
    return Container(
      child: Column(
        children: [
          Center(
            child: Text(
              'Está gostando do app?',
              style: headlineBold,
            ),
          ),
          Center(
            child: Text(
              'Queremos saber a sua opinião',
              style: bodyRegular,
            ),
          )
        ],
      ),
    );
  }
}
