import 'package:flutter/material.dart';

import '../constants/appTextStyle.dart';
import '../constants/app_colors.dart';
import 'custom_button.dart';


class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});
   static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const LogoutDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      content: Text(
        'Are you sure you want to log out?',
        textAlign: TextAlign.center,
        style: AppTextStyles.title(),
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: CustomButton(
                text: 'Cancel',
                color: AppColors.searchBg,
                function: () => Navigator.pop(context),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: CustomButton(
                text: 'Yes, logout',
                function: () {
                  
                  // logout logic here
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}