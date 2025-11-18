import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

ThemeData buildTheme({Color primary = AppColors.primary, Brightness brightness = Brightness.light}) {
  final isDark = brightness == Brightness.dark;
  final safePrimary = isDark && primary.computeLuminance() < 0.2 ? Colors.grey.shade200 : primary;
  final baseText = GoogleFonts.interTextTheme(
    isDark ? ThemeData.dark().textTheme : ThemeData.light().textTheme,
  );
  final colorScheme = ColorScheme.fromSeed(
    seedColor: safePrimary,
    brightness: brightness,
    background: isDark ? Colors.black : AppColors.lightBackground,
    primary: safePrimary,
    onPrimary: isDark ? Colors.black : Colors.white,
  );
  return ThemeData(
    brightness: brightness,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: isDark ? Colors.black : AppColors.lightBackground,
    cardColor: isDark ? Colors.grey.shade900 : AppColors.card,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: isDark ? Colors.grey.shade950 : Colors.white,
      selectedItemColor: isDark ? safePrimary : safePrimary,
      unselectedItemColor: isDark ? Colors.grey.shade400 : Colors.grey.shade700,
      selectedIconTheme: IconThemeData(color: safePrimary),
      unselectedIconTheme: IconThemeData(color: isDark ? Colors.grey.shade400 : Colors.grey.shade700),
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
      elevation: 12,
    ),
    textTheme: baseText.copyWith(
      headlineLarge: baseText.headlineLarge?.copyWith(fontWeight: FontWeight.bold, fontSize: 30),
      headlineMedium: baseText.headlineMedium?.copyWith(fontWeight: FontWeight.bold, fontSize: 24),
      bodyMedium: baseText.bodyMedium?.copyWith(fontSize: 15, color: isDark ? Colors.white : AppColors.textPrimary),
      bodySmall:
          baseText.bodySmall?.copyWith(fontSize: 13, color: isDark ? Colors.grey.shade300 : AppColors.textSecondary),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: isDark ? Colors.black : AppColors.lightBackground,
      foregroundColor: isDark ? Colors.white : AppColors.textPrimary,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: isDark ? Colors.white : AppColors.textPrimary,
        side: BorderSide(color: isDark ? Colors.white24 : Colors.grey.shade400),
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),
    useMaterial3: true,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: isDark ? Colors.grey.shade900 : Colors.white,
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
