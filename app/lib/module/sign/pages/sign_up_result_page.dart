import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/module/sign/controller/sign_up_controller.dart';
import 'package:app/shared_widgets/components/primary_button.dart';
import 'package:app/shared_widgets/components/secondary_button.dart';
import 'package:app/shared_widgets/widget/feedback_screen.dart';
import 'package:app/shared_widgets/widget/loading.dart';
import 'package:app/theme/icons/app_icons.dart';

class SignUpResultPage extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.arguments == 'success' ? Get.close(4) : Get.close(0);
        return false;
      },
      child: Scaffold(
        body: Get.arguments == 'success' ? _buildSuccess() : _buildError(),
      ),
    );
  }

  FeedbackScreen _buildSuccess() {
    return FeedbackScreen.registerSuccess(
      title: 'Conta criada com sucesso',
      contentText: '',
      actions: [
        PrimaryButton(
          text: 'Entrar',
          onTap: () {
            Get.close(4);
          },
        ),
      ],
    );
  }

  Widget _buildError() {
    return Obx(() => controller.isLoading.value
        ? Center(child: LoadingAnimatedIcon())
        : FeedbackScreen.registerError(actions: [
            PrimaryButton(
              icon: AppIcons.refresh_nv,
              text: 'Recarregar',
              onTap: () {
                controller.finishPasswordFlow();
              },
            ),
            SecondaryButton(
              text: 'Voltar',
              onTap: () => Get.close(0),
            ),
          ]));
  }
}
