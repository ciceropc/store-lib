import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:app/theme/app_theme.dart' as theme;

class DestructiveButton extends StatelessWidget {
  DestructiveButton({
    @required this.onTap,
    @required this.text,
    Color borderColor,
    Color textColor,
    Color backgroundColor,
    Color disabledColor,
    this.padding: const EdgeInsets.symmetric(vertical: 16),
    this.icon,
    this.svgIconPath,
    this.disabledTextColor,
    this.iconSize = 16.0,
    this.spaceIcon = 5.0,
    this.borderRadius = 8.0,
  })  : backgroundColor = backgroundColor ?? Colors.transparent,
        borderColor = borderColor ?? theme.error,
        textColor = textColor ?? theme.error,
        disabledColor = disabledColor ?? theme.disabledColor;

  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  final Color disabledColor;
  final Color borderColor;
  final Color disabledTextColor;
  final Function onTap;
  final Color textColor;
  final IconData icon;
  final double iconSize;
  final double spaceIcon;
  final double borderRadius;
  final String text;
  final String svgIconPath;

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      padding: padding,
      borderSide: BorderSide(color: borderColor, width: 1),
      highlightedBorderColor: borderColor,
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      onPressed: onTap,
      textColor: textColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon != null ? Icon(icon, size: iconSize) : Container(),
          svgIconPath != null ? SvgPicture.asset(svgIconPath, height: iconSize) : Container(),
          SizedBox(width: spaceIcon),
          Text(
            text,
            style: theme.button,
          ),
        ],
      ),
    );
  }
}
