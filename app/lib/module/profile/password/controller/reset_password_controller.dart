import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:app/module/profile/password/pages/reset_password_access_key_page.dart';
import 'package:app/module/profile/password/pages/reset_password_result_page.dart';
import 'package:app/shared_widgets/components/primary_button.dart';
import 'package:app/shared_widgets/widget/popup.dart';
import 'package:app/theme/app_theme.dart';
import 'package:app/util/interfaces/password_controller_interface.dart';

class ResetPasswordController extends GetxController implements PasswordControllerInterface {
  final email = ''.obs;
  final emailErrorMessage = RxString();
  final codeErrorMessage = RxString();

  final password = ''.obs;
  final passwordConfirm = ''.obs;

  final validationCode = 0.obs;

  final obscurePassword = true.obs;
  final obscurePasswordConfirm = true.obs;

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  passwordSubmit() {
    sendCode();
    Get.to(ResetPasswordAccessKeyPage());
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
      var response; // = await _repository.setNewPassword(
      //   validationCode.value,
      //   email.value,
      //   password.value,
      // );
      if (response.authStatus == 'Success') {
        Get.to(ResetPasswordResultPage(), arguments: 'success');
      }
    } catch (e) {
      if (e['data'] != null && e['data']['authStatus'] != null && e['data']['authStatus'] == 'WrongCredentials') {
        codeErrorMessage.value = 'Insira um código válido';
      } else {
        Get.to(ResetPasswordResultPage(), arguments: 'error');
      }
    }
    isLoading.value = false;
  }

  @override
  sendCode() {
    // TODO: implement sendCode
    throw UnimplementedError();
  }
}
