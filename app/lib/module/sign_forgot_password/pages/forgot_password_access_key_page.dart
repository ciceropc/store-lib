import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:app/module/sign_forgot_password/controller/forgot_password_controller.dart';
import 'package:app/shared_widgets/widget/app_bar/label_app_bar.dart';
import 'package:app/shared_widgets/widget/send_key_body.dart';

class ForgotPasswordAccessKeyPage extends GetView<ForgotPasswordController> {
  final GlobalKey<FormState> codeKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: LabelAppBar(title: 'Esqueceu a senha?'),
        body: SendKeyBody(
          codeKey: codeKey,
          controller: controller,
        ));
  }
}
