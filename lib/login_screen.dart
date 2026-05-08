import 'package:flutter/material.dart';
import 'package:foodly_ecosystem/register_screen.dart';
import 'core/constants/appTextStyle.dart';
import 'core/constants/app_appbar.dart';
import 'core/constants/app_colors.dart';
import 'core/extensions/context_extensions.dart';
import 'core/icon_container.dart';
import 'core/widgets/auth_button.dart';
import 'core/widgets/custom_field.dart';
import 'core/widgets/navigation_bar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController passCont = TextEditingController();
    final TextEditingController emailCont = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.activeCategory,
      extendBody: true,
      appBar: AppAppBar(
        text: "Log In",
      ),
      bottomNavigationBar: const NavBar(),
      body: Stack(
        children: [
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome",
                    style: AppTextStyles.h2(),
                  ),
                  SizedBox(height: context.screenHeight * 0.01),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                    style: AppTextStyles.h3(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: context.screenHeight * 0.03),
                  Text(
                    "Email or Mobile Number",
                    style: AppTextStyles.buttonText(),
                  ),
                  SizedBox(height: context.screenHeight * 0.01),
                  CustomField(
                    controller: emailCont,
                    type: "email",
                  ),
                  SizedBox(height: context.screenHeight * 0.02),
                  Text(
                    "Password",
                    style: AppTextStyles.buttonText(),
                  ),
                  SizedBox(height: context.screenHeight * 0.01),
                  CustomField(
                    controller: passCont,
                    type: "password",
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        "Forget Password",
                        style: AppTextStyles.h3(
                          color: AppColors.textOrange,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: context.screenHeight * 0.03),
                  AuthButton(
                    text: "Log In",
                    function: () {},
                  ),
                  SizedBox(height: context.screenHeight * 0.04),
                  Column(
                    children: [
                      Text(
                        "or sign up with",
                        style: AppTextStyles.h3(),
                      ),
                      SizedBox(height: context.screenHeight * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconContainer(
                            path: "assets/icons/Gmail.svg",
                          ),
                          SizedBox(width: context.screenWidth * 0.05),
                          IconContainer(
                            path: "assets/icons/Facebook.svg",
                          ),
                          SizedBox(width: context.screenWidth * 0.05),
                          IconContainer(
                            path: "assets/icons/Mark.svg",
                          ),
                        ],
                      ),
                      SizedBox(height: context.screenHeight * 0.03),
                      GestureDetector(
                        onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => const RegisterScreen())),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account? ",
                            ),
                            Text(
                              "Sign Up",
                              style: AppTextStyles.h3(
                                color: AppColors.textOrange,
                              ).copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: context.screenHeight * 0.1),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}