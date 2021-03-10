import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:app/module/profile/personal_informations/controller/personal_informations_controller.dart';
import 'package:app/shared_widgets/components/custom_check_box.dart';
import 'package:app/shared_widgets/components/custom_dropdown.dart';
import 'package:app/shared_widgets/components/input_text_field.dart';
import 'package:app/shared_widgets/components/loading_button.dart';
import 'package:app/shared_widgets/components/primary_button.dart';
import 'package:app/shared_widgets/widget/app_bar/label_app_bar.dart';
import 'package:app/theme/app_theme.dart';
import 'package:app/util/mask/text_input_mask.dart';
import 'package:app/util/user_data_utils.dart';
import 'package:app/util/validators.dart';

// ignore: must_be_immutable
class PersonalInformationsPage extends GetView<PersonalInformationsController> {
  final GlobalKey<FormState> nameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  final GlobalKey<FormState> telKey = GlobalKey<FormState>();
  final GlobalKey<FormState> genderKey = GlobalKey<FormState>();
  final GlobalKey<FormState> checkboxKey = GlobalKey<FormState>();
  final GlobalKey<FormState> checkbox2Key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: LabelAppBar(title: 'Informações pessoais'),
        body: Obx(
          () => ListView(
            padding: EdgeInsets.all(24),
            children: [
              CircleAvatar(
                radius: 35,
                backgroundColor: disabledColor,
                child: Text(
                  '${controller.nameInitials}',
                  style: bodyBold.copyWith(color: textHigh, fontSize: 20),
                ),
              ),
              SizedBox(height: 24),
              Form(
                key: nameKey,
                child: InputTextFormField(
                  labelText: 'Nome completo',
                  initialValue: controller.fullName.value,
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
                child: InputTextFormField(
                  labelText: 'CPF',
                  initialValue: controller.cpf.value,
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  inputFormatters: <TextInputFormatter>[
                    TextInputMask(mask: ['999.999.999-99'], placeholder: '_', maxPlaceHolders: 11, reverse: false)
                  ],
                  validator: cpfValidator,
                  enabled: false,
                  onSaved: (cpf) => controller.cpf.value = cpf,
                  onChanged: (cpf) => controller.cpf.value = cpf,
                ),
              ),
              SizedBox(height: 16),
              Form(
                key: emailKey,
                child: InputTextFormField(
                  labelText: 'E-mail',
                  enabled: false,
                  initialValue: controller.email.value,
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
                  initialValue: controller.phone.value,
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
                  child: Text(
                    'Desejo receber novidades por e-mail',
                    style: captionRegular.copyWith(
                      color: Color(0xff333333),
                    ),
                  ),
                  initialValue: controller.optInEmail.value,
                  onChanged: (value) {
                    controller.optInEmail.value = value;
                    print(controller.optInEmail.value);
                  },
                ),
              ),
              LoadingButton(
                isLoading: controller.isLoading.value,
                buttonWidget: PrimaryButton(
                    onTap: _isEnabledButton()
                        ? () async {
                            final keys = [nameKey, emailKey, telKey, genderKey, checkboxKey];

                            if (!keys.map((key) => key.currentState.validate()).toList().contains(false)) {
                              keys.forEach((element) => element.currentState.save());

                              await controller.updateUserData();
                            }
                          }
                        : null,
                    text: 'Salvar'),
              )
            ],
          ),
        ));
  }

  Widget _buildDropdownField(BuildContext context) {
    return Form(
      key: genderKey,
      child: CustomDropdownField(
        hint: 'Gênero',
        initialValue: mapGendertoLabel[controller.gender.value],
        listText: genders,
        onChanged: (gender) {
          FocusScope.of(context).nextFocus();
          genderKey.currentState.validate();
          controller.gender.value = mapGender[gender];
        },
        validator: genderValidator,
      ),
    );
  }

  bool _isEnabledButton() {
    return controller.fullName.value.isNotEmpty &&
        controller.email.value.isNotEmpty &&
        controller.phone.value.isNotEmpty &&
        controller.gender.value.isNotEmpty;
  }
}
