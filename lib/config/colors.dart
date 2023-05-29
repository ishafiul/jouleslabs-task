import 'package:flutter/material.dart';

MaterialColor createMaterialColor(Color color) {
  final List<double> strengths = <double>[.05];
  final swatch = <int, Color>{};
  final r = color.red;
  final g = color.green;
  final b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (final strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

class ArtistaColor {
  static MaterialColor primary = createMaterialColor(const Color(0xFF097D5D));
  static MaterialColor warning = createMaterialColor(const Color(0xFFF39F1D));
  static MaterialColor danger = createMaterialColor(const Color(0xFFD40022));
  static MaterialColor success = createMaterialColor(const Color(0xFF26994B));
  static MaterialColor info = createMaterialColor(const Color(0xFF0758CE));
  static MaterialColor disable = createMaterialColor(const Color(0xFFE5E6EA));
  static MaterialColor secondary = createMaterialColor(const Color(0xFF474496));
  static MaterialColor text = createMaterialColor(const Color(0xFF14142B));

  static const backgroundColor = Color.fromARGB(255, 231, 231, 231);
  static const disableText = Color(0xFF838699);
  static const infoShade20 = Color(0xFFCEE6FC);

  ArtistaColor();
}
