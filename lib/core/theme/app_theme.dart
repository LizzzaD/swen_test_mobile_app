import 'package:flutter/material.dart';

import 'colors_palette.dart';
import 'styles_palette.dart';
import 'theme_style.dart';

class AppTheme {
  static ThemeData get getLightTheme => ThemeData(
        extensions: const [
          ThemeStyle(
            colors: lightColorsPalette,
            styles: lightStylePalette,
          ),
        ],
        brightness: Brightness.light,
        scaffoldBackgroundColor: lightColorsPalette.backgroundColor,
      );

  static ThemeData get getDarkTheme => ThemeData(
        extensions: const [
          ThemeStyle(
            colors: lightColorsPalette,
            styles: lightStylePalette,
          ),
        ],
        brightness: Brightness.dark,
        scaffoldBackgroundColor: lightColorsPalette.backgroundColor,
      );

  static const lightColorsPalette = ColorsPalette(
    backgroundColor: Color(0xFFF8F7F8),
    black: Color(0xFF262D35),
    black13: Color(0x21262D35),
    black50: Color(0x7F262D35),
    white: Color(0xFFFFFFFF),
    white50: Color(0x80FFFFFF),
    grey: Color(0xFFB9BECC),
    lightGrey: Color(0xFFECECEC),
    lightPurple: Color(0xFFE6DBF9),
    purple: Color(0xFFB794FB),
    green: Color(0xFFDEF1D9),
    blue: Color(0xFFD8F0F6),
    red: Color(0xFFF0D9D5),
  );

  static const lightStylePalette = StylesPalette(
    medium18: SpaceGrotesk.medium18,
    medium12: SpaceGrotesk.medium12,
    medium11: SpaceGrotesk.medium11,
    regular72: SpaceGrotesk.regular72,
    regular36: SpaceGrotesk.regular36,
    regular20: SpaceGrotesk.regular20,
    regular18: SpaceGrotesk.regular18,
  );
}
