import 'package:consultant_customer_app/core/constants/app_theme_constants.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();

  // Heading/h1 600 semiBold 24px
  static const headlineLarge = TextStyle(
    fontFamily: AppThemeConstants.fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 24.0,
  );

  // Heading/h1 600 semiBold 20px
  static const headlineMedium = TextStyle(
    fontFamily: AppThemeConstants.fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 20.0,
    height: 1.0
  );

  // body 300 Light 16px 1.26
  static const bodyLarge = TextStyle(
    fontFamily: AppThemeConstants.fontFamily,
    fontWeight: FontWeight.w300,
    fontSize: 16.0,
    height: 1.26,
  );

  // label 500 Medium 14px 1.26
  static const labelLarge = TextStyle(
    fontFamily: AppThemeConstants.fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 14.0,
    height: 1.26,
  );

  // label 400 Regular 16px 1.26
  static const labelMedium = TextStyle(
    fontFamily: AppThemeConstants.fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 16.0,
    height: 1.26,
  );

  // label 400 Regular 14px 1.26
  static const labelSmall = TextStyle(
    fontFamily: AppThemeConstants.fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14.0,
    height: 1.26,
  );

  // title 500 Medium 16px 1.26
  static const titleLarge = TextStyle(
    fontFamily: AppThemeConstants.fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
    height: 1.26,
  );

  // title 400 Medium 12px 1.26
  static const titleMedium = TextStyle(
    fontFamily: AppThemeConstants.fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 12.0,
    height: 1.26,
  );

  // display 400 Regular 14px 1.00 letter spacing: -0.3
  static const displayLarge = TextStyle(
    fontFamily: AppThemeConstants.fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14.0,
    height: 1.0,
    letterSpacing: -0.3
  );
  // display 400 Regular 12px 1.26
  static const displayMedium = TextStyle(
    fontFamily: AppThemeConstants.fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 12.0,
    height: 1.26,
  );

  // display 300 Light 12px 1.26
    static const displaySmall = TextStyle(
    fontFamily: AppThemeConstants.fontFamily,
    fontWeight: FontWeight.w300,
    fontSize: 12.0,
    height: 1.26,
  );
}
