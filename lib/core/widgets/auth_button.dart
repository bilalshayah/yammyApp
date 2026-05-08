import 'package:flutter/material.dart';
import '../constants/appTextStyle.dart';
import '../constants/app_colors.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final VoidCallback? function;
  final Color? color;
  const AuthButton({
    super.key,
    required this.text,
    this.function,
    this.color = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: function,
        child: Text(text, style: AppTextStyles.buttonText(color: AppColors.background)),
      ),
    );
  }
}
