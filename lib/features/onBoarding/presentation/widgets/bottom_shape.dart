import 'package:flutter/material.dart';
import 'package:yammyapp/core/constants/app_colors.dart';
import 'package:yammyapp/core/widgets/custom_button.dart';
import 'package:yammyapp/features/onBoarding/presentation/widgets/dot_indicator.dart';
import 'package:yammyapp/features/onBoarding/presentation/widgets/page_content.dart';

class BottomShape extends StatelessWidget {
  final Map<String, String> page;
  final int currentIndex;
  final int totalPages;
  final VoidCallback onNext;

  const BottomShape({super.key, 
    required this.page,
    required this.currentIndex,
    required this.totalPages,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        decoration: const BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            PageContent(page: page, currentIndex: currentIndex),
            const SizedBox(height: 16),
            DotsIndicator(currentIndex: currentIndex, totalPages: totalPages),
            const SizedBox(height: 16),
            CustomButton(
              text: currentIndex == totalPages - 1 ? "Get Started" : "Next",
              function: onNext,
              textColor: AppColors.searchBg,
            ),
          ],
        ),
      ),
    );
  }
}
