import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:app/theme/app_theme.dart';
import 'package:app/theme/icons/app_icons.dart';

class AppBarBackButton extends StatelessWidget {
  AppBarBackButton();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.back(),
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Icon(
        AppIcons.arrow_nv,
        color: appThemeData.accentColor,
        size: 24,
      ),
    );
  }
}
