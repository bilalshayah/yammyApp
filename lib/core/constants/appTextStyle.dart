import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextStyle _league(
      double size,
      FontWeight weight,
      Color defaultColor,
      Color? customColor,
      ) {
    return TextStyle(
      fontFamily: 'LeagueSpartan',
      fontSize: size,
      fontWeight: weight,
      color: customColor ?? defaultColor,
    );
  }

  static TextStyle _poppins(
      double size,
      FontWeight weight,
      Color defaultColor,
      Color? customColor,
      ) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: size,
      fontWeight: weight,
      color: customColor ?? defaultColor,
    );
  }

  static TextStyle h1({Color? color}) =>
      _league(28, FontWeight.w700, AppColors.textPrimary, color);

  static TextStyle h2({Color? color}) =>
      _league(24, FontWeight.w600, AppColors.textPrimary, color);

  static TextStyle h3({Color? color}) =>
      _league(14, FontWeight.w300, AppColors.textPrimary, color);

  static TextStyle label({Color? color}) =>
      _league(12, FontWeight.w400, AppColors.textPrimary, color);

  static TextStyle buttonText({Color? color}) =>
      _league(20, FontWeight.w500, AppColors.textPrimary, color);

  static TextStyle skip({Color? color}) =>
      _league(20, FontWeight.w600, AppColors.textWhite, color);

  static TextStyle activetab({Color? color}) =>
      _league(17, FontWeight.w500, AppColors.textWhite, color);
  static TextStyle tab({Color? color}) =>
      _league(17, FontWeight.w400, AppColors.textWhite, color);

  static TextStyle description({Color? color}) =>
      _league(14, FontWeight.w500, AppColors.textWhite, color);

  static TextStyle subtitle({Color? color}) =>
      _league(12, FontWeight.w300, AppColors.textOrange, color);

  static TextStyle searchHint({Color? color}) =>
      _league(12, FontWeight.w300, AppColors.textGray, color);

  static TextStyle price({Color? color}) =>
      _league(18, FontWeight.w400, AppColors.primary, color);

  static TextStyle rate({Color? color}) =>
      _league(12, FontWeight.w400, AppColors.background, color);

  static TextStyle hint({Color? color}) =>
      _league(20, FontWeight.w400, AppColors.textPrimary, color);

  static TextStyle title({Color? color}) =>
      _poppins(18, FontWeight.w600, AppColors.textPrimary, color);

  static TextStyle yumQuick({Color? color}) =>
      _poppins(34.85, FontWeight.w800, AppColors.textPrimary, color);
}