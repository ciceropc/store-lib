import 'package:get/get.dart';
import 'package:get/utils.dart';

import 'package:app/shared_widgets/components/custom_cupertino_dropdown.dart';

int daysInMonth(int month, int year) {
  int days = 28 + (month + (month / 8).floor()) % 2 + 2 % month + 2 * (1 / month).floor();
  return (isLeapYear(year) && month == 2) ? 29 : days;
}

bool isLeapYear(int year) => ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0);

Function nameValidator = (name) {
  if (name.isEmpty || name.trim().split(' ').length <= 1 || name.length < 4) {
    return 'Insira seu nome completo';
  }
  return null;
};

Function birthdateValidator = (String date) {
  if (date.isEmpty) {
    return 'Insira uma data de nascimento válida';
  }

  List<String> inputs = date.split('\/');

  int day = int.parse(inputs[0], onError: (value) => 0);
  int month = int.parse(inputs[1], onError: (value) => 0);
  int year = int.parse(inputs[2], onError: (value) => 0);

  var now = DateTime.now();

  if (month > 12 ||
      month < 1 ||
      day < 1 ||
      day > daysInMonth(month, year) ||
      year < 1810 ||
      year > now.year ||
      (year >= now.year && month > now.month) ||
      (year >= now.year && month > now.month && day > now.day)) {
    return 'Insira uma data de nascimento válida';
  }

  return null;
};

Function cpfValidator = (String cpf) {
  if (!GetUtils.isCpf(cpf)) {
    return 'Insira um CPF válido';
  }
  return null;
};

Function cnpjValitador = (String cnpj) {
  if (!GetUtils.isCnpj(cnpj)) {
    return 'Insira um CNPJ válido';
  }
  return null;
};

Function emailValidator = (email) {
  if (!GetUtils.isEmail(email)) {
    return 'Insira um endereço de e-mail válido';
  }
  return null;
};

Function telValidator = (String tel) {
  if (tel.length < 14) {
    return 'Insira um telefone válido';
  }
  return null;
};

Function passwordValidator = (String password) {
  bool minUpperChar = RegExp(r'[A-Z]').hasMatch(password);
  bool minLowerChar = RegExp(r'[a-z]').hasMatch(password);
  bool hasNumber = RegExp(r'\d').hasMatch(password);

  if (password.isEmpty || password.length < 8 || !minUpperChar || !minLowerChar || !hasNumber) {
    return 'Insira uma senha válida';
  }
  return null;
};

Function cepValidator = (String cep) {
  final _cep = cep.replaceAll(RegExp('-'), '').replaceAll(RegExp('_'), '');
  if (!GetUtils.isNum(_cep) || _cep.length < 8) {
    return 'Insira um CEP válido';
  }
  return null;
};

Function genderiOSValidator = (CustomCupertinoDropdownState state) {
  return state.text == null ? 'Selecione um gênero' : null;
};

Function genderValidator = (String gender) {
  return gender == null ? 'Selecione um gênero' : null;
};

String normalTextValidator(String text, String message) {
  if (text.isEmpty || text.length < 3) {
    return message;
  }
  return null;
}
