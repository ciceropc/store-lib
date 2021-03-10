import 'package:flutter/material.dart';

import 'package:get/route_manager.dart';

import 'package:app/theme/app_theme.dart';
import 'package:app/theme/icons/app_icons.dart';

class LabelAppBar extends AppBar {
  LabelAppBar({
    String title: '',
    List<Widget> actions,
    Color backgroundColor,
    bool centerTitle: false,
    Color titleColor,
    Color leadingColor,
    Brightness brightness,
    Function onBackPressed,
    bool showBackButtom: true,
  }) : super(
          leading: showBackButtom
              ? IconButton(
                  icon: Icon(
                    AppIcons.arrow_back_nv,
                    color: leadingColor ?? accentColor,
                    size: 24,
                  ),
                  onPressed: onBackPressed == null ? () => Get.back() : () => onBackPressed(),
                )
              : null,
          title: AnimatedOpacity(
            opacity: title == '' ? 0 : 1,
            duration: Duration(milliseconds: 300),
            child: Text(
              title,
              style: bodyBold.copyWith(color: titleColor ?? textHigh),
            ),
          ),
          brightness: brightness,
          centerTitle: centerTitle,
          titleSpacing: showBackButtom ? 0 : 16,
          backgroundColor: backgroundColor,
          elevation: 0,
          actions: actions,
        );
}
