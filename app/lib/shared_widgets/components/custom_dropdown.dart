import 'package:flutter/material.dart';

import 'package:app/theme/app_theme.dart';
import 'package:app/theme/icons/app_icons.dart';

class CustomDropdownField extends StatelessWidget {
  final Function onChanged;
  final Color backgroundColor;
  final Color borderColor;
  final String hint;
  final String errorText;
  final String initialValue;
  final Color hintColor;
  final List<String> listText;
  final Color listTextColor;
  final Color arrowColor;
  final Color errorColor;
  final Function validator;
  final String value;

  CustomDropdownField({
    @required this.onChanged,
    @required this.hint,
    @required this.listText,
    Color backgroundColor,
    Color borderColor,
    Color hintColor,
    Color listTextColor,
    Color arrowColor,
    Color errorColor,
    this.validator,
    this.errorText,
    this.initialValue,
    this.value,
  })  : backgroundColor = backgroundColor ?? primaryColor,
        borderColor = borderColor ?? disabledColor,
        hintColor = hintColor ?? textHigh,
        listTextColor = listTextColor ?? accentColor,
        arrowColor = arrowColor ?? accentColor,
        errorColor = errorColor ?? error;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      icon: Icon(AppIcons.chevron_down, color: accentColor, size: 16),
      hint: Text(
        hint,
        style: bodyRegular.copyWith(color: hintColor),
      ),
      decoration: InputDecoration(
        fillColor: backgroundColor,
        filled: true,
        errorText: errorText,
        contentPadding: EdgeInsets.all(12),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: borderColor, width: 1)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: errorColor, width: 1)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: errorColor, width: 1)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: borderColor, width: 1)),
        errorStyle: captionBold.copyWith(color: errorColor),
      ),
      items: listText.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: bodyBold.copyWith(color: listTextColor),
          ),
        );
      }).toList(),
      value: initialValue,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
