import 'package:flutter/material.dart';
import 'package:yammyapp/core/constants/constants.dart';

class FingerprintDescription extends StatelessWidget {
  const FingerprintDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.',
      style: AppTextStyles.h3(color: AppColors.textGray),
    );
  }
}

