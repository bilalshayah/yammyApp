import 'package:flutter/material.dart';
import 'package:yammyapp/core/constants/appTextStyle.dart';
import 'package:yammyapp/core/constants/app_colors.dart';
import 'package:yammyapp/core/widgets/custom_button.dart';
import 'package:yammyapp/core/widgets/custom_field.dart';
import 'package:yammyapp/features/auth/presentation/widgets/password_description.dart';

class Body extends StatelessWidget {
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final GlobalKey<FormState> _formState=GlobalKey<FormState>();

   Body({
    super.key,
    required this.passwordController,
    required this.confirmPasswordController,
    });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Form(
          key: _formState,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Description(),
              const SizedBox(height: 43),
              Text(
                "Password",
                style: AppTextStyles.buttonText(color: AppColors.textGray),
              ),
              SizedBox(height: 12),
              CustomField(
                controller: passwordController,
                type: "password",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  } else if (value.length < 6) {
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
              ),
              SizedBox(height: 31),
              Text(
                "Confirm Password",
                style: AppTextStyles.buttonText(color: AppColors.textGray),
              ),
              SizedBox(height: 12),
              CustomField(
                controller: confirmPasswordController,
                type: "password",
                validator: (value) {
                  if (value != passwordController.text) {
                    return "Passwords do not match";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 57),
              CustomButton(
                function: () {
                  if(_formState.currentState!.validate()){
                     // create new password function
                  }
                 
                },
                text: 'Create New Password',
                color: AppColors.primary,
                textColor: AppColors.textWhite,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
