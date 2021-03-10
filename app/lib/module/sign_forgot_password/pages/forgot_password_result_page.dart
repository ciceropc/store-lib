import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/shared_widgets/components/primary_button.dart';
import 'package:app/shared_widgets/components/secondary_button.dart';
import 'package:app/shared_widgets/widget/feedback_screen.dart';
import 'package:app/theme/app_theme.dart';

class ForgotPasswordResultPage extends StatelessWidget {
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
      title: 'Senha alterada com sucesso.',
      contentText: 'Faça o login com a nova senha para acessar a sua conta.',
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

  FeedbackScreen _buildError() {
    return FeedbackScreen.registerError(
      actions: [
        SecondaryButton(
          backgroundColor: primaryColor,
          text: 'Voltar',
          onTap: () => Get.close(0),
        )
      ],
    );
  }
}
