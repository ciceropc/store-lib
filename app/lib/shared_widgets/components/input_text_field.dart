import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:app/theme/app_theme.dart';

class InputTextFormField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String errorMessage;
  final String initialValue;
  final bool enabled;
  final TextCapitalization textCapitalization;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final bool autocorrect;
  final bool autofocus;
  final int maxLength;
  final int maxLines;
  final Function onSaved;
  final Function onChanged;
  final Function onFieldSubmitted;
  final Function onTap;
  final Function validator;
  final List<TextInputFormatter> inputFormatters;
  final Widget suffixIcon;
  final Widget preffixIcon;
  final bool obscureText;
  final bool outlineBorder;
  final BorderRadius borderRadius;

  final Color backgroundColor;
  final Color backgroundColorDisabled;
  final Color borderColor;
  final Color borderColorFocus;
  final Color borderColorError;
  final Color borderColorDisabled;
  final Color textColor;
  final Color textLabelColor;
  final Color textColorDisabled;
  final Color textColorErrorMessage;
  final TextStyle style;
  final TextEditingController controller;

  InputTextFormField({
    this.labelText,
    this.hintText,
    this.errorMessage,
    this.enabled = true,
    this.textCapitalization = TextCapitalization.none,
    this.textInputType,
    this.textInputAction,
    this.autofocus = false,
    this.autocorrect = true,
    this.maxLength,
    this.maxLines: 1,
    this.onSaved,
    this.onChanged,
    this.onFieldSubmitted,
    this.onTap,
    this.validator,
    this.obscureText = false,
    this.outlineBorder = false,
    this.inputFormatters,
    this.suffixIcon,
    this.preffixIcon,
    this.controller,
    this.style,
    BorderRadius borderRadius,
    Color backgroundColor,
    Color backgroundColorDisabled,
    Color borderColor,
    Color borderColorFocus,
    Color borderColorError,
    Color borderColorDisabled,
    Color textColor,
    Color textLabelColor,
    Color textColorDisabled,
    Color textColorErrorMessage,
    this.initialValue,
  })  : backgroundColor = backgroundColor ?? primaryColor,
        backgroundColorDisabled = backgroundColorDisabled ?? disabledColor,
        borderRadius = borderRadius ?? BorderRadius.circular(8),
        borderColor = borderColor ?? primaryColor,
        borderColorFocus = borderColorFocus ?? secondaryColor,
        borderColorError = borderColorError ?? error,
        borderColorDisabled = borderColorDisabled ?? disabledColor,
        textColor = textColor ?? textHigh,
        textColorDisabled = textColorDisabled ?? labelColor,
        textColorErrorMessage = textColorErrorMessage ?? error,
        textLabelColor = textLabelColor ?? labelColor;

  @override
  Widget build(BuildContext context) {
    final _borderRadius = BorderRadius.circular(8);
    return TextFormField(
      controller: controller,
      onTap: onTap,
      initialValue: initialValue,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        labelStyle: bodyRegular.copyWith(color: textLabelColor),
        filled: true,
        fillColor: enabled ? backgroundColor : disabledColor,
        hintStyle: captionRegular.copyWith(color: textLow),
        enabled: enabled,
        errorText: errorMessage,
        errorMaxLines: 4,
        errorStyle: captionBold.copyWith(color: textColorErrorMessage),
        suffixIcon: suffixIcon,
        border: outlineBorder
            ? OutlineInputBorder(
                borderRadius: _borderRadius,
                borderSide: BorderSide(color: disabledColor),
              )
            : UnderlineInputBorder(
                borderRadius: _borderRadius,
                borderSide: BorderSide(color: Colors.transparent),
              ),
        enabledBorder: outlineBorder
            ? OutlineInputBorder(
                borderRadius: _borderRadius,
                borderSide: BorderSide(color: disabledColor),
              )
            : UnderlineInputBorder(
                borderRadius: _borderRadius,
                borderSide: BorderSide(color: Colors.transparent),
              ),
        focusedBorder: outlineBorder
            ? OutlineInputBorder(
                borderRadius: _borderRadius,
                borderSide: BorderSide(color: borderColorFocus),
              )
            : UnderlineInputBorder(
                borderRadius: _borderRadius,
                borderSide: BorderSide(color: borderColorFocus, width: 2),
              ),
        errorBorder: outlineBorder
            ? OutlineInputBorder(
                borderRadius: _borderRadius,
                borderSide: BorderSide(color: borderColorError),
              )
            : UnderlineInputBorder(
                borderRadius: _borderRadius,
                borderSide: BorderSide(color: borderColorError, width: 2),
              ),
        focusedErrorBorder: outlineBorder
            ? OutlineInputBorder(
                borderRadius: _borderRadius,
                borderSide: BorderSide(color: borderColorError),
              )
            : UnderlineInputBorder(
                borderRadius: _borderRadius,
                borderSide: BorderSide(color: borderColorError, width: 2),
              ),
        disabledBorder: outlineBorder
            ? OutlineInputBorder(
                borderRadius: _borderRadius,
                borderSide: BorderSide(color: borderColorDisabled),
              )
            : UnderlineInputBorder(
                borderRadius: _borderRadius,
                borderSide: BorderSide(color: borderColorDisabled, width: 2),
              ),
      ),
      maxLength: maxLength,
      inputFormatters: inputFormatters,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      style: style ?? bodyRegular.copyWith(color: textColor),
      keyboardType: textInputType,
      onSaved: onSaved,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      autocorrect: autocorrect,
      autofocus: autofocus,
      obscureText: obscureText,
    );
  }
}
