import 'package:flutter/material.dart';
import 'package:yammyapp/core/constants/constants.dart';

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
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.primary,
          foregroundColor: textColor ?? AppColors.background,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: function,
        child: Text(
          text,
          style: AppTextStyles.buttonText(color: textColor ?? AppColors.textWhite),
        ),
      ),
    );
  }
}
