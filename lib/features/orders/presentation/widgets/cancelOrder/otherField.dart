import 'package:flutter/material.dart';
import 'package:yammyapp/core/constants/constants.dart';

class OthersField extends StatelessWidget {
  final TextEditingController controller;
  const OthersField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: 4,
      decoration: InputDecoration(
        hintText: 'Others reason....',
        hintStyle: AppTextStyles.h3(),
        fillColor: AppColors.secondary.withOpacity(0.3),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}