import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/appTextStyle.dart';
import '../../../../core/constants/app_colors.dart';

Widget buildSectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyles.h2()),
        TextButton(
          onPressed: () {},
          child: Text("View All >", style: AppTextStyles.h3(color: AppColors.primary)),
        ),
      ],
    ),
  );
}