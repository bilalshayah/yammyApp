import 'package:flutter/material.dart';
import 'package:yammyapp/core/constants/svg_icon.dart';

import 'appTextStyle.dart';
import 'app_colors.dart';

class AppAppBar extends AppBar {
  final String text;
  final String? subTitle;
  final bool iSArrowIcon;
  final VoidCallback? function;

  AppAppBar({
    super.key,
    this.iSArrowIcon = true,
    required this.text,
    this.subTitle,
    this.function,
  }) : super(
    toolbarHeight: 120,
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
    title: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: AppTextStyles.h1(color: AppColors.background),
        ),
        if (subTitle != null) ...[
          const SizedBox(height: 4),
          Text(
            subTitle,
            style: TextStyle(
              color: AppColors.textOrange,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ],
    ),
  );
}