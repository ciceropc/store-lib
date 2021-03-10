import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:app/module/sign/controller/sign_in_controller.dart';
import 'package:app/routes/app_routes.dart';
import 'package:app/shared_widgets/components/eye_animation.dart';
import 'package:app/shared_widgets/components/input_text_field.dart';
import 'package:app/shared_widgets/components/loading_button.dart';
import 'package:app/shared_widgets/components/primary_button.dart';
import 'package:app/shared_widgets/components/secondary_button.dart';
import 'package:app/shared_widgets/widget/app_bar/label_app_bar.dart';
import 'package:app/theme/app_theme.dart';
//import 'package:app/util/firebase_analytics.dart';
import 'package:app/util/validators.dart';

class SignInPage extends GetView<SignInController> {
  final GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordKey = GlobalKey<FormState>();

  final argument = Get.arguments ?? '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LabelAppBar(
        title: 'Faça o login na sua conta',
        centerTitle: false,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          children: [
            Spacer(),
            Obx(
              () => Form(
                key: emailKey,
                child: InputTextFormField(
                  autocorrect: false,
                  labelText: 'E-mail',
                  errorMessage: controller.errorMessage.value,
                  textCapitalization: TextCapitalization.none,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.emailAddress,
                  onFieldSubmitted: (email) {
                    controller.errorMessage.nil();
                    emailKey.currentState.validate();
                  },
                  onSaved: (email) => controller.email.value = email,
                  onChanged: (email) => controller.email.value = email,
                  validator: emailValidator,
                ),
              ),
            ),
            SizedBox(height: 16),
            Obx(
              () => Form(
                key: passwordKey,
                child: InputTextFormField(
                  labelText: 'Senha',
                  errorMessage: controller.errorPasswordMessage.value,
                  suffixIcon: IconButton(
                    color: textLow,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    icon: EyeAnimation(
                      enableEye: controller.shouldObscurePassword.value,
                    ),
                    onPressed: () {
                      controller.toogleObscurePassword();
                    },
                  ),
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.visiblePassword,
                  obscureText: controller.shouldObscurePassword.value,
                  onFieldSubmitted: (_) {
                    if (passwordKey.currentState.validate()) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  onChanged: (password) => controller.password.value = password,
                  onSaved: (password) => controller.password.value = password,
                  validator: passwordValidator,
                ),
              ),
            ),
            SizedBox(height: 16),
            SecondaryButton(
              onTap: () {
                //FirebaseAnalyticsService.logClick('perfil', 'esqueceu_senha');
                Get.toNamed(Routes.FORGOT_PASSWORD_EMAIL, arguments: controller.email.value);
              },
              text: 'Esqueceu a senha?',
              borderColor: Colors.transparent,
              textColor: appThemeData.accentColor,
            ),
            Spacer(),
            Obx(
              () => LoadingButton(
                isLoading: controller.isLoading.value,
                buttonWidget: PrimaryButton(
                  onTap: _isEnabledButton()
                      ? () {
                          if (emailKey.currentState.validate() & passwordKey.currentState.validate()) {
                            emailKey.currentState.save();
                            passwordKey.currentState.save();
                            FocusScope.of(context).unfocus();
                            controller.signIn(() {
                              if (argument == 'fromCart') {
                                Get.offAndToNamed(Routes.CART_SHIPPING);
                              } else {
                                Get.back();
                              }
                            });
                          }
                        }
                      : null,
                  text: 'Entrar',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _isEnabledButton() {
    return controller.email.value.isNotEmpty && controller.password.value.isNotEmpty;
  }
}
