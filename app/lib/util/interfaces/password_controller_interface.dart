import 'package:get/get.dart';

abstract class PasswordControllerInterface {
  final email = ''.obs;
  final emailErrorMessage = RxString();
  final codeErrorMessage = RxString();

  final password = ''.obs;
  final passwordConfirm = ''.obs;

  final validationCode = 0.obs;

  final obscurePassword = true.obs;
  final obscurePasswordConfirm = true.obs;

  final isLoading = false.obs;

  passwordSubmit();
  sendCode();
  resendCode();
  finishPasswordFlow();
}
