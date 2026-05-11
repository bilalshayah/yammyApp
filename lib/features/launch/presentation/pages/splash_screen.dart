import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yammyapp/core/constants/constants.dart';
import 'package:yammyapp/features/launch/presentation/pages/welcome_screen.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/storage/storage_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _checkAuth();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward();

    // navigate to welcome after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
          context, AppRouter.welcome);
    });
    }

  Future<void> _checkAuth() async {
    final token = await StorageService().getToken();
    if (token != null && token.isNotEmpty) {
      Navigator.pushReplacementNamed(context, AppRouter.home);
    } else {
      Navigator.pushReplacementNamed(context, AppRouter.onboarding);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppAssets.logo, width: 120),
              const SizedBox(height: 16),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'YUM',
                      style: AppTextStyles.h1(color:AppColors.primary ),
                    ),
                    TextSpan(
                      text: 'QUICK',
                      style: AppTextStyles.h1(color: AppColors.textPrimary ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}