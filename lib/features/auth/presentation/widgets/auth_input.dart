import 'package:flutter/material.dart';
import '../../../../core/constants/appTextStyle.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/widgets/custom_field.dart';

class AuthInput extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final String type;
  final FormFieldValidator<dynamic> validator;

  const AuthInput({
    super.key,
    required this.title,
    required this.controller,
    required this.type,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.buttonText(),
        ),
        SizedBox(height: context.screenHeight * 0.005),
        CustomField(
          controller: controller,
          type: type,
          validator: validator,
        ),
        SizedBox(height: context.screenHeight * 0.015),
      ],
    );
  }
}