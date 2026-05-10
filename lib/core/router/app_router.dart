import 'package:flutter/material.dart';
import '../../features/auth/presentation/pages/fingerprints_screen.dart';
import '../../features/auth/presentation/pages/login_screen.dart';
import '../../features/auth/presentation/pages/register_screen.dart';
import '../../features/auth/presentation/pages/setPasswordScreen.dart';
import '../../features/launch/presentation/pages/splash_screen.dart';
import '../../features/onBoarding/presentation/pages/onboarding_screen.dart';
import '../../features/orders/presentation/pages/my_orders.dart';

class AppRouter {

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case '/register':
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case '/launch':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/onboarding':
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case '/setPassword':
        return MaterialPageRoute(builder: (_) => SetPasswordScreen(token: "string",));
      case '/fingerprint':
        return MaterialPageRoute(builder: (_) => FingerprintScreen());
      case '/myOrders':
        return MaterialPageRoute(builder: (_) => MyOrdersScreen());

      default:
        return MaterialPageRoute(
          builder: (_) =>
          const Scaffold(
            body: Center(child: Text('No route found')),
          ),
        );
    }
  }
}