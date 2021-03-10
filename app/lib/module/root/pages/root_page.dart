import 'package:flutter/material.dart';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:app/module/root/controller/root_controller.dart';
import 'package:app/theme/app_theme.dart';
import 'package:app/theme/icons/app_icons.dart';

// ignore: must_be_immutable
class RootPage extends GetView<RootController> {
  var argument = Get.arguments ?? 0;

  Future handleDynamicLinks() async {
    final PendingDynamicLinkData data = await FirebaseDynamicLinks.instance.getInitialLink();

    _handleDeepLink(data);

    FirebaseDynamicLinks.instance.onLink(onSuccess: (PendingDynamicLinkData dynamicLink) async {
      _handleDeepLink(dynamicLink);
    }, onError: (OnLinkErrorException e) async {
      print('Link Failed: ${e.message}');
    });
  }

  void _handleDeepLink(PendingDynamicLinkData data) {
    final Uri deepLink = data?.link;
    if (deepLink != null) {
      if (deepLink.queryParameters.containsKey('id')) {
        String id = deepLink.queryParameters['id'];
        // Get.to(PdpPage(
        //   productId: id,
        // ));
      }
      print('_handleDeepLink | deeplink: $deepLink');
    }
  }

  @override
  Widget build(BuildContext context) {
    handleDynamicLinks();

    if (argument != 0) {
      Future.delayed(Duration(milliseconds: 10)).then((value) {
        controller.changePage(argument);
      });
    }

    return Obx(
      () => WillPopScope(
        onWillPop: () async {
          if (controller.currentIndex.value == 0) {
            return true;
          } else {
            controller.changePage(0);
            return false;
          }
        },
        child: Scaffold(
          body: controller.currentPage,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            unselectedItemColor: textLow,
            selectedItemColor: accentColor,
            unselectedLabelStyle: overline.copyWith(
              fontWeight: FontWeight.w600,
            ),
            selectedLabelStyle: overline.copyWith(
              fontWeight: FontWeight.w600,
            ),
            onTap: controller.changePage,
            items: [
              BottomNavigationBarItem(
                label: "home".tr,
                icon: Icon(AppIcons.home_outline_nv),
                activeIcon: Icon(AppIcons.home_outline_nv_1),
              ),
              BottomNavigationBarItem(
                label: "perfil".tr,
                icon: Icon(AppIcons.person_outline_nv),
                activeIcon: Icon(AppIcons.person_nv),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
