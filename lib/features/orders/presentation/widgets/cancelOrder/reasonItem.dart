import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';

class ReasonItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const ReasonItem({super.key, 
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text, style: AppTextStyles.h2()),
              Icon(
                isSelected
                    ? Icons.radio_button_checked
                    : Icons.radio_button_off,
                color: AppColors.primary,
                size: 20,
              ),
            ],
          ),
          const Divider(color: AppColors.divider),
        ],
      ),
    );
  }
}