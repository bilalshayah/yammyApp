import 'package:flutter/material.dart';
import 'package:yammyapp/core/constants/constants.dart';
import 'package:yammyapp/features/auth/presentation/widgets/password_body.dart';
import 'package:yammyapp/features/auth/presentation/widgets/password_header.dart';

class SetPasswordScreen extends StatelessWidget {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  SetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.body,
      body: Column(
        children: [
          Header(),
          Body(
            passwordController: _passwordController,
            confirmPasswordController: _confirmPasswordController,
          ),
        ],
      ),
    );
  }
}
