import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  final String image;
  const BackgroundImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: Image.asset(
        image,
        key: ValueKey(image),
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}