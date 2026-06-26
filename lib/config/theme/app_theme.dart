import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constants/app_theme_constants.dart';
import 'app_colors.dart';
import 'app_spacing.dart';
import 'app_text_styles.dart';
import 'app_typography.dart';

class AppTheme {
  AppTheme._();

  // Light Theme
  static ThemeData get light => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: Colors.white,
      secondary: AppColors.secondary,
      onSecondary: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black,
      onTertiary: Colors.grey,
      surfaceContainerHighest: AppColors.textFieldColor,
      onSurfaceVariant: AppColors.onTextFieldColor,
      surfaceContainerHigh: Color(0xFFF8F8F8),
      
    ),
    fontFamily: AppThemeConstants.fontFamily,
    textTheme: AppTypography.textTheme,
    // textTheme: const TextTheme(
    //   headlineLarge: AppTextStyles.headlineLarge,
    //   headlineMedium: AppTextStyles.headlineMedium,
    //   headlineSmall: AppTextStyles.headlineSmall,
    //   bodyLarge: AppTextStyles.bodyLarge,
    //   bodyMedium: AppTextStyles.bodyMedium,
    //   displayLarge: AppTextStyles.displayLarge,
    //   displayMedium: AppTextStyles.displayMedium,
    //   displaySmall: AppTextStyles.displaySmall,
    //   labelLarge: AppTextStyles.labelLarge,
    //   labelMedium: AppTextStyles.labelMedium,
    //   labelSmall: AppTextStyles.labelSmall,
    //   titleLarge: AppTextStyles.titleLarge,
    //   titleMedium: AppTextStyles.titleMedium,
    // ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        // disabledBackgroundColor: AppColors.primary.withValues(alpha: 0.5),
        // disabledForegroundColor: Colors.white.withValues(alpha: 0.7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.s4),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSpacing.s4),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSpacing.s4),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSpacing.s4),
        borderSide: const BorderSide(color: AppColors.primary, width: 2.0),
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 16.0,
      ),
      hintStyle: AppTextStyles.bodyLarge.copyWith(
        height: 0.0,
        color: AppColors.onTextFieldColor,
      ),
    ),
    appBarTheme: const AppBarTheme(
      surfaceTintColor: Colors.transparent,
      scrolledUnderElevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
    ),
  );
}
