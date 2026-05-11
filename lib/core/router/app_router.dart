import 'package:flutter/material.dart';
import 'package:yammyapp/core/storage/storage_service.dart';
import 'package:yammyapp/features/launch/presentation/pages/welcome_screen.dart';
import '../../features/auth/presentation/pages/fingerprints_screen.dart';
import '../../features/auth/presentation/pages/login_screen.dart';
import '../../features/auth/presentation/pages/register_screen.dart';
import '../../features/auth/presentation/pages/setPasswordScreen.dart';
import '../../features/home/presentation/pages/test_home_page.dart';
import '../../features/launch/presentation/pages/splash_screen.dart';
import '../../features/onBoarding/presentation/pages/onboarding_screen.dart';
import '../../features/orders/presentation/pages/my_orders.dart';
import '../utils/auth_helper.dart';

class AppRouter {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String welcome = '/welcome';
  static const String home = '/home';
  static const String setPassword = '/setPassword';
  static const String fingerprint = '/fingerprint';
  static const String myOrders = '/myOrders';

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

        case welcome:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());

      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case register:
        return MaterialPageRoute(builder: (_) => RegisterScreen());

      case home:
        return MaterialPageRoute(
          builder: (context) {
            return FutureBuilder<bool>(
              future: AuthHelper.isAuthenticated(StorageService()),
              builder: (context, snapshot) {
                if (snapshot.data == true) {
                  return TestHomePage();
                } else {
                  return LoginScreen();
                }
              },
            );
          },
        );

      case setPassword:
        final token = settings.arguments as String? ?? "";
        return MaterialPageRoute(
          builder: (_) => SetPasswordScreen(token: token),
        );

      case fingerprint:
        return MaterialPageRoute(builder: (_) => FingerprintScreen());

      case myOrders:
        return MaterialPageRoute(builder: (_) => MyOrdersScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}