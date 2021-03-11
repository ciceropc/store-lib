import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import 'package:app/module/profile/controller/profile_controller.dart';
import 'package:app/module/profile/pages/choose_sign_page.dart';
import 'package:app/module/profile/personal_informations/bindings/personal_informations_binding.dart';
import 'package:app/module/profile/personal_informations/pages/personal_informations_page.dart';

import 'package:app/routes/app_routes.dart';
import 'package:app/shared_widgets/components/destructive_button.dart';
import 'package:app/shared_widgets/components/list_button.dart';
import 'package:app/shared_widgets/components/secondary_button.dart';
import 'package:app/shared_widgets/widget/loading.dart';
import 'package:app/shared_widgets/widget/popup.dart';
import 'package:app/theme/app_theme.dart';
import 'package:app/theme/icons/app_icons.dart';
//import 'package:app/util/firebase_analytics.dart';

class ProfilePage extends GetView<ProfileController> {
  // final ReviewController reviewController = Get.find();

  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return Obx(() {
      return controller.isLogged.value ? _buildProfileBody() : ChooseSignPage();
    });
  }

  Scaffold _buildProfileBody() {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          AppIcons.smiley_face,
          color: appThemeData.disabledColor,
          size: 24,
        ),
        centerTitle: false,
        titleSpacing: 0,
        title: Text(
          controller.userFirstName.value.isEmpty ? 'Perfil' : _buildGreetingMessage(),
          style: bodyBold,
          textAlign: TextAlign.start,
        ),
        elevation: 0,
      ),
      body: Container(
        color: backgroundColor,
        child: Obx(() {
          return controller.isLoading.value
              ? Center(
                  child: LoadingAnimatedIcon(
                    isLoading: controller.isLoading.value,
                  ),
                )
              : ListView(
                  padding: EdgeInsets.all(10),
                  children: [
                    Container(
                      width: Get.width,
                      padding: const EdgeInsets.only(top: 24.0, bottom: 10.0),
                      child: Text(
                        'Seus dados',
                        style: bodyMedium.copyWith(fontSize: 20.0, color: textMedium),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(height: 10),
                    ListButton(
                        title: 'Informações pessoais',
                        onTap: () {
                          //FirebaseAnalyticsService.logClick('perfil', 'informações_pessoais');
                          Get.to(PersonalInformationsPage(), binding: PersonalInformationsBindings());
                        },
                        leadingPathSvg: 'assets/icons/person_outline.svg'),
                    SizedBox(height: 10),
                    ListButton(
                        title: 'Alterar senha',
                        onTap: () {
                          //FirebaseAnalyticsService.logClick('perfil', 'alterar_senha');
                          Get.toNamed(Routes.RESET_PASSWORD);
                        },
                        leadingPathSvg: 'assets/icons/lock.svg'),
                    SizedBox(height: 10),
                    ListButton(
                      title: 'Endereços cadastrados',
                      onTap: () {
                        //FirebaseAnalyticsService.logClick('perfil', 'endereços_cadastrados');
                        Get.toNamed(Routes.USER_ADDRESS);
                      },
                      leadingPathSvg: 'assets/icons/pin-outline.svg',
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: Get.width,
                      padding: const EdgeInsets.only(top: 24.0, bottom: 10.0),
                      child: Text(
                        'Configurações',
                        style: bodyMedium.copyWith(fontSize: 20.0, color: textMedium),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    ListButton(
                      title: 'Notificações',
                      onTap: () {
                        //FirebaseAnalyticsService.logClick('perfil', 'notificações');
                        Get.toNamed(Routes.NOTIFICATION_HISTORY);
                      },
                      leadingPathSvg: 'assets/icons/notifications.svg',
                    ),
                    SizedBox(height: 24),
                    SecondaryButton(
                      onTap: () => Get.dialog(Popup(
                        actions: [
                          DestructiveButton(
                            onTap: () {
                              //FirebaseAnalyticsService.logClick('perfil', 'sair');
                              controller.unassignUser();
                              Get.close(0);
                            },
                            text: 'Sair',
                          ),
                          SecondaryButton(
                            onTap: () => Get.close(0),
                            text: 'Cancelar',
                            borderColor: Colors.transparent,
                            textColor: accentColor,
                          )
                        ],
                        content: [
                          Text(
                            'Tem certeza que\n deseja sair da sua conta?',
                            style: bodyBold,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )),
                      text: 'Sair',
                      textColor: error,
                      borderColor: Colors.transparent,
                    ),
                  ],
                );
        }),
      ),
    );
  }

  String _buildGreetingMessage() {
    return '${controller.userGender.value == 'female' ? 'Bem-vinda' : 'Bem-vindo'}, '
        '${controller.userFirstName.value}';
  }
}
