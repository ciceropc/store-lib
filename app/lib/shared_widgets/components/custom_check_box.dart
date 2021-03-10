import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:app/theme/app_theme.dart';

class CustomCheckBox extends FormField<bool> {
  final bool enabled;
  final Widget child;
  final Function onChanged;

  CustomCheckBox(
      {FormFieldSetter<bool> onSaved,
      FormFieldValidator<bool> validator,
      bool initialValue = false,
      this.enabled = true,
      this.child,
      Color errorColor,
      @required this.onChanged})
      : super(
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            autovalidateMode: AutovalidateMode.disabled,
            builder: (FormFieldState<bool> state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (state.value) {
                            state.reset();
                            state.didChange(false);
                          } else if (!state.value && state.hasError) {
                            state.reset();
                            state.didChange(!state.value);
                          } else {
                            state.didChange(!state.value);
                          }

                          onChanged(state.value);
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 5),
                          child: AnimatedSwitcher(
                            duration: Duration(milliseconds: 300),
                            child: state.hasError
                                ? SvgPicture.asset('assets/icons/checkbox_error.svg', key: Key('checked'), height: 24)
                                : state.value
                                    ? SvgPicture.asset('assets/icons/checkbox_checked.svg',
                                        key: Key('checked'), height: 24)
                                    : SvgPicture.asset('assets/icons/checkbox_default.svg',
                                        key: Key('default'), height: 24),
                          ),
                        ),
                      ),
                      child ?? Container()
                    ],
                  ),
                  state.hasError
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            state.errorText,
                            style: captionBold.copyWith(color: errorColor ?? error),
                          ),
                        )
                      : Container()
                ],
              );
            });
}
