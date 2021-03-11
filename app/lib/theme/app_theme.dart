import 'dart:typed_data';

import 'package:flutter/material.dart';

final appThemeData = ThemeData(
  accentColor: accentColor,
  cursorColor: accentColor,
  primaryColor: primaryColor,
  scaffoldBackgroundColor: backgroundColor,
  textSelectionHandleColor: accentColor,
  textSelectionColor: accentColor.withAlpha(50),
);

//  Colors
final accentColor = Color(0xff0b5694);
final accentColorTransparent = Color(0xaa0b5694);
final backgroundColor = Color(0xfffbfbfb);
final darkBackgroundColorTranslucid = Color(0xff2C2a26).withAlpha(60);
final disabledColor = Color(0xffd3d0cb);
final error = Color(0xffdf2935);
final labelColor = Color(0xff080708);
final primaryColor = Color(0xfffbfbfb);
final shadowColor = Color(0x552C2a26);
final secondaryColor = Color(0xff32936f);
final selected = Color(0xff062c4c);
final textMedium = Color(0xff58534b);
final textLow = Color(0xffbdb9b2);
final textHigh = Color(0xff2C2a26);
final textHighTranslucid = Color(0xff2C2a26).withAlpha(170);

//  Gradient Colors
final blueGradient = getGradient([Color(0xff0b5694), Color(0xff1285e2)]);
final grayGradient = getGradient([Color(0xffbdb9b2), Color(0xffd3d0cb)]);
final greenGradient = getGradient([Color(0xff32936f), Color(0xffa0db5e)]);
final redGradient = getGradient([Color(0xffdf2935), Color(0xffE44E58)]);
final yellowGradient = getGradient([Color(0xfffdca40), Color(0xffFEDE86)]);

final List<LinearGradient> allGradients = [
  blueGradient,
  greenGradient,
  redGradient,
  yellowGradient,
];

//  TextStyles
final bodyBold = TextStyle(
  fontSize: 16,
  fontFamily: "Montserrat",
  fontWeight: FontWeight.w700,
  letterSpacing: 0.5,
);

final bodyMedium = TextStyle(
  fontSize: 16,
  fontFamily: "Montserrat",
  fontWeight: FontWeight.w500,
  letterSpacing: 0.5,
);

final bodyRegular = TextStyle(
  fontSize: 16,
  fontFamily: "Montserrat",
  letterSpacing: 0.5,
);

final bodySemiBold = TextStyle(
  fontSize: 16,
  fontFamily: "Montserrat",
  fontWeight: FontWeight.w600,
  letterSpacing: 0.5,
);

final button = TextStyle(
  fontSize: 14,
  fontFamily: "Montserrat",
  fontWeight: FontWeight.w600,
  letterSpacing: 0.4,
);

final callout = TextStyle(
  fontSize: 10,
  fontFamily: "Montserrat",
  fontWeight: FontWeight.w700,
  letterSpacing: 0.5,
);

final captionBold = TextStyle(
  fontSize: 12,
  fontFamily: "Montserrat",
  fontWeight: FontWeight.w700,
  letterSpacing: 0.4,
);

final captionMedium = TextStyle(
  fontSize: 12,
  fontFamily: "Montserrat",
  fontWeight: FontWeight.w500,
  letterSpacing: 0.4,
);

final captionRegular = TextStyle(
  fontSize: 12,
  fontFamily: "Montserrat",
  letterSpacing: 0.4,
);

final headlineBold = TextStyle(
  fontSize: 20,
  fontFamily: "Montserrat",
  fontWeight: FontWeight.w700,
);

final headlineMedium = TextStyle(
  fontSize: 20,
  fontFamily: "Montserrat",
  fontWeight: FontWeight.w500,
);

final headlineRegular = TextStyle(
  fontSize: 24,
  fontFamily: "Montserrat",
);

final overline = TextStyle(
  fontSize: 8,
  fontFamily: "Montserrat",
  fontWeight: FontWeight.w500,
  letterSpacing: -0.2,
);

final overline2 = TextStyle(
  fontSize: 10,
  fontFamily: "Montserrat",
  fontWeight: FontWeight.w600,
  letterSpacing: -0.2,
);

final subheadRegular = TextStyle(
  fontSize: 18,
  fontFamily: "Montserrat",
  letterSpacing: 0.1,
);

final subtitleMedium = TextStyle(
  fontSize: 18,
  fontFamily: "Montserrat",
  fontWeight: FontWeight.w500,
  letterSpacing: 0.15,
);

LinearGradient getGradient(List<Color> colors) {
  return LinearGradient(
    colors: colors,
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

LinearGradient getGradientByText(String value) {
  if (value.contains('#')) {
    final Color color = HexColor(value);
    return getGradient([color, color.withAlpha(180)]);
  }

  switch (value) {
    case 'azul':
      return blueGradient;
      break;
    case 'verde':
      return greenGradient;
      break;
    case 'vermelho':
      return redGradient;
      break;
    case 'amarelo':
      return yellowGradient;
      break;
    default:
      return blueGradient;
      break;
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

final Uint8List kTransparentImage = Uint8List.fromList(<int>[
  0x89,
  0x50,
  0x4E,
  0x47,
  0x0D,
  0x0A,
  0x1A,
  0x0A,
  0x00,
  0x00,
  0x00,
  0x0D,
  0x49,
  0x48,
  0x44,
  0x52,
  0x00,
  0x00,
  0x00,
  0x01,
  0x00,
  0x00,
  0x00,
  0x01,
  0x08,
  0x06,
  0x00,
  0x00,
  0x00,
  0x1F,
  0x15,
  0xC4,
  0x89,
  0x00,
  0x00,
  0x00,
  0x0A,
  0x49,
  0x44,
  0x41,
  0x54,
  0x78,
  0x9C,
  0x63,
  0x00,
  0x01,
  0x00,
  0x00,
  0x05,
  0x00,
  0x01,
  0x0D,
  0x0A,
  0x2D,
  0xB4,
  0x00,
  0x00,
  0x00,
  0x00,
  0x49,
  0x45,
  0x4E,
  0x44,
  0xAE,
]);
