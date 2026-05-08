import 'package:flutter/material.dart';

import '../../features/auth/presentation/pages/login_page/login_screen.dart';
import '../../features/auth/presentation/pages/register_page/register_screen.dart';

class AppRouter {

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case '/register':
        return MaterialPageRoute(builder: (_) => const RegisterScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('No route found')),
          ),
        );
    }
  }
}
