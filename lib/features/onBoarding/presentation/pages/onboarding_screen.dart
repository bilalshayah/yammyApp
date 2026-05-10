import 'package:flutter/material.dart';
import 'package:yammyapp/core/constants/app_assets.dart';
import 'package:yammyapp/features/launch/presentation/pages/welcome_screen.dart';
import 'package:yammyapp/features/onBoarding/presentation/widgets/background_image.dart';
import 'package:yammyapp/features/onBoarding/presentation/widgets/bottom_shape.dart';
import 'package:yammyapp/features/onBoarding/presentation/widgets/skip_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;

  final List<Map<String, String>> _pages = [
    {
      'image': 'assets/images/pizza.png',
      'icon': AppAssets.transfer,
      'title': 'Order For Food',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.',
    },
    {
      'image': 'assets/images/iceCream.png',
      'icon': AppAssets.card,
      'title': 'Easy Payment',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.',
    },
    {
      'image': 'assets/images/coffee.png',
      'icon': AppAssets.delivery,
      'title': 'Fast Delivery',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.',
    },
  ];

  void _onNext() {
    if (_currentIndex < _pages.length - 1) {
      setState(() => _currentIndex++);
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      );
    }
  }

  void _onSkip() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const WelcomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final page = _pages[_currentIndex];

    return Scaffold(
      body: Stack(
        children: [
          BackgroundImage(image: page['image']!),
          SkipButton(onSkip: _onSkip),
          BottomShape(page: page, currentIndex: _currentIndex, totalPages: page.length-1  , onNext: _onNext)
        ],
      ),
    );
  }
}
