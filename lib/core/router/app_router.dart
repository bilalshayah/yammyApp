import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth/presentation/pages/fingerPrint_page/fingerprints_screen.dart';
import '../../features/auth/presentation/pages/login_screen.dart';
import '../../features/auth/presentation/pages/register_screen.dart';
import '../../features/auth/presentation/pages/setPassword_page/setPasswordScreen.dart';
import '../../features/cart/presentation/pages/cart_screen.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/launch/presentation/pages/splash_screen.dart';
import '../../features/launch/presentation/pages/welcome_screen.dart';
import '../../features/notifications/presentation/pages/notification_screen.dart';
import '../../features/onBoarding/presentation/pages/onboarding_screen.dart';
import '../../features/orders/presentation/pages/my_orders.dart';
import '../../features/profile/presentation/bloc/address/addressBloc.dart';
import '../../features/profile/presentation/pages/addAddressScreen.dart';
import '../../features/profile/presentation/pages/address_screen.dart';
import '../../features/profile/presentation/pages/myProfile.dart';
import '../storage/storage_service.dart';
import '../utils/auth_helper.dart';

class AppRouter {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String welcome = '/welcome';
  static const String home = '/home';
  static const String notifications = '/notifications';
  static const String setPassword = '/setPassword';
  static const String fingerprint = '/fingerprint';
  static const String myOrders = '/myOrders';
  static const String myProfile = '/myProfile';
  static const String myAddress = '/DeliveryAddress';
  static const String cart = '/cart';
  static const String addAddress = '/addAddress';

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

        case welcome:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());

      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case notifications:
        return MaterialPageRoute(builder: (_) => NotificationScreen());

      case cart:
        return MaterialPageRoute(builder: (_) => CartScreen());

      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case register:
        return MaterialPageRoute(builder: (_) => RegisterScreen());

      case myProfile:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case addAddress:
        final addressBloc = settings.arguments as AddressBloc?;
        if (addressBloc != null) {
          return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: addressBloc,
              child: const AddAddressScreen(),
            ),
          );
        }
        return MaterialPageRoute(builder: (_) => const AddAddressScreen());
      case myAddress:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AddressBloc(Dio()),
            child: const DeliveryAddressScreen(),
          ),
        );
      case home:
        return MaterialPageRoute(
          builder: (context) {
            return FutureBuilder<bool>(
              future: AuthHelper.isAuthenticated(StorageService()),
              builder: (context, snapshot) {
                if (snapshot.data == true) {
                  return HomePage();
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