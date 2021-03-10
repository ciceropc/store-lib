import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:app/routes/app_routes.dart';
import 'package:app/shared_widgets/components/primary_button.dart';
import 'package:app/shared_widgets/widget/popup.dart';
import 'package:app/theme/app_theme.dart';
import 'package:app/util/interfaces/password_controller_interface.dart';

class ForgotPasswordController extends GetxController implements PasswordControllerInterface {
  final email = ''.obs;
  final emailErrorMessage = RxString();
  final codeErrorMessage = RxString();

  final password = ''.obs;
  final passwordConfirm = ''.obs;

  final validationCode = 0.obs;

  final obscurePassword = true.obs;
  final obscurePasswordConfirm = true.obs;

  final isLoading = false.obs;

  checkEmail() async {
    isLoading.value = true;
    emailErrorMessage.nil();

    try {
      final result = null; // = await _repository.searchEmail(email.value);
      if (result.isEmpty) {
        emailErrorMessage.value = 'Não encontramos nenhuma conta cadastrada '
            'com esse e-mail. Tente novamente ou '
            'crie uma nova conta';
      } else {
        sendCode();
        Get.toNamed(Routes.FORGOT_PASSWORD_SET);
      }
    } catch (e) {
      emailErrorMessage.value = 'Erro, tente novamente';
    }
    isLoading.value = false;
  }

  @override
  passwordSubmit() {
    Get.toNamed(Routes.FORGOT_PASSWORD_ACCESS_KEY);
  }

  @override
  sendCode() async {
    // await _repository.sendAccessKey(email.value);
  }

  @override
  resendCode() async {
    sendCode();
    _showPopup();
  }

  void _showPopup() {
    Get.dialog(
      Popup(
        content: [
          Text(
            'Código enviado.\nVerifique o seu e-mail.',
            textAlign: TextAlign.center,
            style: bodyRegular.copyWith(
              color: textHigh,
            ),
          )
        ],
        actions: [
          PrimaryButton(
              onTap: () {
                Get.back();
              },
              text: 'OK')
        ],
      ),
    );
  }

  @override
  finishPasswordFlow() async {
    isLoading.value = true;
    codeErrorMessage.nil();
    try {
      const response = null; // = await _repository.setNewPassword(
      //   validationCode.value,
      //   email.value,
      //   password.value,
      // );
      if (response.authStatus == 'Success') {
        Get.toNamed(Routes.FORGOT_PASSWORD_RESULT, arguments: 'success');
      }
    } catch (e) {
      if (e['data'] != null && e['data']['authStatus'] != null && e['data']['authStatus'] == 'WrongCredentials') {
        codeErrorMessage.value = 'Insira um código válido';
      } else {
        Get.toNamed(Routes.FORGOT_PASSWORD_RESULT, arguments: 'error');
      }
    }
    isLoading.value = false;
  }
}
