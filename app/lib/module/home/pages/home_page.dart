import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:lottie/lottie.dart';

import 'package:app/module/home/controller/home_controller.dart';
import 'package:app/shared_widgets/components/primary_button.dart';
import 'package:app/shared_widgets/widget/loading.dart';
import 'package:app/theme/app_theme.dart';
import 'package:app/theme/icons/app_icons.dart';
import 'package:app/theme/widgets_styles.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(
          () {
            return Container(
              width: Get.width,
              height: Get.height - bottomNavigationBarHeight,
              decoration: BoxDecoration(gradient: blueGradient),
              padding: const EdgeInsets.symmetric(horizontal: 55.0),
              child: Stack(
                children: [
                  if (controller.isLoading.value)
                    Center(child: LoadingAnimatedIcon())
                  else
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'No que podemos ajudá-lo?',
                          style: headlineMedium.copyWith(color: primaryColor),
                        ),
                        SizedBox(height: 34.0),
                        PrimaryButton(onTap: () {}, text: 'Abra seu chamado')
                      ],
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
