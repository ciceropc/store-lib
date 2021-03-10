import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:app/shared_widgets/components/eye_animation.dart';
import 'package:app/shared_widgets/components/input_text_field.dart';
import 'package:app/shared_widgets/components/loading_button.dart';
import 'package:app/shared_widgets/components/primary_button.dart';
import 'package:app/theme/app_theme.dart';
import 'package:app/util/interfaces/password_controller_interface.dart';
import 'package:app/util/validators.dart';

class PasswordBody extends StatefulWidget {
  const PasswordBody({
    Key key,
    @required this.controller,
    @required this.passwordKey,
    @required this.passwordConfirmKey,
    this.title,
    this.buttonText,
  }) : super(key: key);

  final PasswordControllerInterface controller;
  final GlobalKey<FormState> passwordKey;
  final GlobalKey<FormState> passwordConfirmKey;
  final String title;
  final String buttonText;

  @override
  _PasswordBodyState createState() => _PasswordBodyState();
}

class _PasswordBodyState extends State<PasswordBody> {
  bool passMinLengh = false;
  bool hasNumber = false;
  bool minUpperChar = false;
  bool minLowerChar = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24),
          Text(
            widget.title,
            style: headlineBold,
          ),
          SizedBox(height: 24),
          _buildPasswordRules(),
          SizedBox(height: 16),
          _buildPasswordField(context),
          SizedBox(height: 16),
          _buildPasswordConfirmField(),
          Spacer(),
          _buildSubmitButton(context),
          SizedBox(height: 16),
        ],
      ),
    ));
  }

  Obx _buildSubmitButton(BuildContext context) {
    return Obx(() => LoadingButton(
          isLoading: widget.controller.isLoading.value,
          buttonWidget: PrimaryButton(
            onTap: widget.controller.password.value.isEmpty || widget.controller.passwordConfirm.value.isEmpty
                ? null
                : () {
                    if (widget.passwordKey.currentState.validate() &
                        widget.passwordConfirmKey.currentState.validate()) {
                      FocusScope.of(context).unfocus();
                      widget.passwordKey.currentState.save();
                      widget.passwordConfirmKey.currentState.save();

                      widget.controller.passwordSubmit();
                    }
                  },
            text: widget.buttonText,
          ),
        ));
  }

  Widget _buildPasswordRules() {
    return Padding(
      padding: const EdgeInsets.only(left: 9.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Sua senha deve conter:', style: captionRegular.copyWith(color: textHigh, height: 0.8)),
          SizedBox(height: 6),
          Row(
            children: [
              passMinLengh
                  ? Icon(
                      Icons.check,
                      color: accentColor,
                      size: 14,
                    )
                  : Text('·'),
              Text(' Mínimo de 8 caracteres', style: captionRegular.copyWith(color: textHigh, height: 0.8)),
            ],
          ),
          SizedBox(height: 4),
          Row(
            children: [
              hasNumber
                  ? Icon(
                      Icons.check,
                      color: accentColor,
                      size: 14,
                    )
                  : Text('·'),
              Text(' 1 número', style: captionRegular.copyWith(color: textHigh, height: 0.8)),
            ],
          ),
          SizedBox(height: 4),
          Row(
            children: [
              minUpperChar
                  ? Icon(
                      Icons.check,
                      color: accentColor,
                      size: 14,
                    )
                  : Text('·'),
              Text(' 1 letra maiúscula', style: captionRegular.copyWith(color: textHigh, height: 0.8)),
            ],
          ),
          SizedBox(height: 4),
          Row(
            children: [
              minLowerChar
                  ? Icon(
                      Icons.check,
                      color: accentColor,
                      size: 14,
                    )
                  : Text('·'),
              Text(' 1 letra minúscula', style: captionRegular.copyWith(color: textHigh, height: 0.8)),
            ],
          ),
        ],
      ),
    );
  }

  Obx _buildPasswordField(BuildContext context) {
    return Obx(
      () => Form(
        key: widget.passwordKey,
        child: InputTextFormField(
          labelText: 'Senha',
          obscureText: widget.controller.obscurePassword.value,
          textInputType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (_) {
            if (widget.passwordKey.currentState.validate()) {
              widget.passwordKey.currentState.save();
              FocusScope.of(context).nextFocus();
            }
          },
          onSaved: (pass) => widget.controller.password.value = pass,
          onChanged: (String pass) {
            setState(() {
              passMinLengh = pass.length >= 8;
              minUpperChar = RegExp(r'[A-Z]').hasMatch(pass);
              minLowerChar = RegExp(r'[a-z]').hasMatch(pass);
              hasNumber = RegExp(r'\d').hasMatch(pass);
            });

            widget.controller.password.value = pass;
          },
          validator: passwordValidator,
          suffixIcon: IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: EyeAnimation(enableEye: widget.controller.obscurePassword.value),
            onPressed: () => widget.controller.obscurePassword.value = !widget.controller.obscurePassword.value,
          ),
        ),
      ),
    );
  }

  Obx _buildPasswordConfirmField() {
    return Obx(
      () => Form(
        key: widget.passwordConfirmKey,
        child: InputTextFormField(
          labelText: 'Confirme a senha',
          obscureText: widget.controller.obscurePasswordConfirm.value,
          textInputType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (_) {
            widget.passwordKey.currentState.save();
            widget.passwordConfirmKey.currentState.validate();
          },
          onSaved: (pass) => widget.controller.passwordConfirm.value = pass,
          onChanged: (pass) => widget.controller.passwordConfirm.value = pass,
          validator: (String confirmPass) {
            if (widget.controller.password.value != confirmPass) {
              return 'Repita a nova senha';
            }
            return null;
          },
          suffixIcon: IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: EyeAnimation(enableEye: widget.controller.obscurePasswordConfirm.value),
            onPressed: () =>
                widget.controller.obscurePasswordConfirm.value = !widget.controller.obscurePasswordConfirm.value,
          ),
        ),
      ),
    );
  }
}
