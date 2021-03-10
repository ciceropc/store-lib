import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:logging/logging.dart';
import 'package:app/util/logging.dart';

import 'package:app/module/home/data/home_repository.dart';
import 'package:app/module/root/controller/root_controller.dart';
import 'package:app/shared_widgets/widget/card_departament/card_departament_model.dart';
import 'package:app/theme/app_theme.dart';

class HomeController extends GetxController {
  HomeRepository homeRepository;
  List<CardDepartamentModel> departaments = List<CardDepartamentModel>().obs;
  List<Map<String, dynamic>> homeComponents = List<Map<String, dynamic>>().obs;
  List<String> loaded = List<String>();

  RxBool isLoading = false.obs;

  HomeController();

  @override
  void onInit() {
    super.onInit();
    homeRepository = Get.find();
  }

  void changeBottomPage(int index) {
    RootController _rootController = Get.find();
    _rootController.changePage(index);
  }
}
