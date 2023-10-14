import 'package:flutter/material.dart';

class StylesPalette {
  const StylesPalette({
    required this.medium18,
    required this.medium12,
    required this.medium11,
    required this.regular72,
    required this.regular36,
    required this.regular20,
    required this.regular18,
  });

  final TextStyle medium18;
  final TextStyle medium12;
  final TextStyle medium11;
  final TextStyle regular72;
  final TextStyle regular36;
  final TextStyle regular20;
  final TextStyle regular18;
}

class SpaceGrotesk {
  const SpaceGrotesk._();

  static const fontFamily = 'SpaceGrotesk';

  static const medium18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    height: 22.97 / 18,
    fontFamily: fontFamily,
  );

  static const medium12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 15.31 / 12,
    fontFamily: fontFamily,
  );

  static const medium11 = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    height: 14.04 / 11,
    fontFamily: fontFamily,
  );

  static const regular72 = TextStyle(
    fontSize: 72,
    fontWeight: FontWeight.w400,
    height: 91.87 / 72,
    fontFamily: fontFamily,
  );

  static const regular36 = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w400,
    height: 45.94 / 36,
    fontFamily: fontFamily,
  );

  static const regular20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    height: 25.52 / 20,
    fontFamily: fontFamily,
  );

  static const regular18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 22.97 / 18,
    fontFamily: fontFamily,
  );
}
