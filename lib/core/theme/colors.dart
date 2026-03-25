import 'package:shefaa/core/utils/cubit/theme/theme_cubit.dart';
import 'package:flutter/material.dart';

class ColorsManager {
  static bool get isDark => themeCubit.isDarkMode;

  static const Color primaryColor = Color(0xFF2C9C94);
  static const Color secondaryColor = Color(0xFFC2DFDD);
  static const Color placeholder = Color(0xFF6B7280);
  static const Color textPrimaryLight = Color(0xFF0F172A);
  static const Color backgroundColorLight = Color(0xFFF6F7F7);

  static const Color textPrimaryDark = Color(0xFFE6E9EF);
  static const Color backgroundDark = Color(0xFF0B1215);
  static const Color surfaceDark = Color(0xFF111827);

  static Color get background => isDark ? backgroundDark : backgroundColorLight;

  static Color get textPrimary => isDark ? textPrimaryDark : textPrimaryLight;

  static Color get textSecondary => placeholder;

  static Color get surfacePrimary => isDark ? surfaceDark : Colors.white;

  static Color get primaryAction => primaryColor;

  static const Color borderLight = Color(0xFFE5E7EB);
  static Color get borderColor => isDark ? Colors.white24 : borderLight;

  static Color get progressBackground => Colors.grey.withValues(alpha: 0.2);
  static const Color ratingIcon = Colors.orange;
  static Color get ratingBackground => Colors.orange.withValues(alpha: 0.1);
  static Color get ratingText => Colors.orange.shade800;

  // Prescriptions Feature Colors
  static Color get prescriptionSearchBackground => isDark ? const Color(0xFF1E293B) : const Color(0xFFF1F5F9);
  static Color get prescriptionCardGreen => primaryColor;
  static Color get prescriptionCardOrange => const Color(0xFFEA580C);
  static Color get prescriptionCardOrangeBg => isDark ? const Color(0xFF431407) : const Color(0xFFFFF7ED);
  static Color get prescriptionCardBlue => const Color(0xFF0EA5E9);
  static Color get prescriptionCardBlueBg => isDark ? const Color(0xFF0C4A6E) : const Color(0xFFF0F9FF);
  static Color get prescriptionListGrey => isDark ? surfaceDark : const Color(0xFFF8FAFC);
}
