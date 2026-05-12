import 'package:flutter/material.dart';
import '../../../../core/constants/appTextStyle.dart';

class CartSummary extends StatelessWidget {

  final String label;
  final String value;

  const CartSummary(this.label, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: AppTextStyles.price(color: Colors.white)),
            Text(value, style: AppTextStyles.price(color: Colors.white,)),
          ],
        ),
      );
  }
}
