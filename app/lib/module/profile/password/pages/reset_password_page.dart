import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:app/module/profile/password/controller/reset_password_controller.dart';
import 'package:app/shared_widgets/widget/app_bar/label_app_bar.dart';
import 'package:app/shared_widgets/widget/password_body.dart';

class ResetPasswordPage extends GetView<ResetPasswordController> {
  final GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordConfirmKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LabelAppBar(title: 'Alterar senha'),
      body: PasswordBody(
          title: 'Escolha uma nova senha',
          buttonText: 'Continuar',
          controller: controller,
          passwordKey: passwordKey,
          passwordConfirmKey: passwordConfirmKey),
    );
  }
}
