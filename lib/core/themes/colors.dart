import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const Color primary = Color(0xFFDBB13B);
  static const Color secondary = Color(0xFFFBFBFB);
  static const Color grey = Color(0xFFEFEFEF);
  static const Color textBlack = Color(0xFF606565);
  static const Color textLightGrey = Color(0xFFACACAC);
  static const Color textGrey = Color(0xFF9BA1A1);
  static const Color white = Color(0xFFffffff);
  static const Color yellowSoft = Color(0xFFF3EFE3);
  static const Color blueSoft = Color(0xFFdfecf6);
  static const Color inputColor = Color(0xFFefefef);
  static const Color inactiveIconColor = Color(0xFFb9bdbd);
  static const Color blue = Color(0xFF2F80C5);
  static const Color bgBottomSheet = Color(0xFFf9f9f9);
  static const Color yellow = Color(0xFFe1c36c);
  static const Color yellowLight = Color(0xFFfff5dd);
  static const int _yellowPrimaryValue = 0xFFe1c36c;

  static const MaterialColor yellows = MaterialColor(
    _yellowPrimaryValue,
    <int, Color>{
      50: Color(0xFFFFFDE7),
      100: Color(0xFFFFF9C4),
      200: Color(0xFFFFF59D),
      300: Color(0xFFFFF176),
      400: Color(0xFFFFEE58),
      500: Color(_yellowPrimaryValue),
      600: Color(0xFFFFD740),
      700: Color(0xFFFFD600),
      800: Color(0xFFFFD600),
      900: Color(0xFFFFD600),
    },
  );
}
