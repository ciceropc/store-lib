import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:app/module/sign_forgot_password/controller/forgot_password_controller.dart';
import 'package:app/shared_widgets/components/input_text_field.dart';
import 'package:app/shared_widgets/components/loading_button.dart';
import 'package:app/shared_widgets/components/primary_button.dart';
import 'package:app/shared_widgets/widget/app_bar/label_app_bar.dart';
import 'package:app/theme/app_theme.dart';
import 'package:app/util/validators.dart';

class ForgotPasswordEmailPage extends GetView<ForgotPasswordController> {
  final GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String previousEmail = Get.arguments ?? '';
    if (emailController.text.isEmpty && previousEmail.isNotEmpty) {
      emailController.text = previousEmail;
      controller.email.value = previousEmail;
    }

    return Scaffold(
      appBar: LabelAppBar(title: 'Esqueceu a senha?'),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          children: [
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 40),
              child: Text(
                'Insira seu e-mail para criar uma nova senha',
                style: headlineBold,
              ),
            ),
            SizedBox(height: 22),
            Obx(
              () => Form(
                key: emailKey,
                child: InputTextFormField(
                  controller: emailController,
                  autocorrect: false,
                  labelText: 'E-mail',
                  textCapitalization: TextCapitalization.none,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.emailAddress,
                  onFieldSubmitted: (email) {
                    controller.emailErrorMessage.value = null;
                    emailKey.currentState.validate();
                  },
                  onSaved: (email) => controller.email.value = email,
                  onChanged: (email) => controller.email.value = email,
                  validator: emailValidator,
                  errorMessage: controller.emailErrorMessage.value,
                ),
              ),
            ),
            Spacer(),
            Obx(
              () => LoadingButton(
                isLoading: controller.isLoading.value,
                buttonWidget: PrimaryButton(
                  onTap: controller.email.value.isEmpty
                      ? null
                      : () {
                          if (emailKey.currentState.validate()) {
                            FocusScope.of(context).unfocus();

                            emailKey.currentState.save();

                            controller.checkEmail();
                          }
                        },
                  text: 'Entrar',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
