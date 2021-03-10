import 'package:get/instance_manager.dart';

import 'package:app/module/profile/personal_informations/controller/personal_informations_controller.dart';

class PersonalInformationsBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(PersonalInformationsController());
  }
}
