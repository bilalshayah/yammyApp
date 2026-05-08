import 'package:flutter/material.dart';
import 'package:foodly_ecosystem/core/constants/constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? function;
  final Color? color;
  final Color? textColor;
  const CustomButton({
    super.key,
    required this.text,
    this.function,
    this.color = AppColors.primary,
    this.textColor = AppColors.background,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
          backgroundColor: color,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: function,
        child: Text(text, style: AppTextStyles.buttonText),
      ),
    );
  }
}
