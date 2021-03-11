import 'package:flutter/material.dart';

import 'app_theme.dart';

var decorationRoundedDisabled = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(8.0)),
  color: primaryColor,
  border: Border.all(
    width: 1.0,
    color: disabledColor,
  ),
);

var decorationRoundedWithoutBorder = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(8.0)),
  color: primaryColor,
);

final bottomNavigationBarHeight = 56;
