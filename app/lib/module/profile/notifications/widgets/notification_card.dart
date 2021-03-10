import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:app/theme/app_theme.dart';

class NotificationCard extends StatelessWidget {
  final String notificationTitle;
  final String notificationBody;
  final Function onTap;

  const NotificationCard({this.notificationTitle, this.notificationBody, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: primaryColor,
          border: Border.all(
            width: 1.0,
            color: disabledColor,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/icons/notifications_active.svg',
              color: textHigh,
              width: 18,
              height: 18,
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notificationTitle,
                    style: bodyBold.copyWith(color: textHigh),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    notificationBody,
                    style: captionRegular.copyWith(color: textMedium),
                    textAlign: TextAlign.start,
                    maxLines: 3,
                    overflow: TextOverflow.clip,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
