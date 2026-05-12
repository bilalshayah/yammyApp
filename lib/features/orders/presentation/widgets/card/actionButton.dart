import 'package:flutter/material.dart';
import 'package:yammyapp/core/constants/constants.dart';
import 'package:yammyapp/features/orders/presentation/widgets/card/cardButton.dart';

class ActionButtons extends StatelessWidget {
  final VoidCallback onCancel;
  const ActionButtons({super.key, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CardButton(
          text: 'Cancel Order',
          color: AppColors.primary,
          textColor: AppColors.textWhite,
          onTap: onCancel,
        ),
        const SizedBox(width: 8),
        CardButton(
          text: 'Track Driver',
          color: AppColors.orange,
          textColor: AppColors.primary,
          onTap: () {
            
          },
        ),
      ],
    );
  }
}
