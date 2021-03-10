import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:app/theme/app_theme.dart' as theme;

class SecondaryButton extends StatelessWidget {
  SecondaryButton({
    @required this.onTap,
    @required this.text,
    this.subtitleText,
    Color backgroundColor,
    Color borderColor,
    Color disabledColor,
    Color iconColor,
    this.svgColor,
    Color textColor,
    this.horizontalAxisAlignment = MainAxisAlignment.center,
    this.padding: const EdgeInsets.symmetric(vertical: 16),
    this.icon,
    this.svgIconPath,
    this.disabledTextColor,
    this.iconSize = 16.0,
    this.spaceIcon = 5.0,
    this.borderRadius = 8.0,
  })  : backgroundColor = backgroundColor ?? Colors.transparent,
        borderColor = borderColor ?? theme.disabledColor,
        iconColor = iconColor ?? textColor ?? theme.textHigh,
        textColor = textColor ?? theme.textHigh,
        disabledColor = disabledColor ?? theme.disabledColor;

  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  final Color disabledColor;
  final Color borderColor;
  final Color disabledTextColor;
  final MainAxisAlignment horizontalAxisAlignment;
  final Function onTap;
  final Color textColor;
  final Color iconColor;
  final Color svgColor;
  final IconData icon;
  final double iconSize;
  final double spaceIcon;
  final double borderRadius;
  final String text;
  final String subtitleText;
  final String svgIconPath;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          color: backgroundColor),
      child: OutlineButton(
        padding: padding,
        borderSide: BorderSide(color: borderColor, width: 1),
        highlightedBorderColor: borderColor,
        disabledBorderColor: borderColor,
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        onPressed: onTap,
        textColor: textColor,
        child: Row(
          mainAxisAlignment: horizontalAxisAlignment,
          children: [
            icon != null ? Icon(icon, size: iconSize, color: iconColor) : Container(),
            svgIconPath != null ? SvgPicture.asset(svgIconPath, height: iconSize, color: svgColor) : Container(),
            SizedBox(width: spaceIcon),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: theme.button,
                ),
                subtitleText != null
                    ? Text(
                        subtitleText,
                        style: theme.captionRegular,
                      )
                    : Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
