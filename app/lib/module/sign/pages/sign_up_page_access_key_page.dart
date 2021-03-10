import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:app/module/sign/controller/sign_up_controller.dart';
import 'package:app/shared_widgets/components/input_text_field.dart';
import 'package:app/shared_widgets/components/loading_button.dart';
import 'package:app/shared_widgets/components/primary_button.dart';
import 'package:app/shared_widgets/components/secondary_button.dart';
import 'package:app/shared_widgets/widget/app_bar/label_app_bar.dart';
import 'package:app/theme/app_theme.dart';

class SignUpPageAccessKeyPage extends GetView<SignUpController> {
  final GlobalKey<FormState> codeKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LabelAppBar(title: 'Cadastre-se'),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          children: [
            Spacer(),
            Text(
              'Informe a chave de acesso recebida no seu e-mail',
              style: headlineBold,
            ),
            SizedBox(height: 22),
            Form(
              key: codeKey,
              child: InputTextFormField(
                autocorrect: false,
                labelText: 'Código',
                textCapitalization: TextCapitalization.none,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.number,
                onFieldSubmitted: (code) => codeKey.currentState.validate(),
                onSaved: (code) {
                  controller.validationCode.value = int.parse(code);
                },
                onChanged: (code) {
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
            ),
            SizedBox(height: 16),
            SecondaryButton(
              onTap: () => controller.resendCode(),
              text: 'Reenviar código',
              borderColor: Colors.transparent,
              textColor: appThemeData.accentColor,
            ),
            Spacer(),
            Obx(
              () => LoadingButton(
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
