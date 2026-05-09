import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yammyapp/core/constants/appTextStyle.dart';
import 'package:yammyapp/core/constants/app_colors.dart';

class PageContent extends StatelessWidget {
  final Map<String, String> page;
  final int currentIndex;

  const PageContent({super.key, required this.page, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      child: SizedBox(
        key: ValueKey(currentIndex),
        width: double.infinity,
        child: Column(
          children: [
            SvgPicture.asset(page['icon']!),
            const SizedBox(height: 12),
            Text(page['title']!, style: AppTextStyles.h1()),
            const SizedBox(height: 8),
            Text(
              page['description']!,
              textAlign: TextAlign.center,
              style: AppTextStyles.description(color: AppColors.textPrimary),
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}