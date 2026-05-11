import 'package:flutter/material.dart';
import 'package:yammyapp/features/auth/presentation/pages/fingerPrint_page/fingerprints_screen.dart';
import 'package:yammyapp/features/auth/presentation/pages/login_page/login_screen.dart';
import 'package:yammyapp/features/auth/presentation/pages/register_page/register_screen.dart';
import 'package:yammyapp/features/auth/presentation/pages/setPassword_page/setPasswordScreen.dart';
import 'package:yammyapp/features/home/presentation/pages/home_page.dart';
import 'package:yammyapp/features/launch/presentation/pages/splash_screen.dart';
import 'package:yammyapp/features/onBoarding/presentation/pages/onboarding_screen.dart';

import '../../features/profile/presentation/pages/myProfile.dart';



class AppRouter {

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/launch':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/onboarding':
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/register':
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/setPassword':
        return MaterialPageRoute(builder: (_) =>  SetPasswordScreen());
      case '/fingerprint':
        return MaterialPageRoute(builder: (_) =>  FingerprintScreen());
      case '/myProfile':
        return MaterialPageRoute(builder: (_) =>  ProfileScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('No route found')),
          ),
        );
    }
  }
}