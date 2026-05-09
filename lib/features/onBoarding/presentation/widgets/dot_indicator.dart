import 'package:flutter/material.dart';
import 'package:yammyapp/core/constants/app_colors.dart';

class DotsIndicator extends StatelessWidget {
  final int currentIndex;
  final int totalPages;

  const DotsIndicator({super.key, required this.currentIndex, required this.totalPages});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPages,
        (i) => _Dot(isActive: i == currentIndex),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final bool isActive;
  const _Dot({this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 20 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : AppColors.textGray,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}