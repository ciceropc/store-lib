import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/routes/app_routes.dart';
import 'package:app/shared_widgets/components/primary_button.dart';
import 'package:app/shared_widgets/components/secondary_button.dart';
import 'package:app/shared_widgets/widget/popup.dart';
import 'package:app/shared_widgets/widget/snack_bar.dart';
import 'package:app/theme/app_theme.dart';
import 'package:app/util/interfaces/password_controller_interface.dart';

class SignUpController extends GetxController implements PasswordControllerInterface {
  final fullName = ''.obs;
  final birthDate = ''.obs;
  final cpf = ''.obs;
  final email = ''.obs;
  final phone = ''.obs;
  final gender = ''.obs;

  final password = ''.obs;
  final passwordConfirm = ''.obs;

  final obscurePassword = true.obs;
  final obscurePasswordConfirm = true.obs;

  final validationCode = 0.obs;

  final isLoading = false.obs;

  final emailErrorMessage = ''.obs;
  final codeErrorMessage = ''.obs;

  var isPasswordSet = false;

  checkEmail() async {
    isLoading.value = true;

    try {
      final result = null; //await _repository.searchEmail(email.value);

      if (result.isEmpty) {
        sendCode();
        Get.toNamed(Routes.SIGN_UP_PASSWORD);
      } else {
        Get.dialog(Popup(
          content: [
            Text(
              'Este e-mail já está vinculado a uma conta. '
              'Por favor, faça o login ou insira outro'
              ' e-mail para cadastro.',
              textAlign: TextAlign.center,
              style: bodyRegular.copyWith(
                color: textHigh,
              ),
            )
          ],
          actions: [
            PrimaryButton(
                onTap: () {
                  Get.close(2);
                  Get.toNamed(Routes.SIGN_IN);
                },
                text: 'Fazer login'),
            SecondaryButton(
                onTap: () {
                  Get.back();
                },
                text: 'Alterar dados')
          ],
        ));
      }
    } catch (e) {
      showConnectionErrorSnackBar(initialMarginBottom: SnackbarController.snackbarMargin);
    }

    isLoading.value = false;
  }

  resendCode() async {
    sendCode();
    _showPopup();
  }

  passwordSubmit() {
    Get.toNamed(Routes.SIGN_UP_ACCESS_KEY);
  }

  retryPasswordflow() async {
    Get.back();
    finishPasswordFlow();
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
            text: 'OK',
          )
        ],
      ),
    );
  }

  @override
  finishPasswordFlow() {
    // TODO: implement finishPasswordFlow
    throw UnimplementedError();
  }

  @override
  sendCode() {
    // TODO: implement sendCode
    throw UnimplementedError();
  }
}
