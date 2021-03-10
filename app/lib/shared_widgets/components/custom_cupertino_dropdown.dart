import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:app/theme/app_theme.dart' as theme;
import 'package:app/theme/icons/app_icons.dart';

typedef void OnPressOKCupertino(String value);

class CustomCupertinoDropdownState {
  String text;
  int index;

  CustomCupertinoDropdownState({
    this.text,
    this.index: 0,
  });
}

// ignore: must_be_immutable
class CustomCupertinoDropdown extends FormField<CustomCupertinoDropdownState> {
  final OnPressOKCupertino onPressedOk;
  final Color backgroundColor;
  final Color borderColor;
  final String hint;
  final String errorText;
  final Color hintColor;
  final List<String> listText;
  final Color listTextColor;
  final Color arrowColor;
  final Color errorColor;
  final BuildContext context;
  final CustomCupertinoDropdownState initialValues;

  CustomCupertinoDropdown({
    @required this.onPressedOk,
    @required this.hint,
    @required this.listText,
    @required this.context,
    this.backgroundColor,
    this.borderColor,
    this.hintColor,
    this.listTextColor,
    this.arrowColor,
    this.errorColor,
    this.errorText,
    FormFieldSetter<CustomCupertinoDropdownState> onSaved,
    FormFieldValidator<CustomCupertinoDropdownState> validator,
    this.initialValues,
  }) : super(
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValues ?? CustomCupertinoDropdownState(),
          builder: (FormFieldState<CustomCupertinoDropdownState> state) {
            var _backgroundColor = backgroundColor ?? theme.primaryColor;
            var _borderColor = borderColor ?? theme.disabledColor;
            var _hintColor = hintColor ?? theme.textHigh;
            var _listTextColor = listTextColor ?? theme.accentColor;
            var _arrowColor = arrowColor ?? theme.accentColor;
            var _errorColor = errorColor ?? theme.error;
            var _selectedIndex = state.value.index;

            return _buildBody(context, state, _errorColor, _borderColor, hint, _hintColor, listText, _listTextColor,
                _backgroundColor, _arrowColor, onPressedOk, _selectedIndex);
          },
        );

  static Column _buildBody(
      BuildContext context,
      FormFieldState<CustomCupertinoDropdownState> state,
      Color _errorColor,
      Color _borderColor,
      String hint,
      Color _hintColor,
      List<String> listText,
      Color listTextColor,
      Color background,
      Color arrowColor,
      OnPressOKCupertino onPressedOk,
      int selectedIndex) {
    var _selectedIndex = selectedIndex;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: background,
              border: Border.all(color: state.hasError ? _errorColor : _borderColor, width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                state.value.text == null
                    ? Text(hint, style: theme.bodyRegular.copyWith(color: _hintColor))
                    : Text(
                        state.value.text,
                        style: theme.bodyBold.copyWith(color: listTextColor),
                      ),
                Icon(AppIcons.chevron_down, color: arrowColor, size: 16),
              ],
            ),
          ),
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    color: Colors.white,
                    child: SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(),
                              CupertinoButton(
                                child: Text("OK"),
                                onPressed: () {
                                  state.reset();
                                  state.didChange(CustomCupertinoDropdownState(
                                      text: listText[_selectedIndex], index: _selectedIndex));
                                  onPressedOk(state.value.text);
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                          Container(
                            height: 100,
                            child: CupertinoPicker(
                              scrollController: FixedExtentScrollController(
                                initialItem: _selectedIndex,
                              ),
                              itemExtent: 32.0,
                              backgroundColor: Colors.white,
                              onSelectedItemChanged: (int index) {
                                state.didChange(CustomCupertinoDropdownState(
                                    text: listText[_selectedIndex], index: _selectedIndex));

                                _selectedIndex = index;
                              },
                              children: listText
                                  .map((e) => Center(
                                        child: Text(e),
                                      ))
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          },
        ),
        _buildErrorMessage(state, _errorColor)
      ],
    );
  }

  static Widget _buildErrorMessage(FormFieldState<CustomCupertinoDropdownState> state, Color _errorColor) {
    return state.hasError
        ? Padding(
            padding: const EdgeInsets.fromLTRB(16, 5, 16, 0),
            child: Text(
              state.errorText,
              style: theme.captionBold.copyWith(color: _errorColor),
            ),
          )
        : Container();
  }
}
