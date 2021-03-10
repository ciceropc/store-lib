import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:lottie/lottie.dart';

import 'package:app/module/home/controller/home_controller.dart';
import 'package:app/shared_widgets/components/primary_button.dart';
import 'package:app/shared_widgets/widget/app_bar/search_cart_app_bar.dart';
import 'package:app/shared_widgets/widget/loading.dart';
import 'package:app/theme/app_theme.dart';
import 'package:app/theme/icons/app_icons.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchCartAppBar(
        fromPage: 'home',
        body: SingleChildScrollView(
          child: Obx(
            () {
              return Container(
                width: Get.width,
                height: Get.height - 180,
                padding: const EdgeInsets.symmetric(horizontal: 55.0),
                child: Stack(
                  children: [
                    if (controller.isLoading.value)
                      Center(child: LoadingNV())
                    else
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Spacer(),
                          Container(
                            height: 76.0,
                            width: 76.0,
                            padding: const EdgeInsets.only(bottom: 24.0),
                            child: Lottie.asset(
                              'assets/anim/error.json',
                              repeat: false,
                              width: 76.0,
                            ),
                          ),
                          Text(
                            'Ops! Tivemos um problema.',
                            style: headlineBold,
                            textAlign: TextAlign.center,
                          ),
                          Spacer(),
                          PrimaryButton(
                            icon: AppIcons.refresh_nv,
                            text: 'Recarregar',
                            onTap: () => {},
                          ),
                          SizedBox(height: 55.0),
                        ],
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
