import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yammyapp/core/constants/constants.dart';
import 'package:yammyapp/core/widgets/auth_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),

            // logo
            SvgPicture.asset(
              AppAssets.logo,
              width: 140,
              colorFilter: ColorFilter.mode(
                AppColors.secondary,
                BlendMode.srcIn,
              ),
            ),

            const SizedBox(height: 16),

            // app name
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'YUM',
                    style: AppTextStyles.h1(color: AppColors.secondary),
                  ),
                  TextSpan(
                    text: 'QUICK',
                    style: AppTextStyles.h1(color: AppColors.textWhite),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // description
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.',
              textAlign: TextAlign.center,
              style: AppTextStyles.description(),
            ),

            const Spacer(),

            // login button
            AuthButton(
              text: 'Log In',
              color: AppColors.secondary,
              function: () {
                // navigate to login
              },
            ),

            const SizedBox(height: 12),

            // signup button
            AuthButton(
              text: 'Sign Up',
              color: Colors.transparent,
              function: () {
                // navigate to signup
              },
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
