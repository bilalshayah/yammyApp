import 'package:flutter/material.dart';

import '../../../../../core/constants/appTextStyle.dart';
import '../../../../../core/constants/app_appbar.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/icon_container.dart';
import '../../../../../core/widgets/auth_button.dart';
import '../../../../../core/widgets/custom_field.dart';
import '../../../../../core/widgets/navigation_bar.dart';

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
      bottomNavigationBar: NavBar(),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 30,
            ),
            decoration: const BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
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
                  const SizedBox(height: 10),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                    style: AppTextStyles.h3(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Email or Mobile Number",
                    style: AppTextStyles.buttonText(),
                  ),
                  const SizedBox(height: 10),
                  CustomField(
                    controller: emailCont,
                    type: "email",
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Password",
                    style: AppTextStyles.buttonText(),
                  ),
                  const SizedBox(height: 10),
                  CustomField(
                    controller: passCont,
                    type: "password",
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forget Password",
                        style: AppTextStyles.h3(
                          color: AppColors.textOrange,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  AuthButton(
                    text: "Log In",
                    function: () {
                      Navigator.pushNamed(context, "/home");
                    },
                  ),
                  const SizedBox(height: 40),
                  Column(
                    children: [
                      Text(
                        "or sign up with",
                        style: AppTextStyles.h3(),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          IconContainer(
                            path: "assets/icons/Gmail.svg",
                          ),
                          const SizedBox(width: 20),
                          IconContainer(
                            path: "assets/icons/Facebook.svg",
                          ),
                          const SizedBox(width: 20),
                          IconContainer(
                            path: "assets/icons/Mark.svg",
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: (){},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account? ",
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "/register");
                            }, child: Text(  "Sign Up",
                              style: AppTextStyles.h3(
                                color:
                                AppColors.textOrange,
                              ),),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 80),
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