/// Sistem tema aplikasi UniKantin.
///
/// Menyediakan token warna, spacing, dan ThemeData Material 3
/// yang konsisten di seluruh aplikasi.
library;

import 'package:flutter/material.dart';

/// Palet warna UniKantin.
///
/// Warna utama oranye hangat melambangkan makanan dan kehangatan,
/// dikombinasikan dengan warna netral untuk keterbacaan.
class AppColors {
  AppColors._();

  static const Color primary = Color(0xFFE65100); // Deep Orange 900
  static const Color primaryLight = Color(0xFFFF833A);
  static const Color primaryDark = Color(0xFFAC1900);
  static const Color secondary = Color(0xFF2E7D32); // Green 800
  static const Color secondaryLight = Color(0xFF60AD5E);
  static const Color secondaryDark = Color(0xFF005005);
  static const Color surface = Color(0xFFFFFBFE);
  static const Color background = Color(0xFFFFFBFE);
  static const Color error = Color(0xFFB3261E);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color onSurface = Color(0xFF1C1B1F);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color outline = Color(0xFF79747E);
}

/// Token jarak (spacing) standar.
class AppSpace {
  AppSpace._();

  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
}

/// Tema aplikasi UniKantin menggunakan Material 3.
class AppTheme {
  AppTheme._();

  /// Tema terang (default).
  static ThemeData get light {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      error: AppColors.error,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 2,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpace.lg,
            vertical: AppSpace.md,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpace.md,
          vertical: AppSpace.md,
        ),
      ),
    );
  }

  /// Tema gelap (disiapkan untuk milestone berikutnya).
  static ThemeData get dark {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
      primary: AppColors.primaryLight,
      secondary: AppColors.secondaryLight,
      error: AppColors.error,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
      ),
    );
  }
}
