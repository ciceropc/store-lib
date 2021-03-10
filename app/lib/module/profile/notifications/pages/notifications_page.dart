import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:app/module/profile/notifications/controller/notifications_controller.dart';
import 'package:app/module/profile/notifications/widgets/notification_card.dart';
import 'package:app/routes/app_routes.dart';
import 'package:app/shared_widgets/widget/app_bar/label_app_bar.dart';
import 'package:app/theme/app_theme.dart';
import 'package:app/theme/icons/app_icons.dart';

class NotificationsPage extends GetView<NotificationsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LabelAppBar(
        title: 'Notificações',
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Obx(
            () => Column(
              children: [
                _buildEnableNotificationSection(),
                SizedBox(height: 16),
                controller.notificationService.isNotificationPermissionEnabled.value &&
                        controller.localStorageService.listOfLocalNotifications.length > 0
                    ? ListView(
                        shrinkWrap: true,
                        children: controller.localStorageService.listOfLocalNotifications
                            .map((notification) => Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: NotificationCard(
                                    notificationTitle: notification.title,
                                    notificationBody: notification.body,
                                    onTap: () => AppRoutes.redirectFromNotification(notification.destination),
                                  ),
                                ))
                            .toList(),
                      )
                    : _buildEmptyList(controller.notificationService.isNotificationPermissionEnabled.value),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyList(bool isNotificationsEnabled) {
    return Column(
      children: [
        SizedBox(
          height: 30,
          width: Get.size.width,
        ),
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: disabledColor,
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: Center(
            child: Icon(
              AppIcons.notifications_off,
              color: textLow,
              size: 40,
            ),
          ),
        ),
        SizedBox(height: 20),
        Text(
          "Nenhuma novidade\npor enquanto",
          style: bodyBold.copyWith(
            color: textLow,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        isNotificationsEnabled
            ? Container()
            : Text(
                "Ative suas notificações para\nvisualizar as últimas novidades",
                style: captionMedium,
                textAlign: TextAlign.center,
              ),
      ],
    );
  }

  Widget _buildEnableNotificationSection() {
    return Column(
      children: [
        SizedBox(height: 24.0),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            color: primaryColor,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Permitir notificações',
                style: bodyMedium.copyWith(color: textHigh),
              ),
              Switch(
                materialTapTargetSize: MaterialTapTargetSize.padded,
                onChanged: (value) async {
                  if (!controller.notificationService.isNotificationPermissionEnabled.value && value) {
                    controller.requestNotificationPermission();
                    Get.close(1);
                  } else {
                    controller.notificationService.isNotificationPermissionEnabled.value = await openAppSettings();
                    Get.close(1);
                  }
                },
                value: controller.notificationService.isNotificationPermissionEnabled.value,
                inactiveThumbColor: textLow,
                inactiveTrackColor: disabledColor,
                activeColor: secondaryColor,
              ),
            ],
          ),
        )
      ],
    );
  }
}
