import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class ProfileController extends GetxController {
  final isLogged = false.obs;
  final isLoading = false.obs;
  final errorMessage = RxString();
  final userFirstName = ''.obs;
  final userLastName = ''.obs;
  final userGender = ''.obs;
  ProfileController() {}

  @override
  void onInit() {
    super.onInit();
  }

  void checkUser() async {
    isLoading.value = true;
    errorMessage.nil();

    try {} catch (e) {
      errorMessage.value = 'Erro ao encontrar um usuário';
    }
    isLoading.value = false;
  }

  void unassignUser() async {}
}
