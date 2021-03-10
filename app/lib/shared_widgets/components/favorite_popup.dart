import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/theme/app_theme.dart';
import 'package:app/theme/icons/app_icons.dart';

class FavoritePopup extends StatelessWidget {
  final bool isAdd;

  const FavoritePopup({Key key, this.isAdd = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer timer = Timer.periodic(Duration(seconds: 2), (Timer t) {
      t.cancel();
      Get.back();
    });

    return WillPopScope(
      onWillPop: () {
        closePopup(timer);
        return Future.value(false);
      },
      child: GestureDetector(
        onTap: () {
          closePopup(timer);
        },
        onPanStart: (_) {
          closePopup(timer);
        },
        child: Material(
          color: Colors.transparent,
          child: Center(
            child: SizedBox(
              height: 130,
              width: 130,
              child: _buildContent(),
            ),
          ),
        ),
      ),
    );
  }

  void closePopup(Timer timer) {
    timer.cancel();
    Get.back();
  }

  Widget _buildContent() {
    return Container(
      height: 130,
      width: 130,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconPopup(),
            size: 32,
            color: textMedium,
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              textPopup(),
              textAlign: TextAlign.center,
              style: subtitleMedium.copyWith(color: textMedium, fontSize: 17),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: backgroundColor.withAlpha(1000),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
    );
  }

  IconData iconPopup() {
    if (isAdd) {
      return AppIcons.heart_nv;
    } else {
      return AppIcons.heart_outline_nv;
    }
  }

  String textPopup() {
    if (isAdd) {
      return 'Adicionado aos favoritos';
    } else {
      return "Removido dos favoritos";
    }
  }
}
