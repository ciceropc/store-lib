import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import 'package:app/routes/app_routes.dart';
import 'package:app/shared_widgets/widget/snack_bar.dart';
import 'package:app/theme/app_theme.dart';
import 'package:app/util/firebase_analytics.dart';

class SignInController extends GetxController {
  final email = ''.obs;
  final password = ''.obs;
  final errorMessage = RxString();
  final errorPasswordMessage = RxString();

  final isLoading = false.obs;

  SignInController() {}

  final shouldObscurePassword = true.obs;

  void toogleObscurePassword() {
    shouldObscurePassword.value = !shouldObscurePassword.value;
  }

  void signIn(Function action) async {
    errorMessage.nil();
    errorPasswordMessage.nil();
    isLoading.value = true;

    try {
      final response = null;
      //await _repository.signIn(email.value, password.value);

      if (response.authStatus == 'InvalidEmail' || response.authStatus == 'WrongCredentials') {
        errorMessage.value = 'Usuário ou senha inválidos.';
        errorPasswordMessage.value = 'Usuário ou senha inválidos.';
        FirebaseAnalyticsService.logError('perfil', 'login');
      } else if (response.authStatus == 'BlockedUser') {
        showGenericSnackBar(SvgPicture.asset('assets/icons/lock.svg', width: 24, height: 24, color: primaryColor),
            'Você ultrapassou o limite de tentativas de login. Aguarde uma hora para acessar novamente.',
            initialMarginBottom: SnackbarController.snackbarMargin, duration: 5);
      } else if (response.authStatus == 'Success') {
        action();
      }
    } catch (e) {
      Get.toNamed(Routes.SIGN_IN_ERROR);
    }

    isLoading.value = false;
  }
}
