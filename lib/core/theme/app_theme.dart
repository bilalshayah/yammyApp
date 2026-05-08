import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/appTextStyle.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        fontFamily: 'LeagueSpartan',   // default font
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.light(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
        ),
        dividerColor: AppColors.divider,
        textTheme: const TextTheme(
          displayLarge: AppTextStyles.h1,
          displayMedium: AppTextStyles.h2,
          labelLarge: AppTextStyles.buttonText,
          bodySmall: AppTextStyles.label,
          titleMedium: AppTextStyles.subtitle,
          titleLarge: AppTextStyles.title, // Poppins SemiBold

        ),
      );
}