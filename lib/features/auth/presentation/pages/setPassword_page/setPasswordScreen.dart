import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yammyapp/core/constants/app_appbar.dart';
import 'package:yammyapp/core/constants/constants.dart';
import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_field.dart';
import '../../../../../core/widgets/navigation_bar.dart';
import '../../bloc/auth_bloc.dart';
import '../../bloc/auth_event.dart';
import '../../bloc/auth_state.dart';
import '../login_screen.dart';

class SetPasswordScreen extends StatefulWidget {
  final String token;
  const SetPasswordScreen({super.key, required this.token});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Password Reset Successfully"),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const LoginScreen()),
          );
        }
        if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppAppBar(
            text: "Set Password",
            function: () => Navigator.pop(context),
          ),
          extendBody: true,
          bottomNavigationBar: const NavBar(),
          backgroundColor: AppColors.body,
          body: Stack(children: [
            Container(
              width: double.infinity,
              height: context.screenHeight,
              margin: EdgeInsets.only(top: context.screenHeight * 0.02),
              padding: EdgeInsets.symmetric(
                horizontal: context.screenWidth * 0.06,
                vertical: context.screenHeight * 0.03,
              ),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(context.screenWidth * 0.12),
                  topRight: Radius.circular(context.screenWidth * 0.12),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formState,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      const Text(
                        'Please enter your new password to secure your account.',
                      ),
                      const SizedBox(height: 43),
                      Text(
                        "Password",
                        style: AppTextStyles.buttonText(color: AppColors.textGray),
                      ),
                      const SizedBox(height: 12),
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
                      const SizedBox(height: 31),
                      Text(
                        "Confirm Password",
                        style: AppTextStyles.buttonText(color: AppColors.textGray),
                      ),
                      const SizedBox(height: 12),
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
                      state is AuthLoading
                          ? const Center(child: CircularProgressIndicator())
                          : CustomButton(
                        function: () {
                          if (_formState.currentState!.validate()) {
                            context.read<AuthBloc>().add(
                              ResetPasswordSubmitted(
                                token: widget.token,
                                newPassword: passwordController.text,
                              ),
                            );
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
            ),
          ]),
        );
      },
    );
  }
}