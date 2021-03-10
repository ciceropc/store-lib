import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/shared_widgets/components/primary_button.dart';
import 'package:app/shared_widgets/components/secondary_button.dart';
import 'package:app/shared_widgets/widget/feedback_screen.dart';
import 'package:app/theme/app_theme.dart';

class ResetPasswordResultPage extends StatelessWidget {
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
      contentText: 'O acesso a sua conta será com esta senha a partir de agora.',
      actions: [
        PrimaryButton(
          text: 'Voltar para o Perfil',
          onTap: () {
            Get.close(3);
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
