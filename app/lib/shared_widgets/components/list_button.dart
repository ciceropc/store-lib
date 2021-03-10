import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:app/theme/app_theme.dart';

class ListButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final String text;
  final IconData trailing;
  final Widget widgetButtonTitle;
  final EdgeInsets padding;
  final double paddingHorizontal;
  final double height;
  final IconData leading;
  final String leadingPathSvg;

  ListButton({
    @required this.title,
    this.onTap,
    this.text,
    this.trailing = Icons.keyboard_arrow_right,
    this.padding,
    this.height = 56,
    this.leading,
    this.widgetButtonTitle,
    this.paddingHorizontal = 19,
    this.leadingPathSvg,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding ?? EdgeInsets.symmetric(horizontal: paddingHorizontal),
        height: height,
        decoration: BoxDecoration(
          color: appThemeData.primaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (leading != null)
              Icon(
                leading,
                color: textHigh,
                size: 24,
              ),
            if (leadingPathSvg != null)
              SvgPicture.asset(
                leadingPathSvg,
                width: 24,
                height: 24,
                color: textHigh,
              ),
            SizedBox(width: 10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: bodyMedium.copyWith(color: textHigh),
                    ),
                  ),
                  text != null
                      ? Text(
                          text,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: captionRegular.copyWith(color: textMedium),
                        )
                      : Container(),
                ],
              ),
            ),
            SizedBox(width: 10),
            Icon(
              trailing,
              color: appThemeData.accentColor,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
