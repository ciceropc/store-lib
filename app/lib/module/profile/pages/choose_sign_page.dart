import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import 'package:app/module/profile/controller/profile_controller.dart';
import 'package:app/routes/app_routes.dart';
import 'package:app/shared_widgets/components/primary_button.dart';
import 'package:app/shared_widgets/components/secondary_button.dart';
import 'package:app/theme/app_theme.dart';
import 'package:app/util/firebase_analytics.dart';

// ignore: must_be_immutable
class ChooseSignPage extends GetView<ProfileController> {
  var argument = Get.arguments ?? '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          children: [
            Text(
              'Se você ainda não possui uma conta, cadastre-se',
              style: headlineBold,
            ),
            SizedBox(height: 42),
            ..._buildSignButtons(),
            SizedBox(height: 42),
            // _buildDivider(),
            // SizedBox(height: 42),
            //..._buildSocialButtons(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildSignButtons() {
    return [
      PrimaryButton(
        onTap: () {
          FirebaseAnalyticsService.logClick('perfil', 'cadastrar_conta');
          Get.toNamed(Routes.SIGN_UP);
        },
        text: 'Cadastrar conta',
      ),
      SizedBox(height: 8),
      PrimaryButton(
        onTap: () {
          FirebaseAnalyticsService.logClick('perfil', 'entrar_email');
          if (argument == 'fromCart') {
            Get.offNamed(Routes.SIGN_IN, arguments: 'fromCart');
          } else {
            Get.toNamed(Routes.SIGN_IN);
          }
        },
        backgroundColor: backgroundColor,
        textColor: accentColor,
        text: 'Entrar com e-mail',
      ),
    ];
  }

  // ignore: unused_element
  List<Widget> _buildSocialButtons() {
    return [
      SecondaryButton(
        text: 'Entrar com Google',
        svgIconPath: 'assets/icons/google.svg',
        onTap: () {},
      ),
      SizedBox(
        height: 8,
      ),
      SecondaryButton(
        text: 'Entrar com Facebook',
        svgIconPath: 'assets/icons/facebook.svg',
        onTap: () {},
      ),
      SizedBox(
        height: 8,
      ),
      Visibility(
        visible: Platform.isIOS,
        child: SecondaryButton(
          text: 'Entrar com Apple',
          svgIconPath: 'assets/icons/apple.svg',
          onTap: () {},
        ),
      )
    ];
  }

  // ignore: unused_element
  Widget _buildDivider() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            color: textLow,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            'OU',
            style: captionMedium.copyWith(color: textMedium),
          ),
        ),
        Expanded(
          child: Divider(thickness: 1, color: textLow),
        ),
      ],
    );
  }
}
