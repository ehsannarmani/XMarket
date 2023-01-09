import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:xmarket/presentation/utils/custom_colors.dart';

class MyThemes {
  static final darkTheme = ThemeData(
      brightness: Brightness.dark,
      fontFamily: 'dana',
      appBarTheme: AppBarTheme(
        color: CustomColors.blue500
      ),
      scaffoldBackgroundColor: CustomColors.blue200,
      primaryColorLight: CustomColors.blue200,
      primaryColor: CustomColors.blue500,
      primaryColorDark: CustomColors.blue700,
      textTheme: TextTheme(
        headline1: const TextStyle(fontFamily: 'dana', fontSize: 20),
        headline2: const TextStyle(fontFamily: 'dana', fontSize: 18),
        headline3: const TextStyle(fontFamily: 'dana', fontSize: 16),
        headline4: const TextStyle(fontFamily: 'dana', fontSize: 14),
        headline5: const TextStyle(fontFamily: 'dana', fontSize: 12),
        headline6: const TextStyle(fontFamily: 'dana', fontSize: 10),
        subtitle1: TextStyle(
            fontFamily: 'dana', fontSize: 12, color: Colors.grey.shade400),
        subtitle2: TextStyle(
            fontFamily: 'dana', fontSize: 10, color: Colors.grey.shade400),
      ),
      focusColor: Colors.white
  );

  static final lightTheme = ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      primaryColorLight: CustomColors.red200,
      primaryColor: CustomColors.red500,
      primaryColorDark: CustomColors.red700,
      appBarTheme: AppBarTheme(
          color: CustomColors.red500
      ),
      fontFamily: 'dana',
      textTheme: TextTheme(
        headline1: const TextStyle(fontFamily: 'dana', fontSize: 20),
        headline2: const TextStyle(fontFamily: 'dana', fontSize: 18),
        headline3: const TextStyle(fontFamily: 'dana', fontSize: 16),
        headline4: const TextStyle(fontFamily: 'dana', fontSize: 14),
        headline5: const TextStyle(fontFamily: 'dana', fontSize: 12),
        headline6: const TextStyle(fontFamily: 'dana', fontSize: 10),
        subtitle1: TextStyle(
            fontFamily: 'dana', fontSize: 12, color: Colors.grey.shade400),
        subtitle2: TextStyle(
            fontFamily: 'dana', fontSize: 10, color: Colors.grey.shade400),
      ),
      focusColor: Colors.black);
}
