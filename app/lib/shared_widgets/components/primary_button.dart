import 'package:flutter/material.dart';

import 'package:app/theme/app_theme.dart' as theme;

class PrimaryButton extends StatelessWidget {
  PrimaryButton({
    @required this.onTap,
    @required this.text,
    Color textColor,
    Color backgroundColor,
    Color disabledColor,
    this.padding: const EdgeInsets.symmetric(vertical: 16),
    this.disabledTextColor,
    this.icon,
    this.iconSize: 16.0,
    this.spaceIcon: 5.0,
    this.borderRadius: 8.0,
  })  : backgroundColor = backgroundColor ?? theme.accentColor,
        textColor = textColor ?? theme.primaryColor,
        disabledColor = disabledColor ?? theme.accentColor;

  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  final Color disabledColor;
  final Color disabledTextColor;
  final Function onTap;
  final Color textColor;
  final IconData icon;
  final double iconSize;
  final double spaceIcon;
  final double borderRadius;
  final String text;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: padding,
      disabledColor: disabledColor,
      disabledTextColor: disabledTextColor,
      color: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
      onPressed: onTap,
      textColor: textColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon != null
              ? Icon(
                  icon,
                  size: iconSize,
                  color: onTap != null ? theme.primaryColor : disabledTextColor,
                )
              : Container(),
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
