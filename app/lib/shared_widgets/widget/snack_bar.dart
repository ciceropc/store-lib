import 'package:flutter/material.dart';

import 'package:flushbar/flushbar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

import 'package:app/routes/app_routes.dart';
import 'package:app/theme/app_theme.dart';
import 'package:app/theme/icons/app_icons.dart';

class SnackbarController {
  static double marginInitialValue = 60;
  static double currentMarginBottom = 60;
  static int index = 0;

  static const snackbarMargin = 8.0;
  static const snackbarMarginWithNavigationBar = 60.0;
  static const snackbarNextPositionHeight = 60.0;
  static const snackbarMarginWithCartBottomBar = 80.0;
}

showNotificationSnackBar(int id, String title, String body, Map<String, dynamic> destination) {
  Flushbar(
    margin: EdgeInsets.all(8),
    isDismissible: true,
    borderRadius: 8,
    shouldIconPulse: false,
    backgroundColor: textHigh,
    flushbarStyle: FlushbarStyle.FLOATING,
    onStatusChanged: (status) {
      if (status == FlushbarStatus.IS_APPEARING) {
        SnackbarController.currentMarginBottom += SnackbarController.snackbarNextPositionHeight;
        SnackbarController.index++;
      } else if (status == FlushbarStatus.IS_HIDING) {
        SnackbarController.currentMarginBottom -= SnackbarController.snackbarNextPositionHeight;
        SnackbarController.index--;
      } else if (status == FlushbarStatus.DISMISSED) {
        SnackbarController.index = 0;
      }
    },
    onTap: (_) {
      if (destination != null) AppRoutes.redirectFromNotification(destination);
    },
    flushbarPosition: FlushbarPosition.TOP,
    duration: Duration(seconds: 3),
    dismissDirection: FlushbarDismissDirection.HORIZONTAL,
    messageText: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          AppIcons.notifications_active,
          color: Colors.white,
          size: 24,
        ),
        SizedBox(
          width: 7,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title ?? 'Notificação',
              style: captionBold.copyWith(
                color: primaryColor,
              ),
            ),
            Text(
              body ?? 'Há novidades para você!',
              style: captionBold.copyWith(
                color: primaryColor,
              ),
            ),
          ],
        ),
      ],
    ),
  ).show(Get.context);
}

showConnectionErrorSnackBar({double initialMarginBottom: SnackbarController.snackbarMarginWithNavigationBar}) {
  if (SnackbarController.index == 0) {
    SnackbarController.currentMarginBottom = initialMarginBottom;
  }
  Flushbar(
    margin: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: SnackbarController.currentMarginBottom),
    isDismissible: true,
    borderRadius: 8,
    shouldIconPulse: false,
    backgroundColor: textHigh,
    flushbarStyle: FlushbarStyle.FLOATING,
    onStatusChanged: (status) {
      if (status == FlushbarStatus.IS_APPEARING) {
        SnackbarController.currentMarginBottom += SnackbarController.snackbarNextPositionHeight;
        SnackbarController.index++;
      } else if (status == FlushbarStatus.IS_HIDING) {
        SnackbarController.currentMarginBottom -= SnackbarController.snackbarNextPositionHeight;
        SnackbarController.index--;
      } else if (status == FlushbarStatus.DISMISSED) {
        SnackbarController.currentMarginBottom = initialMarginBottom;
        SnackbarController.index = 0;
      }
    },
    flushbarPosition: FlushbarPosition.BOTTOM,
    duration: Duration(seconds: 3),
    dismissDirection: FlushbarDismissDirection.HORIZONTAL,
    messageText: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.wifi_off,
          color: Colors.white,
          size: 24,
        ),
        SizedBox(
          width: 7,
        ),
        Expanded(
          child: Text(
            'Sem conexão com a Internet',
            style: captionBold.copyWith(
              color: primaryColor,
            ),
          ),
        ),
      ],
    ),
  ).show(Get.context);
}

showErrorSnackBar(String text,
    {double initialMarginBottom: SnackbarController.snackbarMarginWithNavigationBar, int addSpacingHeigth = 0}) {
  if (SnackbarController.index == 0) {
    SnackbarController.currentMarginBottom = initialMarginBottom;
  }
  Flushbar(
    margin: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: SnackbarController.currentMarginBottom),
    isDismissible: true,
    borderRadius: 8,
    shouldIconPulse: false,
    backgroundColor: textHigh,
    flushbarPosition: FlushbarPosition.BOTTOM,
    duration: Duration(seconds: 6),
    dismissDirection: FlushbarDismissDirection.HORIZONTAL,
    onStatusChanged: (status) {
      if (status == FlushbarStatus.IS_APPEARING) {
        SnackbarController.currentMarginBottom += SnackbarController.snackbarNextPositionHeight + addSpacingHeigth;
        SnackbarController.index++;
      } else if (status == FlushbarStatus.IS_HIDING) {
        SnackbarController.currentMarginBottom -= SnackbarController.snackbarNextPositionHeight + addSpacingHeigth;
        SnackbarController.index--;
      } else if (status == FlushbarStatus.DISMISSED) {
        SnackbarController.currentMarginBottom = initialMarginBottom;
        SnackbarController.index = 0;
      }
    },
    messageText: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/icons/alert_error_outline.svg',
          height: 24,
        ),
        SizedBox(
          width: 7,
        ),
        Expanded(
          child: Text(
            text,
            style: captionBold.copyWith(
              color: primaryColor,
            ),
          ),
        ),
      ],
    ),
  ).show(Get.context);
}

showGenericSnackBar(Widget icon, String text,
    {double initialMarginBottom: SnackbarController.snackbarMarginWithNavigationBar, int duration = 3}) {
  if (SnackbarController.index == 0) {
    SnackbarController.currentMarginBottom = initialMarginBottom;
  }
  Flushbar(
    margin: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: SnackbarController.currentMarginBottom),
    isDismissible: true,
    borderRadius: 8,
    shouldIconPulse: false,
    backgroundColor: textHigh,
    flushbarPosition: FlushbarPosition.BOTTOM,
    duration: Duration(seconds: duration),
    dismissDirection: FlushbarDismissDirection.HORIZONTAL,
    onStatusChanged: (status) {
      if (status == FlushbarStatus.IS_APPEARING) {
        SnackbarController.currentMarginBottom += SnackbarController.snackbarNextPositionHeight;
        SnackbarController.index++;
      } else if (status == FlushbarStatus.IS_HIDING) {
        SnackbarController.currentMarginBottom -= SnackbarController.snackbarNextPositionHeight;
        SnackbarController.index--;
      } else if (status == FlushbarStatus.DISMISSED) {
        SnackbarController.currentMarginBottom = initialMarginBottom;
        SnackbarController.index = 0;
      }
    },
    messageText: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        icon,
        SizedBox(
          width: 7,
        ),
        Expanded(
            child: HtmlWidget(
          text,
          textStyle: captionBold.copyWith(
            color: Colors.white,
          ),
        )),
      ],
    ),
  ).show(Get.context);
}
