import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../languages/lang.dart';
import 'app_colors.dart';
import 'styles.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    primaryColor: AppColors.primaryLight,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primaryLight,
      onPrimary: AppColors.onPrimaryLight,
      secondary: AppColors.secondaryLight,
      onSecondary: AppColors.onSecondaryLight,
      surface: AppColors.surfaceLight,
      onSurface: AppColors.onSurfaceLight,
      error: AppColors.errorLight,
      onError: AppColors.onErrorLight,
    ),
    textTheme: TextTheme(
      displayLarge: Styles.bold(
        context,
        32,
        color: AppColors.onBackgroundLight,
      ),
      displayMedium: Styles.bold(
        context,
        28,
        color: AppColors.onBackgroundLight,
      ),
      displaySmall: Styles.semiBold(
        context,
        24,
        color: AppColors.onBackgroundLight,
      ),
      headlineLarge: Styles.bold(
        context,
        22,
        color: AppColors.onBackgroundLight,
      ),
      headlineMedium: Styles.semiBold(
        context,
        20,
        color: AppColors.onBackgroundLight,
      ),
      headlineSmall: Styles.medium(
        context,
        18,
        color: AppColors.onBackgroundLight,
      ),
      titleLarge: Styles.semiBold(
        context,
        18,
        color: AppColors.onBackgroundLight,
      ),
      titleMedium: Styles.medium(
        context,
        16,
        color: AppColors.onBackgroundLight,
      ),
      titleSmall: Styles.regular(
        context,
        14,
        color: AppColors.onBackgroundLight,
      ),
      bodyLarge: Styles.regular(
        context,
        16,
        color: AppColors.onBackgroundLight,
      ),
      bodyMedium: Styles.regular(
        context,
        14,
        color: AppColors.onBackgroundLight,
      ),
      bodySmall: Styles.light(context, 12, color: AppColors.onBackgroundLight),
      labelLarge: Styles.medium(
        context,
        14,
        color: AppColors.onBackgroundLight,
      ),
      labelMedium: Styles.regular(
        context,
        12,
        color: AppColors.onBackgroundLight,
      ),
      labelSmall: Styles.light(context, 10, color: AppColors.onBackgroundLight),
    ),
    fontFamily: context.locale.languageCode == 'ar'
        ? LanguageHelper.arabicFontFamily
        : LanguageHelper.englishFontFamily,
    appBarTheme: const AppBarTheme(
      scrolledUnderElevation: 0,

      elevation: 0,
      backgroundColor: AppColors.backgroundLight,
      iconTheme: IconThemeData(color: AppColors.black),
    ),
    cardTheme: CardThemeData(
      color: AppColors.surfaceLight,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryLight,
      foregroundColor: AppColors.onPrimaryLight,
      shape: CircleBorder(),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surfaceLight,
      contentPadding: const EdgeInsets.all(14.0),
      isDense: true,
      hintStyle: Styles.regular(
        context,
        14,
        color: AppColors.onSurfaceLight.withValues(alpha: 0.6),
      ),
      labelStyle: Styles.medium(
        context,
        14,
        color: AppColors.onSurfaceLight.withValues(alpha: 0.8),
      ),
      focusColor: AppColors.primaryLight,
      floatingLabelStyle: Styles.semiBold(
        context,
        16,
        color: AppColors.primaryLight,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: AppColors.gray53),
        borderRadius: BorderRadius.circular(8.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: AppColors.gray53, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: AppColors.primaryLight),
        borderRadius: BorderRadius.circular(8.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.onErrorLight, width: 1),
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(AppColors.primaryLight),
        foregroundColor: WidgetStateProperty.all<Color>(
          AppColors.black1D.withValues(alpha: 0.12),
        ),
        overlayColor: WidgetStateProperty.all<Color>(
          AppColors.primaryLight.withValues(alpha: 0.1),
        ),
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.surfaceLight,
    ),
  );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    primaryColor: AppColors.primaryDark,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primaryDark,
      onPrimary: AppColors.onPrimaryDark,
      secondary: AppColors.secondaryDark,
      onSecondary: AppColors.onSecondaryDark,
      surface: AppColors.surfaceDark,
      onSurface: AppColors.onSurfaceDark,
      error: AppColors.errorDark,
      onError: AppColors.onErrorDark,
    ),
    textTheme: TextTheme(
      displayLarge: Styles.bold(context, 32, color: AppColors.onBackgroundDark),
      displayMedium: Styles.bold(
        context,
        28,
        color: AppColors.onBackgroundDark,
      ),
      displaySmall: Styles.semiBold(
        context,
        24,
        color: AppColors.onBackgroundDark,
      ),
      headlineLarge: Styles.bold(
        context,
        22,
        color: AppColors.onBackgroundDark,
      ),
      headlineMedium: Styles.semiBold(
        context,
        20,
        color: AppColors.onBackgroundDark,
      ),
      headlineSmall: Styles.medium(
        context,
        18,
        color: AppColors.onBackgroundDark,
      ),
      titleLarge: Styles.semiBold(
        context,
        18,
        color: AppColors.onBackgroundDark,
      ),
      titleMedium: Styles.medium(
        context,
        16,
        color: AppColors.onBackgroundDark,
      ),
      titleSmall: Styles.regular(
        context,
        14,
        color: AppColors.onBackgroundDark,
      ),
      bodyLarge: Styles.regular(context, 16, color: AppColors.onBackgroundDark),
      bodyMedium: Styles.regular(
        context,
        14,
        color: AppColors.onBackgroundDark,
      ),
      bodySmall: Styles.light(context, 12, color: AppColors.onBackgroundDark),
      labelLarge: Styles.medium(context, 14, color: AppColors.onBackgroundDark),
      labelMedium: Styles.regular(
        context,
        12,
        color: AppColors.onBackgroundDark,
      ),
      labelSmall: Styles.light(context, 10, color: AppColors.onBackgroundDark),
    ),
    fontFamily: context.locale.languageCode == 'ar'
        ? LanguageHelper.arabicFontFamily
        : LanguageHelper.englishFontFamily,
    appBarTheme: const AppBarTheme(
      scrolledUnderElevation: 0,
      elevation: 0,
      backgroundColor: AppColors.backgroundDark,
      iconTheme: IconThemeData(color: AppColors.white),
    ),
    cardTheme: CardThemeData(
      color: AppColors.surfaceDark,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryDark,
      foregroundColor: AppColors.onPrimaryDark,
      shape: CircleBorder(),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.primaryDark,
      contentPadding: const EdgeInsets.all(14.0),
      isDense: true,
      hintStyle: Styles.regular(
        context,
        14,
        color: AppColors.onSurfaceDark.withValues(alpha: 0.6),
      ),
      labelStyle: Styles.medium(
        context,
        14,
        color: AppColors.onSurfaceDark.withValues(alpha: 0.8),
      ),
      focusColor: AppColors.primaryDark,
      floatingLabelStyle: Styles.semiBold(
        context,
        16,
        color: AppColors.primaryDark,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: AppColors.surfaceDark),
        borderRadius: BorderRadius.circular(8.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: AppColors.surfaceDark, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: AppColors.surfaceDark),
        borderRadius: BorderRadius.circular(8.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.errorDark, width: 1),
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(AppColors.primaryDark),
        foregroundColor: WidgetStateProperty.all<Color>(
          AppColors.onPrimaryDark,
        ),
        overlayColor: WidgetStateProperty.all<Color>(
          AppColors.primaryDark.withValues(alpha: 0.1),
        ),
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.surfaceDark,
    ),
  );
}
