import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/module/profile/password/controller/reset_password_controller.dart';
import 'package:app/shared_widgets/widget/app_bar/label_app_bar.dart';
import 'package:app/shared_widgets/widget/send_key_body.dart';

class ResetPasswordAccessKeyPage extends GetView<ResetPasswordController> {
  final GlobalKey<FormState> codeKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LabelAppBar(title: 'Alterar senha'),
      body: SendKeyBody(
        codeKey: codeKey,
        controller: controller,
      ),
    );
  }
}
