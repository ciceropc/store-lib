import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:app/module/sign_forgot_password/controller/forgot_password_controller.dart';
import 'package:app/shared_widgets/widget/app_bar/label_app_bar.dart';
import 'package:app/shared_widgets/widget/password_body.dart';

class ForgotPasswordSetPage extends GetView<ForgotPasswordController> {
  final GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordConfirmKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LabelAppBar(title: 'Esqueceu a senha?'),
      body: PasswordBody(
        title: 'Escolha uma nova senha',
        buttonText: 'Continuar',
        controller: controller,
        passwordKey: passwordKey,
        passwordConfirmKey: passwordConfirmKey,
      ),
    );
  }
}
