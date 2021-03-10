import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:app/shared_widgets/components/input_text_field.dart';
import 'package:app/shared_widgets/components/loading_button.dart';
import 'package:app/shared_widgets/components/primary_button.dart';
import 'package:app/shared_widgets/components/secondary_button.dart';
import 'package:app/theme/app_theme.dart';
import 'package:app/util/interfaces/password_controller_interface.dart';

class SendKeyBody extends StatelessWidget {
  const SendKeyBody({
    @required this.codeKey,
    @required this.controller,
  });

  final GlobalKey<FormState> codeKey;
  final PasswordControllerInterface controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        children: [
          Spacer(),
          Text(
            'Informe a chave de acesso recebida no seu e-mail',
            style: headlineBold,
          ),
          SizedBox(height: 22),
          Obx(() => Form(
                key: codeKey,
                child: InputTextFormField(
                  autocorrect: false,
                  labelText: 'Código',
                  textCapitalization: TextCapitalization.none,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.number,
                  errorMessage: controller.codeErrorMessage.value,
                  onFieldSubmitted: (code) => codeKey.currentState.validate(),
                  onSaved: (code) => controller.validationCode.value = int.parse(code),
                  onChanged: (code) {
                    controller.codeErrorMessage.nil();
                    controller.validationCode.value = int.parse(code);
                  },
                  validator: (String value) {
                    if (value.length < 6) {
                      return 'Insira um código válido';
                    }
                    return null;
                  },
                  inputFormatters: [LengthLimitingTextInputFormatter(6)],
                ),
              )),
          SizedBox(height: 16),
          SecondaryButton(
            onTap: () => controller.resendCode(),
            text: 'Reenviar código',
            borderColor: Colors.transparent,
            textColor: appThemeData.accentColor,
          ),
          Spacer(),
          Obx(() => LoadingButton(
              isLoading: controller.isLoading.value,
              buttonWidget: PrimaryButton(
                onTap: controller.validationCode.value == 0
                    ? null
                    : () {
                        if (codeKey.currentState.validate()) {
                          FocusScope.of(context).unfocus();
                          codeKey.currentState.save();
                          controller.finishPasswordFlow();
                        }
                      },
                text: 'Continuar',
              )))
        ],
      ),
    );
  }
}
