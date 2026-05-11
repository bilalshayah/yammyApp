import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yammyapp/core/constants/constants.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppAssets.emptyOrders,
          width: 150,
          height: 150,
          colorFilter: ColorFilter.mode(
            AppColors.primary.withOpacity(0.3),
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          "You don't have any\nactive orders at this\ntime",
          textAlign: TextAlign.center,
          style: AppTextStyles.h2(color: AppColors.primary),
        ),
      ],
    );
  }
}