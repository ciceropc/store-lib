import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:app/module/sign/controller/sign_up_controller.dart';
import 'package:app/shared_widgets/components/custom_check_box.dart';
import 'package:app/shared_widgets/components/custom_cupertino_dropdown.dart';
import 'package:app/shared_widgets/components/custom_dropdown.dart';
import 'package:app/shared_widgets/components/input_text_field.dart';
import 'package:app/shared_widgets/components/loading_button.dart';
import 'package:app/shared_widgets/components/primary_button.dart';
import 'package:app/shared_widgets/widget/app_bar/label_app_bar.dart';
import 'package:app/theme/app_theme.dart';
import 'package:app/util/mask/text_input_mask.dart';
import 'package:app/util/user_data_utils.dart';
import 'package:app/util/validators.dart';

class SignUpPage extends GetView<SignUpController> {
  final GlobalKey<FormState> nameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> birthdateKey = GlobalKey<FormState>();
  final GlobalKey<FormState> cpfKey = GlobalKey<FormState>();
  final GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  final GlobalKey<FormState> telKey = GlobalKey<FormState>();
  final GlobalKey<FormState> genderKey = GlobalKey<FormState>();
  final GlobalKey<FormState> checkboxKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LabelAppBar(
        title: 'Cadastre-se',
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.fromLTRB(24, 24, 24, 11),
          children: [
            Form(
              key: nameKey,
              child: InputTextFormField(
                labelText: 'Nome completo',
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (value) => nameKey.currentState.validate(),
                validator: nameValidator,
                onSaved: (name) => controller.fullName.value = name,
                onChanged: (name) => controller.fullName.value = name,
              ),
            ),
            SizedBox(height: 16),
            Form(
              key: birthdateKey,
              child: InputTextFormField(
                labelText: 'Data de nascimento',
                textInputType: TextInputType.number,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (date) => birthdateKey.currentState.validate(),
                inputFormatters: <TextInputFormatter>[
                  TextInputMask(
                    mask: ['99/99/9999'],
                    placeholder: '_',
                    maxPlaceHolders: 8,
                  )
                ],
                validator: birthdateValidator,
                onSaved: (date) => controller.birthDate.value = date,
                onChanged: (date) => controller.birthDate.value = date,
              ),
            ),
            SizedBox(height: 16),
            Form(
              key: cpfKey,
              child: InputTextFormField(
                labelText: 'CPF',
                textInputType: TextInputType.number,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (cpf) => cpfKey.currentState.validate(),
                inputFormatters: <TextInputFormatter>[
                  TextInputMask(mask: ['999.999.999-99'], placeholder: '_', maxPlaceHolders: 11, reverse: false)
                ],
                validator: cpfValidator,
                onSaved: (cpf) => controller.cpf.value = cpf,
                onChanged: (cpf) => controller.cpf.value = cpf,
              ),
            ),
            SizedBox(height: 16),
            Form(
              key: emailKey,
              child: InputTextFormField(
                labelText: 'E-mail',
                textCapitalization: TextCapitalization.none,
                autocorrect: false,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.emailAddress,
                onFieldSubmitted: (email) => emailKey.currentState.validate(),
                validator: emailValidator,
                onSaved: (email) => controller.email.value = email,
                onChanged: (email) => controller.email.value = email,
              ),
            ),
            SizedBox(height: 16),
            Form(
              key: telKey,
              child: InputTextFormField(
                labelText: 'Telefone',
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.number,
                onFieldSubmitted: (tel) => telKey.currentState.validate(),
                inputFormatters: [
                  TextInputMask(
                    mask: ['(99) 9999 9999', '(99) 99999 9999'],
                  )
                ],
                validator: telValidator,
                onSaved: (tel) => controller.phone.value = tel,
                onChanged: (tel) => controller.phone.value = tel,
              ),
            ),
            SizedBox(height: 16),
            _buildDropdownField(context),
            SizedBox(height: 16),
            Form(
              key: checkboxKey,
              child: CustomCheckBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Concordo com a ',
                      style: captionRegular.copyWith(
                        color: Color(0xff333333),
                      ),
                    ),
                  ],
                ),
                onChanged: (value) {},
                validator: (value) {
                  if (!value) {
                    return 'Aceite os termos para utilizar o app';
                  }

                  return null;
                },
              ),
            ),
            SizedBox(height: 16),
            Obx(
              () => LoadingButton(
                isLoading: controller.isLoading.value,
                buttonWidget: PrimaryButton(
                    onTap: () async {
                      final keys = [nameKey, birthdateKey, cpfKey, emailKey, telKey, genderKey, checkboxKey];

                      if (!keys.map((key) => key.currentState.validate()).toList().contains(false)) {
                        keys.forEach((element) => element.currentState.save());

                        await controller.checkEmail();
                      }
                    },
                    text: 'Continuar'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownField(BuildContext context) {
    if (Platform.isIOS) {
      return Form(
        key: genderKey,
        child: CustomCupertinoDropdown(
          context: context,
          hint: 'Gênero',
          listText: genders,
          onPressedOk: (value) {
            controller.gender.value = value;
          },
          validator: genderiOSValidator,
        ),
      );
    } else {
      return Form(
        key: genderKey,
        child: CustomDropdownField(
          hint: 'Gênero',
          listText: genders,
          onChanged: (gender) {
            FocusScope.of(context).nextFocus();
            genderKey.currentState.validate();
            controller.gender.value = gender;
          },
          validator: genderValidator,
        ),
      );
    }
  }

  // ignore: unused_element
  bool _isEnabledButton() {
    return controller.fullName.value.isNotEmpty &&
        controller.birthDate.value.isNotEmpty &&
        controller.cpf.value.isNotEmpty &&
        controller.email.value.isNotEmpty &&
        controller.phone.value.isNotEmpty &&
        controller.gender.value.isNotEmpty;
  }
}
