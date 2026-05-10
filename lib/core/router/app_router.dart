import 'package:flutter/material.dart';
import 'package:yammyapp/features/auth/presentation/pages/fingerprints_screen.dart';
import 'package:yammyapp/features/auth/presentation/pages/setPasswordScreen.dart';
import 'package:yammyapp/features/launch/presentation/pages/splash_screen.dart';
import 'package:yammyapp/features/onBoarding/presentation/pages/onboarding_screen.dart';
import 'package:yammyapp/features/orders/presentation/pages/my_orders.dart';



class AppRouter {

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/launch':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/onboarding':
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case '/setPassword':
        return MaterialPageRoute(builder: (_) =>  SetPasswordScreen());
      case '/fingerprint':
        return MaterialPageRoute(builder: (_) =>  FingerprintScreen());
      case '/myOrders':
        return MaterialPageRoute(builder: (_) =>  MyOrdersScreen());


      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('No route found')),
          ),
        );
    }
  }
}