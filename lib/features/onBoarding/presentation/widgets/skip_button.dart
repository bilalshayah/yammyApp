import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yammyapp/core/constants/appTextStyle.dart';
import 'package:yammyapp/core/constants/app_assets.dart';
import 'package:yammyapp/core/constants/app_colors.dart';

class SkipButton extends StatelessWidget {
  final VoidCallback onSkip;
  const SkipButton({super.key, required this.onSkip});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 35,
      right: 35,
      child: GestureDetector(
        onTap: onSkip,
        child: Row(
          children: [
            Text("Skip", style: AppTextStyles.skip(color: AppColors.primary)),
            const SizedBox(width: 4),
            SvgPicture.asset(
              AppAssets.nextArrow,
              colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
            ),
          ],
        ),
      ),
    );
  }
}