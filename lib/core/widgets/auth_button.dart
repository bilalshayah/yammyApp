import 'package:flutter/material.dart';
import '../constants/appTextStyle.dart';
import '../constants/app_colors.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final VoidCallback? function;
  final Color? color;
  final double? width;
  final Color? textColor;
  const AuthButton({
    super.key,
    required this.text,
    this.function,
    this.color,
    this.width,
    this.textColor ,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          backgroundColor: color ?? AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: function,
        child: Text(text, style: AppTextStyles.buttonText(color: textColor ?? AppColors.background)),
      ),
    );
  }
}
