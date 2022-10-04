import 'package:flutter/material.dart';

abstract class AppColors {
  static Color primaryColor = Colors.black;
  static Map<int, Color> _materialColor = {
    50: primaryColor.withOpacity(0.1),
    100: primaryColor.withOpacity(0.2),
    200: primaryColor.withOpacity(0.3),
    300: primaryColor.withOpacity(0.4),
    400: primaryColor.withOpacity(0.5),
    500: primaryColor.withOpacity(0.6),
    600: primaryColor.withOpacity(0.7),
    700: primaryColor.withOpacity(0.8),
    800: primaryColor.withOpacity(0.9),
    900: primaryColor.withOpacity(1),
  };

  static MaterialColor primaryMaterialColor =
      MaterialColor(0xff000000, _materialColor);
}
