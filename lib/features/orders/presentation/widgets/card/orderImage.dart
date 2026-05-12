import 'package:flutter/material.dart';

class OrderImage extends StatelessWidget {
  final int index;
  const OrderImage({super.key, required this.index});

  static const List<String> _images = [
    'assets/images/pizza.png',
    'assets/images/iceCream.png',
    'assets/images/coffee.png',
  ];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        _images[index % _images.length],
        width: 90,
        height: 110,
        fit: BoxFit.cover,
      ),
    );
  }
}