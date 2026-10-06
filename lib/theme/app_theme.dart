import 'package:flutter/material.dart';

abstract final class AppColors {
  static const green = Color(0xFF1E4133);
  static const greenDeep = Color(0xFF0B231A);
  static const background = Color(0xFFFFFFFF);
  static const border = Color(0xFFEAEAEA);
  static const tile = Color(0xFFF1F1EF);
  static const textPrimary = Color(0xFF141414);
  static const textSecondary = Color(0xFF7C7F7D);
  static const hint = Color(0xFFA9ADAA);
  static const error = Color(0xFFC5533F);
}

abstract final class AppRadius {
  static const double sheet = 34;
  static const double pill = 30;
  static const double tile = 18;
}

ThemeData buildAppTheme() {
  OutlineInputBorder pill(Color color, [double width = 1]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.pill),
      borderSide: BorderSide(color: color, width: width),
    );
  }

  final base = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.green,
      primary: AppColors.green,
      surface: AppColors.background,
      error: AppColors.error,
    ),
    scaffoldBackgroundColor: AppColors.background,
  );

  return base.copyWith(
    textTheme: base.textTheme.apply(
      bodyColor: AppColors.textPrimary,
      displayColor: AppColors.textPrimary,
    ),
    inputDecorationTheme: InputDecorationThemeData(
      filled: true,
      fillColor: AppColors.background,
      hintStyle: const TextStyle(color: AppColors.hint, fontSize: 15),
      contentPadding: const EdgeInsets.symmetric(vertical: 18),
      prefixIconConstraints: const BoxConstraints(minWidth: 60, minHeight: 54),
      border: pill(AppColors.border),
      enabledBorder: pill(AppColors.border),
      focusedBorder: pill(AppColors.green, 1.6),
      errorBorder: pill(AppColors.error),
      focusedErrorBorder: pill(AppColors.error, 1.6),
      errorStyle: const TextStyle(fontSize: 12, height: 1.4),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.green,
        foregroundColor: Colors.white,
        disabledBackgroundColor: AppColors.green.withValues(alpha: 0.5),
        disabledForegroundColor: Colors.white,
        minimumSize: const Size.fromHeight(58),
        shape: const StadiumBorder(),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.green,
        padding: const EdgeInsets.symmetric(horizontal: 6),
        minimumSize: const Size(0, 40),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColors.green,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.tile),
      ),
    ),
  );
}
