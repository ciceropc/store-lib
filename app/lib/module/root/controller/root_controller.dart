import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import 'package:app/module/home/pages/home_page.dart';
import 'package:app/module/profile/pages/profile_page.dart';

class RootController extends GetxController {
  final currentIndex = 0.obs;

  final _pages = [
    HomePage(),
    ProfilePage(),
  ];

  Widget get currentPage => _pages[currentIndex.value];

  void changePage(int _index) {
    currentIndex.value = _index;
  }
}
