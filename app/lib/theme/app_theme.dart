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

//Colors
final accentColor = Color(0xff005baa);
final accentColorTransparent = Color(0xffe6eff7);
final backgroundColor = Color(0xfff5f5f5);
final blueSelected = Color(0xff1900b4db);
final darkBackgroundColorTranslucid = Color(0x000000).withAlpha(60);
final disabledColor = Color(0xffdddddd);
final error = Color(0xffff203d);
final gradientNewBlue = Color(0xff3969fc);
final green = Color(0xff73b10d);
final labelColor = Color(0x99000000);
final orange = Color(0xfffd8529);
final primaryColor = Color(0xffffffff);
final purple = Color(0xff633989);
final red = Color(0xffed1c24);
final shadowColor = Color.fromRGBO(112, 144, 176, 0.2);
final secondaryColor = Color(0xff00b4db);
final textMedium = Color(0xff62606c);
final textLow = Color(0xffb9b9b9);
final textHigh = Color(0xff464360);
final textHighTranslucid = Color(0xff464360).withAlpha(170);
final yellow = Color(0xfffbd644);
final warmGrey = Color(0x9b9b9b);

//Gradient Colors
final blueGradient = getGradient([Color(0xff0084b1), Color(0xff00b4db)]);
final orangeGradient = getGradient([Color(0xffee9107), Color(0xffffb65d)]);
final greenActionGradient = getGradient([Color(0xffa0db5e), Color(0xff5aad31)]);
final greenGradient = getGradient([Color(0xff5aad31), Color(0xffa0db5e)]);
final greenGradientAlpha = getGradient([Color(0xffBBE48F), Color(0xffA9D883)]);
final purpleGradient = getGradient([Color(0xff43285b), Color(0xff724a6c)]);
final pinkGradient = getGradient([Color(0xfff4679a), Color(0xfff26273)]);
final blueLightGradient = getGradient([Color(0xff91edc7), Color(0xff1dd8d2)]);
final blueDarkGradient = getGradient([Color(0xff343895), Color(0xff015b97)]);
final redGradient = getGradient([Color(0xffb41217), Color(0xffe42c27)]);
final yellowGradient = getGradient([Color(0xffe4b407), Color(0xffeed707)]);
final blueActiveGradient = getGradient([Color(0xff2948ff), Color(0xff3969fc)]);
final disabledGradient = getGradient([Color(0xffd4d4d4), Color(0xffdcdcdc)]);



final List<LinearGradient> allGradients = [
  blueGradient,
  orangeGradient,
  greenGradient,
  purpleGradient,
  pinkGradient,
  blueLightGradient,
  blueDarkGradient,
  redGradient,
  yellowGradient,
  blueActiveGradient,
];

//TextStyles
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
    case 'laranja':
      return orangeGradient;
      break;
    case 'verde':
      return greenGradient;
      break;
    case 'roxo':
      return purpleGradient;
      break;
    case 'azul-claro':
      return blueLightGradient;
      break;
    case 'azul-escuro':
      return blueDarkGradient;
      break;
    case 'vermelho':
      return redGradient;
      break;
    case 'amarelo':
      return yellowGradient;
      break;
    case 'rosa':
      return pinkGradient;
      break;
    case 'azul-neon':
      return blueActiveGradient;
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
