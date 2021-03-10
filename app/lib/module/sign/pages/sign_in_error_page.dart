import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:app/module/sign/controller/sign_in_controller.dart';
import 'package:app/shared_widgets/components/primary_button.dart';
import 'package:app/shared_widgets/components/secondary_button.dart';
import 'package:app/shared_widgets/widget/feedback_screen.dart';
import 'package:app/shared_widgets/widget/loading.dart';
import 'package:app/theme/icons/app_icons.dart';

// ignore: must_be_immutable
class SignInErrorPage extends GetView<SignInController> {
  SignInController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.close(0);
        return false;
      },
      child: Scaffold(
        body: _buildError(),
      ),
    );
  }

  Widget _buildError() {
    return Obx(
      () => FeedbackScreen.registerError(actions: [
        controller.isLoading.value
            ? LoadingNV()
            : PrimaryButton(
                icon: AppIcons.refresh_nv,
                text: 'Recarregar',
                onTap: () => controller.signIn(() {
                  Get.close(2);
                }),
              ),
        SecondaryButton(
          text: 'Voltar',
          onTap: () => Get.close(0),
        ),
      ]),
    );
  }
}
