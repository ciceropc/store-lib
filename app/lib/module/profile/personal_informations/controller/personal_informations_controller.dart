import 'package:get/get.dart';

import 'package:app/module/profile/controller/profile_controller.dart';
import 'package:app/shared_widgets/widget/snack_bar.dart';

class PersonalInformationsController extends GetxController {
  ProfileController _profileController = Get.find();

  var isLoading = false.obs;
  var nameInitials = ''.obs;

  final fullName = ''.obs;
  final cpf = ''.obs;
  final email = ''.obs;
  final phone = ''.obs;
  final gender = ''.obs;
  final optInEmail = false.obs;
  //final optInPhone = false.obs;

  @override
  void onInit() {
    super.onInit();

    if (_profileController.userFirstName.value.isNotEmpty) {
      nameInitials.value += _profileController.userFirstName.value[0].toUpperCase();
    } else {
      nameInitials.value += 'NM';
    }
    var lastNameList = _profileController.userLastName.value.split(' ');

    if (_profileController.userLastName.value.isNotEmpty) {
      nameInitials.value += lastNameList.last[0].toUpperCase();
    }
  }

  updateUserData() async {
    isLoading.value = true;
    try {
      var userData; // = fillAccountModel();
      //await _profileRepository.updateUserData(userData, _profileController.userProfileData.value.id);
      _profileController.onInit();
      Get.close(0);
    } catch (e) {
      showErrorSnackBar('Ocorreu um erro', initialMarginBottom: SnackbarController.snackbarMargin);
    }
    isLoading.value = false;
  }
}
