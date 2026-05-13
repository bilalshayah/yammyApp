import 'package:flutter/material.dart';
import 'package:yammyapp/core/constants/constants.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 24),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.chevron_left,
                color: AppColors.primary,
                size: 28,
              ),
            ),
          ),
          Text(
            'Leave a Review',
            style: AppTextStyles.h2(color: AppColors.textWhite2),
          ),
        ],
      ),
    );
  }
}