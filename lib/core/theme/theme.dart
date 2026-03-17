import 'package:shefaa/core/theme/colors.dart';
import 'package:flutter/material.dart';

class ThemesManager {
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: ColorsManager.backgroundColorLight,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorsManager.backgroundDark,
      foregroundColor: ColorsManager.textPrimaryLight,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
  );

  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: ColorsManager.backgroundDark,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorsManager.backgroundDark,
      foregroundColor: ColorsManager.textPrimaryDark,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
  );
}
