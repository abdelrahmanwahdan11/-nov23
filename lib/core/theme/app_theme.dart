import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

ThemeData buildTheme({Color primary = AppColors.primary, Brightness brightness = Brightness.light}) {
  final baseText = GoogleFonts.interTextTheme(
    brightness == Brightness.dark ? ThemeData.dark().textTheme : ThemeData.light().textTheme,
  );
  final colorScheme = ColorScheme.fromSeed(
    seedColor: primary,
    brightness: brightness,
    background: AppColors.lightBackground,
    primary: primary,
  );
  return ThemeData(
    brightness: brightness,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: brightness == Brightness.dark ? Colors.black : AppColors.lightBackground,
    cardColor: AppColors.card,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: brightness == Brightness.dark ? Colors.grey.shade900 : AppColors.card,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textSecondary,
      selectedIconTheme: const IconThemeData(color: AppColors.primary),
      unselectedIconTheme: const IconThemeData(color: AppColors.textSecondary),
      type: BottomNavigationBarType.fixed,
    ),
    textTheme: baseText.copyWith(
      headlineLarge: baseText.headlineLarge?.copyWith(fontWeight: FontWeight.bold, fontSize: 30),
      headlineMedium: baseText.headlineMedium?.copyWith(fontWeight: FontWeight.bold, fontSize: 24),
      bodyMedium: baseText.bodyMedium?.copyWith(fontSize: 15),
      bodySmall: baseText.bodySmall?.copyWith(fontSize: 13, color: AppColors.textSecondary),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: brightness == Brightness.dark ? Colors.black : AppColors.lightBackground,
      foregroundColor: AppColors.textPrimary,
      elevation: 0,
    ),
    useMaterial3: true,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: brightness == Brightness.dark ? Colors.grey.shade900 : Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: primary, width: 1.4),
      ),
    ),
  );
}
