import 'package:flutter/material.dart';
import 'package:yammyapp/features/launch/presentation/pages/splash_screen.dart';
import 'package:yammyapp/features/onBoarding/presentation/pages/onboarding_screen.dart';



class AppRouter {

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/launch':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/onboarding':
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());


      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('No route found')),
          ),
        );
    }
  }
}