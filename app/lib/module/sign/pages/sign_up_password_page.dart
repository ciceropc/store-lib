import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:app/module/sign/controller/sign_up_controller.dart';
import 'package:app/shared_widgets/widget/app_bar/label_app_bar.dart';
import 'package:app/shared_widgets/widget/password_body.dart';

class SignUpPasswordPage extends GetView<SignUpController> {
  final GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordConfirmKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LabelAppBar(
        title: 'Cadastre-se',
      ),
      body: PasswordBody(
        title: 'Crie uma senha',
        buttonText: 'Cadastrar conta',
        controller: controller,
        passwordKey: passwordKey,
        passwordConfirmKey: passwordConfirmKey,
      ),
    );
  }
}
