import 'package:flutter/material.dart';
import 'core/constants/appTextStyle.dart';
import 'core/constants/app_appbar.dart';
import 'core/constants/app_colors.dart';
import 'core/extensions/context_extensions.dart';
import 'core/icon_container.dart';
import 'core/widgets/auth_button.dart';
import 'core/widgets/custom_field.dart';
import 'core/widgets/navigation_bar.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController passCont = TextEditingController();
    final TextEditingController nameCont = TextEditingController();
    final TextEditingController mobileCont = TextEditingController();
    final TextEditingController dateCont = TextEditingController();
    final TextEditingController emailCont = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.activeCategory,
      extendBody: true,
      appBar: AppAppBar(
        function: () => Navigator.pop(context),
        text: "New Account",
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
                  Text("Full name", style: AppTextStyles.buttonText()),
                  SizedBox(height: context.screenHeight * 0.005),
                  CustomField(controller: nameCont, type: "name"),
                  SizedBox(height: context.screenHeight * 0.015),
                  Text("Password", style: AppTextStyles.buttonText()),
                  SizedBox(height: context.screenHeight * 0.005),
                  CustomField(controller: passCont, type: "password"),
                  SizedBox(height: context.screenHeight * 0.015),
                  Text("Email", style: AppTextStyles.buttonText()),
                  SizedBox(height: context.screenHeight * 0.005),
                  CustomField(controller: emailCont, type: "email"),
                  SizedBox(height: context.screenHeight * 0.015),
                  Text("Mobile Number", style: AppTextStyles.buttonText()),
                  SizedBox(height: context.screenHeight * 0.005),
                  CustomField(controller: mobileCont, type: ""),
                  SizedBox(height: context.screenHeight * 0.015),
                  Text("Date of birth", style: AppTextStyles.buttonText()),
                  SizedBox(height: context.screenHeight * 0.005),
                  CustomField(controller: dateCont, type: "date"),
                  SizedBox(height: context.screenHeight * 0.03),
                  Center(
                    child: SizedBox(
                      width: context.screenWidth * 0.8,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'By continuing, you agree to \n',
                          style: AppTextStyles.subtitle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: 'Terms of Use ',
                              style: AppTextStyles.subtitle(color: AppColors.primary)
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: 'and ',
                              style: AppTextStyles.subtitle(color: Colors.black),
                            ),
                            TextSpan(
                              text: 'Privacy Policy.',
                              style: AppTextStyles.subtitle(color: AppColors.primary)
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: context.screenHeight * 0.025),
                  AuthButton(
                    text: "Sign Up",
                    function: () {},
                  ),
                  SizedBox(height: context.screenHeight * 0.04),
                  Column(
                    children: [
                      Text("or sign up with", style: AppTextStyles.h3()),
                      SizedBox(height: context.screenHeight * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconContainer(path: "assets/icons/Gmail.svg"),
                          SizedBox(width: context.screenWidth * 0.05),
                          IconContainer(path: "assets/icons/Facebook.svg"),
                          SizedBox(width: context.screenWidth * 0.05),
                          IconContainer(path: "assets/icons/Mark.svg"),
                        ],
                      ),
                      SizedBox(height: context.screenHeight * 0.03),
                      GestureDetector(
                        onTap: () => Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (_) => const LoginScreen())),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account? "),
                            Text(
                              "Log In",
                              style: AppTextStyles.h3(color: AppColors.textOrange)
                                  .copyWith(fontWeight: FontWeight.bold),
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