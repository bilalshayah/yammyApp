import 'package:flutter/material.dart';
import 'package:foodly_ecosystem/core/constants/svg_icon.dart';
import 'appTextStyle.dart';
import 'app_colors.dart';

class AppAppBar extends AppBar {
  final String text;
  final bool iSArrowIcon;
  final VoidCallback? function;

  AppAppBar({
    super.key,
    this.iSArrowIcon = true,
    required this.text,
    this.function,
  }) : super(
    toolbarHeight: 150,
    backgroundColor: AppColors.activeCategory,
    elevation: 0,
    scrolledUnderElevation: 0,
    surfaceTintColor: Colors.transparent,
    centerTitle: true,
    leading: iSArrowIcon
        ? IconButton(
      onPressed: function ?? () {},
      icon: SvgIcon(
        width: 20,
        height: 20,
        path: "assets/icons/Back icon Arrow.svg",
      ),
    )
        : null,
    title: Text(
      text,
      style: AppTextStyles.h1(color: AppColors.background),
    ),
  );
}