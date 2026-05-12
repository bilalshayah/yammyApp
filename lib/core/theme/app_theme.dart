import 'package:flutter/material.dart';
import '../constants/appTextStyle.dart';
import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        fontFamily: 'LeagueSpartan',
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.light(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
        ),
        dividerColor: AppColors.divider,
        textTheme: TextTheme(
          displayLarge: AppTextStyles.h1(),
          displayMedium: AppTextStyles.h2(),
          labelLarge: AppTextStyles.buttonText(),
          bodySmall: AppTextStyles.label(),
          titleMedium: AppTextStyles.subtitle(),
          titleLarge: AppTextStyles.title(), // Poppins SemiBold
        ),
      );
}